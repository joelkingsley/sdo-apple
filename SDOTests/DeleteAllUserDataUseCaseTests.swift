import XCTest
@testable import SDO

class MockUserRepository: UserRepository {
    var shouldSucceed = true
    var shouldThrowCustomError = false
    var deleteAllUserData: DeleteAllUserData?
    var error: Error?

    func getUserData(userUuid: String) async -> Result<UserData, BusinessError> {
        return .failure(BusinessErrors.unknownError())
    }

    func deleteAllUserData(userPrimaryKey: String) async -> Result<DeleteAllUserData, BusinessError> {
        if shouldSucceed, let data = deleteAllUserData {
            return .success(data)
        } else if shouldThrowCustomError {
            return .failure(BusinessErrors.customError(code: "Custom error"))
        } else if let error = error {
            return .failure(error as! BusinessError)
        } else {
            return .failure(BusinessErrors.unknownError())
        }
    }

    // Add other protocol requirements as needed for compilation
}

final class DeleteAllUserDataUseCaseTests: XCTestCase {
    func testExecute_Success() async {
        let mockRepo = MockUserRepository()
        let expectedData = DeleteAllUserData(userEmail: "test@example.com", userUuid: "user1")
        mockRepo.shouldSucceed = true
        mockRepo.deleteAllUserData = expectedData
        let useCase = DeleteAllUserDataUseCase(userRepository: mockRepo)

        let result = await useCase.execute(userPrimaryKey: "user1")
        switch result {
        case .success(let data):
            XCTAssertEqual(data.userEmail, "test@example.com")
            XCTAssertEqual(data.userUuid, "user1")
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
        mockRepo.error = BusinessErrors.unknownError()
        let useCase = DeleteAllUserDataUseCase(userRepository: mockRepo)

        let result = await useCase.execute(userPrimaryKey: "user1")
        switch result {
        case .failure(let error):
            XCTAssertTrue(error is BusinessError)
        default:
            XCTFail("Expected failure with generic error")
        }
    }
}
