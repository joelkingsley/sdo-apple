import XCTest
@testable import SDO

//class MockTokenRepository: TokenRepository {
//    var shouldSucceed = true
//    var shouldThrowCustomError = false
//    var appleTokenResponse: AppleTokenResponse?
//    var error: Error?
//
//    func getAppleIdRefreshToken(authorizationCode: String) async -> Result<AppleTokenResponse, BusinessError> {
//        if shouldSucceed, let response = appleTokenResponse {
//            return .success(response)
//        } else if shouldThrowCustomError {
//            return .failure(BusinessErrors.customError(message: "Custom error"))
//        } else if let error = error {
//            return .failure(error as! BusinessError)
//        } else {
//            return .failure(BusinessErrors.unknownError())
//        }
//    }
//
//    func revokeAppleIdRefreshToken(refreshToken: String) async -> Result<RevokeAppleTokenResponse, BusinessError> {
//        return .failure(BusinessErrors.unknownError())
//    }
//}
//
//final class GetAppleIdRefreshTokenUseCaseTests: XCTestCase {
//    func testExecute_Success() async {
//        let mockRepo = MockTokenRepository()
//        let expectedResponse = AppleTokenResponse(
//            accessToken: "access123",
//            tokenType: "Bearer",
//            expiresIn: 3600,
//            refreshToken: "refresh123",
//            idToken: "id123"
//        )
//        mockRepo.shouldSucceed = true
//        mockRepo.appleTokenResponse = expectedResponse
//        let useCase = GetAppleIdRefreshTokenUseCase(tokenRepository: mockRepo)
//
//        let result = await useCase.execute(authorizationCode: "authCode")
//        switch result {
//        case .success(let response):
//            XCTAssertEqual(response.accessToken, "access123")
//            XCTAssertEqual(response.tokenType, "Bearer")
//            XCTAssertEqual(response.expiresIn, 3600)
//            XCTAssertEqual(response.refreshToken, "refresh123")
//            XCTAssertEqual(response.idToken, "id123")
//        default:
//            XCTFail("Expected success")
//        }
//    }
//
//    func testExecute_CustomBusinessError() async {
//        let mockRepo = MockTokenRepository()
//        mockRepo.shouldSucceed = false
//        mockRepo.shouldThrowCustomError = true
//        let useCase = GetAppleIdRefreshTokenUseCase(tokenRepository: mockRepo)
//
//        let result = await useCase.execute(authorizationCode: "authCode")
//        switch result {
//        case .failure(let error):
//            XCTAssertTrue(error is BusinessError)
//        default:
//            XCTFail("Expected failure with BusinessError")
//        }
//    }
//
//    func testExecute_GenericError() async {
//        let mockRepo = MockTokenRepository()
//        mockRepo.shouldSucceed = false
//        mockRepo.shouldThrowCustomError = false
//        mockRepo.error = BusinessErrors.unknownError()
//        let useCase = GetAppleIdRefreshTokenUseCase(tokenRepository: mockRepo)
//
//        let result = await useCase.execute(authorizationCode: "authCode")
//        switch result {
//        case .failure(let error):
//            XCTAssertTrue(error is BusinessError)
//        default:
//            XCTFail("Expected failure with generic error")
//        }
//    }
//}
