import XCTest
@testable import SDO

//final class RevokeAppleIdRefreshTokenUseCaseTests: XCTestCase {
//    
//    private var useCase: RevokeAppleIdRefreshTokenUseCase!
//    private var mockRepository: MockTokenRepository!
//    
//    override func setUp() {
//        super.setUp()
//        mockRepository = MockTokenRepository()
//        useCase = RevokeAppleIdRefreshTokenUseCase(tokenRepository: mockRepository)
//    }
//    
//    override func tearDown() {
//        useCase = nil
//        mockRepository = nil
//        super.tearDown()
//    }
//    
//    func testRevokeAppleIdRefreshTokenSuccess() async {
//        // Given
//        let expectedResponse = RevokeAppleTokenResponse(isRevoked: true)
//        mockRepository.revokeAppleIdRefreshTokenResult = .success(expectedResponse)
//        
//        // When
//        let result = await useCase.execute()
//        
//        // Then
//        XCTAssertTrue(mockRepository.revokeAppleIdRefreshTokenCalled)
//        XCTAssertEqual(result, .success(expectedResponse))
//    }
//    
//    func testRevokeAppleIdRefreshTokenFailure() async {
//        // Given
//        let expectedError = BusinessError.unknown
//        mockRepository.revokeAppleIdRefreshTokenResult = .failure(expectedError)
//        
//        // When
//        let result = await useCase.execute()
//        
//        // Then
//        XCTAssertTrue(mockRepository.revokeAppleIdRefreshTokenCalled)
//        XCTAssertEqual(result, .failure(expectedError))
//    }
//}
//
//private class MockTokenRepository: TokenRepository {
//    var getAppleIdRefreshTokenResult: Result<AppleTokenResponse, BusinessError> = .failure(.unknown)
//    var revokeAppleIdRefreshTokenResult: Result<RevokeAppleTokenResponse, BusinessError> = .failure(.unknown)
//    
//    var getAppleIdRefreshTokenCalled = false
//    var revokeAppleIdRefreshTokenCalled = false
//    
//    func getAppleIdRefreshToken() async -> Result<AppleTokenResponse, BusinessError> {
//        getAppleIdRefreshTokenCalled = true
//        return getAppleIdRefreshTokenResult
//    }
//    
//    func revokeAppleIdRefreshToken() async -> Result<RevokeAppleTokenResponse, BusinessError> {
//        revokeAppleIdRefreshTokenCalled = true
//        return revokeAppleIdRefreshTokenResult
//    }
//
//    // Required to conform to protocol, but not used in these tests
//    func getAppleIdRefreshToken(authorizationCode: String) async -> Result<AppleTokenResponse, BusinessError> {
//        return .failure(BusinessErrors.unknownError())
//    }
//}
