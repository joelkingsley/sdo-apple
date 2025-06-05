import XCTest
@testable import SDO

class MockUserRepositoryForGetUser: UserRepository {
    var shouldSucceed = true
    var shouldThrowCustomError = false
    var userData: UserData?
    var error: Error?

    func getUserData(userUuid: String) async -> Result<UserData, Error> {
        if shouldSucceed, let data = userData {
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
    func deleteAllUserData(userPrimaryKey: String) async -> Result<DeleteAllUserData, Error> {
        return .failure(NSError(domain: "Test", code: 0, userInfo: nil))
    }
}

final class GetUserDataUseCaseTests: XCTestCase {
    func testExecute_Success() async {
        let mockRepo = MockUserRepositoryForGetUser()
        let expectedData = UserData(uuid: "user1", name: "Test User")
        mockRepo.shouldSucceed = true
        mockRepo.userData = expectedData
        let useCase = GetUserDataUseCase(userRepository: mockRepo)

        let result = await useCase.execute(userUuid: "user1")
        switch result {
        case .success(let data):
            XCTAssertEqual(data.uuid, "user1")
            XCTAssertEqual(data.name, "Test User")
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
        mockRepo.error = NSError(domain: "Test", code: 2, userInfo: nil)
        let useCase = GetUserDataUseCase(userRepository: mockRepo)

        let result = await useCase.execute(userUuid: "user1")
        switch result {
        case .failure(let error):
            XCTAssertFalse(error is BusinessError)
        default:
            XCTFail("Expected failure with generic error")
        }
    }
}
