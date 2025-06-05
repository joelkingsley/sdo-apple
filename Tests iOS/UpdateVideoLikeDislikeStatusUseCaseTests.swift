import XCTest
@testable import SDO

class MockVideoRepositoryForLikeDislike: VideoRepository {
    var shouldSucceed = true
    var shouldThrowCustomError = false
    var responseData: UpdateVideoLikeDislikeResponseData?
    var error: Error?

    func updateVideoLikeDislikeStatus(withPayload payload: VideoLikeDislikeInputData) async -> Result<UpdateVideoLikeDislikeResponseData, Error> {
        if shouldSucceed, let data = responseData {
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
    func getHomeScreenData() async -> Result<HomeScreenData, Error> { return .failure(NSError(domain: "Test", code: 0, userInfo: nil)) }
    func getVideosOfSearchParameters(ofSearchResultInputData searchResultInputData: SearchResultInputData) async -> Result<SearchResultData, Error> { return .failure(NSError(domain: "Test", code: 0, userInfo: nil)) }
    func getVideoDetailData(videoId: String, channelId: String, userUuid: String) async -> Result<VideoInfoData, Error> { return .failure(NSError(domain: "Test", code: 0, userInfo: nil)) }
    func getSignedUrlOfVideo(ofVideoId videoId: String) async -> Result<String, Error> { return .failure(NSError(domain: "Test", code: 0, userInfo: nil)) }
}

final class UpdateVideoLikeDislikeStatusUseCaseTests: XCTestCase {
    func testExecute_Success() async {
        let mockRepo = MockVideoRepositoryForLikeDislike()
        let expectedData = UpdateVideoLikeDislikeResponseData(success: true)
        mockRepo.shouldSucceed = true
        mockRepo.responseData = expectedData
        let useCase = UpdateVideoLikeDislikeStatusUseCase(videoRepository: mockRepo)
        let payload = VideoLikeDislikeInputData(videoId: "v1", like: true)

        let result = await useCase.execute(payload: payload)
        switch result {
        case .success(let data):
            XCTAssertTrue(data.success)
        default:
            XCTFail("Expected success")
        }
    }

    func testExecute_CustomBusinessError() async {
        let mockRepo = MockVideoRepositoryForLikeDislike()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = true
        let useCase = UpdateVideoLikeDislikeStatusUseCase(videoRepository: mockRepo)
        let payload = VideoLikeDislikeInputData(videoId: "v1", like: true)

        let result = await useCase.execute(payload: payload)
        switch result {
        case .failure(let error):
            XCTAssertTrue(error is BusinessError)
        default:
            XCTFail("Expected failure with BusinessError")
        }
    }

    func testExecute_GenericError() async {
        let mockRepo = MockVideoRepositoryForLikeDislike()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = false
        mockRepo.error = NSError(domain: "Test", code: 2, userInfo: nil)
        let useCase = UpdateVideoLikeDislikeStatusUseCase(videoRepository: mockRepo)
        let payload = VideoLikeDislikeInputData(videoId: "v1", like: true)

        let result = await useCase.execute(payload: payload)
        switch result {
        case .failure(let error):
            XCTAssertFalse(error is BusinessError)
        default:
            XCTFail("Expected failure with generic error")
        }
    }
}
