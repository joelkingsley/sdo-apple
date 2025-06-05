import XCTest
@testable import SDO

class MockTokenRepositoryForRevoke: TokenRepository {
    var shouldSucceed = true
    var shouldThrowCustomError = false
    var revokeResponse: RevokeAppleTokenResponse?
    var error: Error?

    func revokeAppleIdRefreshToken(refreshToken: String) async -> Result<RevokeAppleTokenResponse, Error> {
        if shouldSucceed, let response = revokeResponse {
            return .success(response)
        } else if shouldThrowCustomError {
            return .failure(BusinessErrors.customError(message: "Custom error"))
        } else if let error = error {
            return .failure(error)
        } else {
            return .failure(NSError(domain: "Test", code: 1, userInfo: nil))
        }
    }

    // Required to conform to protocol, but not used in these tests
    func getAppleIdRefreshToken(authorizationCode: String) async -> Result<AppleTokenResponse, Error> {
        return .failure(NSError(domain: "Test", code: 0, userInfo: nil))
    }
}

final class RevokeAppleIdRefreshTokenUseCaseTests: XCTestCase {
    func testExecute_Success() async {
        let mockRepo = MockTokenRepositoryForRevoke()
        let expectedResponse = RevokeAppleTokenResponse(success: true)
        mockRepo.shouldSucceed = true
        mockRepo.revokeResponse = expectedResponse
        let useCase = RevokeAppleIdRefreshTokenUseCase(tokenRepository: mockRepo)

        let result = await useCase.execute(refreshToken: "refreshToken")
        switch result {
        case .success(let response):
            XCTAssertTrue(response.success)
        default:
            XCTFail("Expected success")
        }
    }

    func testExecute_CustomBusinessError() async {
        let mockRepo = MockTokenRepositoryForRevoke()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = true
        let useCase = RevokeAppleIdRefreshTokenUseCase(tokenRepository: mockRepo)

        let result = await useCase.execute(refreshToken: "refreshToken")
        switch result {
        case .failure(let error):
            XCTAssertTrue(error is BusinessError)
        default:
            XCTFail("Expected failure with BusinessError")
        }
    }

    func testExecute_GenericError() async {
        let mockRepo = MockTokenRepositoryForRevoke()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = false
        mockRepo.error = NSError(domain: "Test", code: 2, userInfo: nil)
        let useCase = RevokeAppleIdRefreshTokenUseCase(tokenRepository: mockRepo)

        let result = await useCase.execute(refreshToken: "refreshToken")
        switch result {
        case .failure(let error):
            XCTAssertFalse(error is BusinessError)
        default:
            XCTFail("Expected failure with generic error")
        }
    }
}
