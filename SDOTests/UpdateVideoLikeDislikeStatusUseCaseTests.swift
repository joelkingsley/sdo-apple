import XCTest
@testable import SDO

//final class UpdateVideoLikeDislikeStatusUseCaseTests: XCTestCase {
//    
//    private var useCase: UpdateVideoLikeDislikeStatusUseCase!
//    private var mockRepository: MockVideoRepository!
//    
//    override func setUp() {
//        super.setUp()
//        mockRepository = MockVideoRepository()
//        useCase = UpdateVideoLikeDislikeStatusUseCase(videoRepository: mockRepository)
//    }
//    
//    override func tearDown() {
//        useCase = nil
//        mockRepository = nil
//        super.tearDown()
//    }
//    
//    func testUpdateVideoLikeDislikeStatusSuccess() async {
//        // Given
//        let videoId = "video123"
//        let liked = true
//        let userPrimaryKey = "user123"
//        let payload = VideoLikeDislikeInputData(
//            likedByUser: liked,
//            videoId: videoId,
//            userPrimaryKey: userPrimaryKey
//        )
//        let expectedResponse = UpdateVideoLikeDislikeResponseData(liked: true)
//        mockRepository.updateVideoLikeDislikeStatusResult = .success(expectedResponse)
//        
//        // When
//        let result = await useCase.execute(payload: payload)
//        
//        // Then
//        XCTAssertTrue(mockRepository.updateVideoLikeDislikeStatusCalled)
//        XCTAssertEqual(mockRepository.updateVideoLikeDislikeStatusPayload?.videoId, videoId)
//        XCTAssertEqual(mockRepository.updateVideoLikeDislikeStatusPayload?.likedByUser, liked)
//        XCTAssertEqual(result, .success(expectedResponse))
//    }
//    
//    func testUpdateVideoLikeDislikeStatusFailure() async {
//        // Given
//        let videoId = "video123"
//        let liked = true
//        let userPrimaryKey = "user123"
//        let payload = VideoLikeDislikeInputData(
//            likedByUser: liked,
//            videoId: videoId,
//            userPrimaryKey: userPrimaryKey
//        )
//        let expectedError = BusinessErrors.unknownError()
//        mockRepository.updateVideoLikeDislikeStatusResult = .failure(expectedError)
//        
//        // When
//        let result = await useCase.execute(payload: payload)
//        
//        // Then
//        XCTAssertTrue(mockRepository.updateVideoLikeDislikeStatusCalled)
//        XCTAssertEqual(mockRepository.updateVideoLikeDislikeStatusPayload?.videoId, videoId)
//        XCTAssertEqual(mockRepository.updateVideoLikeDislikeStatusPayload?.likedByUser, liked)
//        switch result {
//        case .failure(let error):
//            XCTAssertTrue(error is BusinessErrors.unknownError)
//        default:
//            XCTFail("Expected failure with unknown error")
//        }
//    }
//}
//
//private class MockVideoRepository: VideoRepository {
//    var updateVideoLikeDislikeStatusResult: Result<UpdateVideoLikeDislikeResponseData, BusinessError> = .failure(BusinessErrors.unknownError())
//    
//    var updateVideoLikeDislikeStatusCalled = false
//    var updateVideoLikeDislikeStatusPayload: VideoLikeDislikeInputData?
//    
//    func updateVideoLikeDislikeStatus(withPayload payload: VideoLikeDislikeInputData) async -> Result<UpdateVideoLikeDislikeResponseData, BusinessError> {
//        updateVideoLikeDislikeStatusCalled = true
//        updateVideoLikeDislikeStatusPayload = payload
//        return updateVideoLikeDislikeStatusResult
//    }
//
//    func getHomeScreenData() async -> Result<HomeScreenData, BusinessError> {
//        return .failure(BusinessErrors.unknownError())
//    }
//
//    func getVideosOfSearchParameters(ofSearchResultInputData searchResultInputData: SearchResultInputData) async -> Result<SearchResultData, BusinessError> {
//        return .failure(BusinessErrors.unknownError())
//    }
//
//    func getVideoDetailData(videoId: String, channelId: String, userUuid: String) async -> Result<VideoDetailData.InfoData, BusinessError> {
//        return .failure(BusinessErrors.unknownError())
//    }
//
//    func getSignedUrlOfVideo(ofVideoId videoId: String) async -> Result<URL?, BusinessError> {
//        return .failure(BusinessErrors.unknownError())
//    }
//}
