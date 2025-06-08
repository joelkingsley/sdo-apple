import XCTest
@testable import SDO

class MockVideoRepositoryForDetail: VideoRepository {
    var shouldSucceed = true
    var shouldThrowCustomError = false
    var infoData: VideoDetailData.InfoData?
    var signedUrl: URL?
    var error: Error?

    func getVideoDetailData(videoId: String, channelId: String, userUuid: String) async -> Result<VideoDetailData.InfoData, BusinessError> {
        if shouldSucceed, let data = infoData {
            return .success(data)
        } else if shouldThrowCustomError {
            return .failure(BusinessErrors.customError(code: "Custom error"))
        } else if let error = error {
            return .failure(error as! BusinessError)
        } else {
            return .failure(BusinessErrors.unknownError())
        }
    }

    func getSignedUrlOfVideo(ofVideoId videoId: String) async -> Result<URL?, BusinessError> {
        if shouldSucceed {
            return .success(signedUrl)
        } else if let error = error {
            return .failure(error as! BusinessError)
        } else {
            return .failure(BusinessErrors.unknownError())
        }
    }

    func getHomeScreenData() async -> Result<HomeScreenData, BusinessError> {
        return .failure(BusinessErrors.unknownError())
    }

    func getVideosOfSearchParameters(ofSearchResultInputData searchResultInputData: SearchResultInputData) async -> Result<SearchResultData, BusinessError> {
        return .failure(BusinessErrors.unknownError())
    }

    func updateVideoLikeDislikeStatus(withPayload payload: VideoLikeDislikeInputData) async -> Result<UpdateVideoLikeDislikeResponseData, BusinessError> {
        return .failure(BusinessErrors.unknownError())
    }
}

final class GetVideoDetailDataUseCaseTests: XCTestCase {
    func testExecute_Success() async {
        let mockRepo = MockVideoRepositoryForDetail()
        let expectedInfo = VideoDetailData.InfoData(
            videoId: "v1",
            title: "Test Video",
            videoType: .documentary,
            datePublished: Date(),
            description: "Test Description",
            speaker: VideoDetailData.SpeakerData(
                speakerId: "", speakerName: ""),
            channel: ChannelData(
                channelId: "c1",
                channelName: "Test Channel",
                channelType: .church
            ),
            moreVideosInChannel: [],
            language: LanguageData(),
            thumbnailURL: URL(string: "https://example.com/thumb.jpg")!)
        let expectedUrl = URL(string: "https://example.com/video.mp4")!
        mockRepo.shouldSucceed = true
        mockRepo.infoData = expectedInfo
        mockRepo.signedUrl = expectedUrl
        let useCase = GetVideoDetailDataUseCase(videoRepository: mockRepo)

        let result = await useCase.execute(videoId: "v1", channelId: "c1", userUuid: "u1")
        switch result {
        case .success(let data):
            XCTAssertEqual(data.infoData.videoId, "v1")
            XCTAssertEqual(data.infoData.title, "Test Video")
            XCTAssertEqual(data.videoUrl, expectedUrl)
        default:
            XCTFail("Expected success")
        }
    }

    func testExecute_CustomBusinessError() async {
        let mockRepo = MockVideoRepositoryForDetail()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = true
        let useCase = GetVideoDetailDataUseCase(videoRepository: mockRepo)

        let result = await useCase.execute(videoId: "v1", channelId: "c1", userUuid: "u1")
        switch result {
        case .failure(let error):
            XCTAssertTrue(error is BusinessError)
        default:
            XCTFail("Expected failure with BusinessError")
        }
    }

    func testExecute_GenericError() async {
        let mockRepo = MockVideoRepositoryForDetail()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = false
        mockRepo.error = BusinessErrors.unknownError()
        let useCase = GetVideoDetailDataUseCase(videoRepository: mockRepo)

        let result = await useCase.execute(videoId: "v1", channelId: "c1", userUuid: "u1")
        switch result {
        case .failure(let error):
            XCTAssertTrue(error is BusinessError)
        default:
            XCTFail("Expected failure with generic error")
        }
    }
}
