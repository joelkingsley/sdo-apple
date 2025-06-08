import XCTest
@testable import SDO

class MockVideoRepositoryForSearch: VideoRepository {
    var shouldSucceed = true
    var shouldThrowCustomError = false
    var searchResultData: SearchResultData?
    var error: Error?

    func getVideosOfSearchParameters(ofSearchResultInputData searchResultInputData: SearchResultInputData) async -> Result<SearchResultData, BusinessError> {
        if shouldSucceed, let data = searchResultData {
            return .success(data)
        } else if shouldThrowCustomError {
            return .failure(BusinessErrors.customError(code: "Custom error"))
        } else if let error = error {
            return .failure(error as! BusinessError)
        } else {
            return .failure(BusinessErrors.unknownError())
        }
    }

    func getHomeScreenData() async -> Result<HomeScreenData, BusinessError> {
        return .failure(BusinessErrors.unknownError())
    }

    func getVideoDetailData(videoId: String, channelId: String, userUuid: String) async -> Result<VideoDetailData.InfoData, BusinessError> {
        return .failure(BusinessErrors.unknownError())
    }

    func getSignedUrlOfVideo(ofVideoId videoId: String) async -> Result<URL?, BusinessError> {
        return .failure(BusinessErrors.unknownError())
    }

    func updateVideoLikeDislikeStatus(withPayload payload: VideoLikeDislikeInputData) async -> Result<UpdateVideoLikeDislikeResponseData, BusinessError> {
        return .failure(BusinessErrors.unknownError())
    }
}

final class GetVideosOfSearchParametersUseCaseTests: XCTestCase {
    func testExecute_Success() async {
        let mockRepo = MockVideoRepositoryForSearch()
        let expectedData = SearchResultData(
            videos: [
                SearchResultData.Video(
                    videoId: "v1",
                    title: "Test Video",
                    channelId: "c1",
                    channelName: "Test Channel",
                    datePublished: Date(),
                    speakerName: "",
                    videoType: .documentary,
                    thumbnailURL: URL(string: "https://example.com/thumb.jpg")!
                )
            ], totalNumberOfVideos: 1
        )
        mockRepo.shouldSucceed = true
        mockRepo.searchResultData = expectedData
        let useCase = GetVideosOfSearchParametersUseCase(videoRepository: mockRepo)
        let input = SearchResultInputData(
            videoType: .none,
            searchText: "test",
            languageCode: nil,
            limit: 10,
            page: 1)

        let result = await useCase.execute(searchResultInputData: input)
        switch result {
        case .success(let data):
            XCTAssertEqual(data.videos.count, 1)
            XCTAssertEqual(data.videos[0].videoId, "v1")
            XCTAssertEqual(data.videos[0].title, "Test Video")
        default:
            XCTFail("Expected success")
        }
    }

    func testExecute_CustomBusinessError() async {
        let mockRepo = MockVideoRepositoryForSearch()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = true
        let useCase = GetVideosOfSearchParametersUseCase(videoRepository: mockRepo)
        let input = SearchResultInputData(
            videoType: .none,
            searchText: "test",
            languageCode: nil,
            limit: 10,
            page: 1)

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
        mockRepo.error = BusinessErrors.unknownError()
        let useCase = GetVideosOfSearchParametersUseCase(videoRepository: mockRepo)
        let input = SearchResultInputData(
            videoType: .none,
            searchText: "test",
            languageCode: nil,
            limit: 10,
            page: 1)

        let result = await useCase.execute(searchResultInputData: input)
        switch result {
        case .failure(let error):
            XCTAssertTrue(error is BusinessError)
        default:
            XCTFail("Expected failure with generic error")
        }
    }
}
