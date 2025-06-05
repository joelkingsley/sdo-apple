import XCTest
@testable import SDO

class MockUserRepository: UserRepository {
    var shouldSucceed = true
    var shouldThrowCustomError = false
    var deleteAllUserData: DeleteAllUserData?
    var error: Error?

    func deleteAllUserData(userPrimaryKey: String) async -> Result<DeleteAllUserData, Error> {
        if shouldSucceed, let data = deleteAllUserData {
            return .success(data)
        } else if shouldThrowCustomError {
            return .failure(BusinessErrors.customError(message: "Custom error"))
        } else if let error = error {
            return .failure(error)
        } else {
            return .failure(NSError(domain: "Test", code: 1, userInfo: nil))
        }
    }

    // Add other protocol requirements as needed for compilation
}

final class DeleteAllUserDataUseCaseTests: XCTestCase {
    func testExecute_Success() async {
        let mockRepo = MockUserRepository()
        let expectedData = DeleteAllUserData(success: true)
        mockRepo.shouldSucceed = true
        mockRepo.deleteAllUserData = expectedData
        let useCase = DeleteAllUserDataUseCase(userRepository: mockRepo)

        let result = await useCase.execute(userPrimaryKey: "user1")
        switch result {
        case .success(let data):
            XCTAssertTrue(data.success)
        default:
            XCTFail("Expected success")
        }
    }

    func testExecute_CustomBusinessError() async {
        let mockRepo = MockUserRepository()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = true
        let useCase = DeleteAllUserDataUseCase(userRepository: mockRepo)

        let result = await useCase.execute(userPrimaryKey: "user1")
        switch result {
        case .failure(let error):
            XCTAssertTrue(error is BusinessError)
        default:
            XCTFail("Expected failure with BusinessError")
        }
    }

    func testExecute_GenericError() async {
        let mockRepo = MockUserRepository()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = false
        mockRepo.error = NSError(domain: "Test", code: 2, userInfo: nil)
        let useCase = DeleteAllUserDataUseCase(userRepository: mockRepo)

        let result = await useCase.execute(userPrimaryKey: "user1")
        switch result {
        case .failure(let error):
            XCTAssertFalse(error is BusinessError)
        default:
            XCTFail("Expected failure with generic error")
        }
    }
}
