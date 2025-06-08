import XCTest
@testable import SDO

class MockUserRepositoryForGetUser: UserRepository {
    var shouldSucceed = true
    var shouldThrowCustomError = false
    var userData: UserData?
    var error: Error?

    func getUserData(userUuid: String) async -> Result<UserData, BusinessError> {
        if shouldSucceed, let data = userData {
            return .success(data)
        } else if shouldThrowCustomError {
            return .failure(BusinessErrors.customError(code: "Custom error"))
        } else if let error = error {
            return .failure(error as! BusinessError)
        } else {
            return .failure(BusinessErrors.unknownError())
        }
    }

    func deleteAllUserData(userPrimaryKey: String) async -> Result<DeleteAllUserData, BusinessError> {
        return .failure(BusinessErrors.unknownError())
    }
}

final class GetUserDataUseCaseTests: XCTestCase {
    func testExecute_Success() async {
        let mockRepo = MockUserRepositoryForGetUser()
        let expectedData = UserData(id: "user1", userUuid: "user1", userEmail: "test@example.com")
        mockRepo.shouldSucceed = true
        mockRepo.userData = expectedData
        let useCase = GetUserDataUseCase(userRepository: mockRepo)

        let result = await useCase.execute(userUuid: "user1")
        switch result {
        case .success(let data):
            XCTAssertEqual(data.id, "user1")
            XCTAssertEqual(data.userUuid, "user1")
            XCTAssertEqual(data.userEmail, "test@example.com")
        default:
            XCTFail("Expected success")
        }
    }

    func testExecute_CustomBusinessError() async {
        let mockRepo = MockUserRepositoryForGetUser()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = true
        let useCase = GetUserDataUseCase(userRepository: mockRepo)

        let result = await useCase.execute(userUuid: "user1")
        switch result {
        case .failure(let error):
            XCTAssertTrue(error is BusinessError)
        default:
            XCTFail("Expected failure with BusinessError")
        }
    }

    func testExecute_GenericError() async {
        let mockRepo = MockUserRepositoryForGetUser()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = false
        mockRepo.error = BusinessErrors.unknownError()
        let useCase = GetUserDataUseCase(userRepository: mockRepo)

        let result = await useCase.execute(userUuid: "user1")
        switch result {
        case .failure(let error):
            XCTAssertTrue(error is BusinessError)
        default:
            XCTFail("Expected failure with generic error")
        }
    }
}
