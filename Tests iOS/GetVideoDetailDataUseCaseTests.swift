import XCTest
@testable import SDO

class MockVideoRepositoryForDetail: VideoRepository {
    var shouldSucceed = true
    var shouldThrowCustomError = false
    var infoData: VideoInfoData?
    var signedUrl: String?
    var error: Error?

    func getVideoDetailData(videoId: String, channelId: String, userUuid: String) async -> Result<VideoInfoData, Error> {
        if shouldSucceed, let data = infoData {
            return .success(data)
        } else if shouldThrowCustomError {
            return .failure(BusinessErrors.customError(message: "Custom error"))
        } else if let error = error {
            return .failure(error)
        } else {
            return .failure(NSError(domain: "Test", code: 1, userInfo: nil))
        }
    }

    func getSignedUrlOfVideo(ofVideoId videoId: String) async -> Result<String, Error> {
        if shouldSucceed, let url = signedUrl {
            return .success(url)
        } else if let error = error {
            return .failure(error)
        } else {
            return .failure(NSError(domain: "Test", code: 2, userInfo: nil))
        }
    }

    // Add other protocol requirements as needed for compilation
    func getHomeScreenData() async -> Result<HomeScreenData, Error> { return .failure(NSError(domain: "Test", code: 0, userInfo: nil)) }
    func getVideosOfSearchParameters(ofSearchResultInputData searchResultInputData: SearchResultInputData) async -> Result<SearchResultData, Error> { return .failure(NSError(domain: "Test", code: 0, userInfo: nil)) }
}

final class GetVideoDetailDataUseCaseTests: XCTestCase {
    func testExecute_Success() async {
        let mockRepo = MockVideoRepositoryForDetail()
        let expectedInfo = VideoInfoData(id: "v1", title: "Test Video")
        let expectedUrl = "https://example.com/video.mp4"
        mockRepo.shouldSucceed = true
        mockRepo.infoData = expectedInfo
        mockRepo.signedUrl = expectedUrl
        let useCase = GetVideoDetailDataUseCase(videoRepository: mockRepo)

        let result = await useCase.execute(videoId: "v1", channelId: "c1", userUuid: "u1")
        switch result {
        case .success(let data):
            XCTAssertEqual(data.infoData.id, "v1")
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
        mockRepo.error = NSError(domain: "Test", code: 2, userInfo: nil)
        let useCase = GetVideoDetailDataUseCase(videoRepository: mockRepo)

        let result = await useCase.execute(videoId: "v1", channelId: "c1", userUuid: "u1")
        switch result {
        case .failure(let error):
            XCTAssertFalse(error is BusinessError)
        default:
            XCTFail("Expected failure with generic error")
        }
    }
}
