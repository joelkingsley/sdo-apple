import XCTest
@testable import SDO

class MockVideoRepository: VideoRepository {
    var shouldSucceed = true
    var shouldThrowCustomError = false
    var homeScreenData: HomeScreenData?
    var error: Error?

    func getHomeScreenData() async -> Result<HomeScreenData, BusinessError> {
        if shouldSucceed, let data = homeScreenData {
            return .success(data)
        } else if shouldThrowCustomError {
            return .failure(BusinessErrors.customError(code: "Custom error"))
        } else if let error = error {
            return .failure(error as! BusinessError)
        } else {
            return .failure(BusinessErrors.unknownError())
        }
    }

    func getVideoDetailData(videoId: String, channelId: String, userUuid: String) async -> Result<VideoDetailData.InfoData, BusinessError> {
        return .failure(BusinessErrors.unknownError())
    }

    func getSignedUrlOfVideo(ofVideoId videoId: String) async -> Result<URL?, BusinessError> {
        return .failure(BusinessErrors.unknownError())
    }

    func getVideosOfSearchParameters(ofSearchResultInputData searchResultInputData: SearchResultInputData) async -> Result<SearchResultData, BusinessError> {
        return .failure(BusinessErrors.unknownError())
    }

    func updateVideoLikeDislikeStatus(withPayload payload: VideoLikeDislikeInputData) async -> Result<UpdateVideoLikeDislikeResponseData, BusinessError> {
        return .failure(BusinessErrors.unknownError())
    }
}

final class GetHomeScreenDataUseCaseTests: XCTestCase {
//    func testExecute_Success() async {
//        let mockRepo = MockVideoRepository()
//        let expectedData = HomeScreenData(
//            videos: [
//                HomeScreenData.VideoData(
//                    id: "v1",
//                    title: "Test Video",
//                    description: "Test Description",
//                    thumbnailUrl: URL(string: "https://example.com/thumb.jpg")!,
//                    channelId: "c1",
//                    channelName: "Test Channel",
//                    channelThumbnailUrl: URL(string: "https://example.com/channel.jpg")!,
//                    viewCount: 1000
//                )
//            ]
//        )
//        mockRepo.shouldSucceed = true
//        mockRepo.homeScreenData = expectedData
//        let useCase = GetHomeScreenDataUseCase(videoRepository: mockRepo)
//
//        let result = await useCase.execute(userUuid: "user1")
//        switch result {
//        case .success(let data):
//            XCTAssertEqual(data.videos.count, 1)
//            XCTAssertEqual(data.videos[0].id, "v1")
//            XCTAssertEqual(data.videos[0].title, "Test Video")
//        default:
//            XCTFail("Expected success")
//        }
//    }

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
        mockRepo.error = BusinessErrors.unknownError()
        let useCase = GetHomeScreenDataUseCase(videoRepository: mockRepo)

        let result = await useCase.execute(userUuid: "user1")
        switch result {
        case .failure(let error):
            XCTAssertTrue(error is BusinessError)
        default:
            XCTFail("Expected failure with generic error")
        }
    }
}
