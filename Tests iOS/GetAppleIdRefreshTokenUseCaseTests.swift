import XCTest
@testable import SDO

class MockTokenRepository: TokenRepository {
    var shouldSucceed = true
    var shouldThrowCustomError = false
    var appleTokenResponse: AppleTokenResponse?
    var error: Error?

    func getAppleIdRefreshToken(authorizationCode: String) async -> Result<AppleTokenResponse, Error> {
        if shouldSucceed, let response = appleTokenResponse {
            return .success(response)
        } else if shouldThrowCustomError {
            return .failure(BusinessErrors.customError(message: "Custom error"))
        } else if let error = error {
            return .failure(error)
        } else {
            return .failure(NSError(domain: "Test", code: 1, userInfo: nil))
        }
    }
}

final class GetAppleIdRefreshTokenUseCaseTests: XCTestCase {
    func testExecute_Success() async {
        let mockRepo = MockTokenRepository()
        let expectedResponse = AppleTokenResponse(refreshToken: "token123")
        mockRepo.shouldSucceed = true
        mockRepo.appleTokenResponse = expectedResponse
        let useCase = GetAppleIdRefreshTokenUseCase(tokenRepository: mockRepo)

        let result = await useCase.execute(authorizationCode: "authCode")
        switch result {
        case .success(let response):
            XCTAssertEqual(response.refreshToken, "token123")
        default:
            XCTFail("Expected success")
        }
    }

    func testExecute_CustomBusinessError() async {
        let mockRepo = MockTokenRepository()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = true
        let useCase = GetAppleIdRefreshTokenUseCase(tokenRepository: mockRepo)

        let result = await useCase.execute(authorizationCode: "authCode")
        switch result {
        case .failure(let error):
            XCTAssertTrue(error is BusinessError)
        default:
            XCTFail("Expected failure with BusinessError")
        }
    }

    func testExecute_GenericError() async {
        let mockRepo = MockTokenRepository()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = false
        mockRepo.error = NSError(domain: "Test", code: 2, userInfo: nil)
        let useCase = GetAppleIdRefreshTokenUseCase(tokenRepository: mockRepo)

        let result = await useCase.execute(authorizationCode: "authCode")
        switch result {
        case .failure(let error):
            XCTAssertFalse(error is BusinessError)
        default:
            XCTFail("Expected failure with generic error")
        }
    }
}
