import XCTest
@testable import SDO

class MockVideoRepositoryForSearch: VideoRepository {
    var shouldSucceed = true
    var shouldThrowCustomError = false
    var searchResultData: SearchResultData?
    var error: Error?

    func getVideosOfSearchParameters(ofSearchResultInputData searchResultInputData: SearchResultInputData) async -> Result<SearchResultData, Error> {
        if shouldSucceed, let data = searchResultData {
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
    func getHomeScreenData() async -> Result<HomeScreenData, Error> {
        return .failure(NSError(domain: "Test", code: 0, userInfo: nil))
    }
}

final class GetVideosOfSearchParametersUseCaseTests: XCTestCase {
    func testExecute_Success() async {
        let mockRepo = MockVideoRepositoryForSearch()
        let expectedData = SearchResultData(videos: [])
        mockRepo.shouldSucceed = true
        mockRepo.searchResultData = expectedData
        let useCase = GetVideosOfSearchParametersUseCase(videoRepository: mockRepo)
        let input = SearchResultInputData(query: "test")

        let result = await useCase.execute(searchResultInputData: input)
        switch result {
        case .success(let data):
            XCTAssertEqual(data.videos.count, 0)
        default:
            XCTFail("Expected success")
        }
    }

    func testExecute_CustomBusinessError() async {
        let mockRepo = MockVideoRepositoryForSearch()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = true
        let useCase = GetVideosOfSearchParametersUseCase(videoRepository: mockRepo)
        let input = SearchResultInputData(query: "test")

        let result = await useCase.execute(searchResultInputData: input)
        switch result {
        case .failure(let error):
            XCTAssertTrue(error is BusinessError)
        default:
            XCTFail("Expected failure with BusinessError")
        }
    }

    func testExecute_GenericError() async {
        let mockRepo = MockVideoRepositoryForSearch()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = false
        mockRepo.error = NSError(domain: "Test", code: 2, userInfo: nil)
        let useCase = GetVideosOfSearchParametersUseCase(videoRepository: mockRepo)
        let input = SearchResultInputData(query: "test")

        let result = await useCase.execute(searchResultInputData: input)
        switch result {
        case .failure(let error):
            XCTAssertFalse(error is BusinessError)
        default:
            XCTFail("Expected failure with generic error")
        }
    }
}
