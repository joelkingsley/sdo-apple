import XCTest
@testable import SDO

class MockVideoRepository: VideoRepository {
    var shouldSucceed = true
    var shouldThrowCustomError = false
    var homeScreenData: HomeScreenData?
    var error: Error?

    func getHomeScreenData() async -> Result<HomeScreenData, Error> {
        if shouldSucceed, let data = homeScreenData {
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

final class GetHomeScreenDataUseCaseTests: XCTestCase {
    func testExecute_Success() async {
        let mockRepo = MockVideoRepository()
        let expectedData = HomeScreenData(videos: [])
        mockRepo.shouldSucceed = true
        mockRepo.homeScreenData = expectedData
        let useCase = GetHomeScreenDataUseCase(videoRepository: mockRepo)

        let result = await useCase.execute(userUuid: "user1")
        switch result {
        case .success(let data):
            XCTAssertEqual(data.videos.count, 0)
        default:
            XCTFail("Expected success")
        }
    }

    func testExecute_CustomBusinessError() async {
        let mockRepo = MockVideoRepository()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = true
        let useCase = GetHomeScreenDataUseCase(videoRepository: mockRepo)

        let result = await useCase.execute(userUuid: "user1")
        switch result {
        case .failure(let error):
            XCTAssertTrue(error is BusinessError)
        default:
            XCTFail("Expected failure with BusinessError")
        }
    }

    func testExecute_GenericError() async {
        let mockRepo = MockVideoRepository()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = false
        mockRepo.error = NSError(domain: "Test", code: 2, userInfo: nil)
        let useCase = GetHomeScreenDataUseCase(videoRepository: mockRepo)

        let result = await useCase.execute(userUuid: "user1")
        switch result {
        case .failure(let error):
            XCTAssertFalse(error is BusinessError)
        default:
            XCTFail("Expected failure with generic error")
        }
    }
}
