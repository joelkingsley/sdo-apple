import XCTest
@testable import SDO

final class GetChannelDetailDataUseCaseTests: XCTestCase {
    
    private var useCase: GetChannelsDetailDataUseCase!
    private var mockRepository: MockChannelRepository!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockChannelRepository()
        useCase = GetChannelsDetailDataUseCase(channelsRepository: mockRepository)
    }
    
    override func tearDown() {
        useCase = nil
        mockRepository = nil
        super.tearDown()
    }
    
    func testGetChannelDetailDataSuccess() async {
        // Given
        let channelId = "channel123"
        let expectedResponse = ChannelDetailData(
            channelId: channelId,
            channelName: "Test Channel",
            channelType: .church,
            location: ChannelDetailData.Location(latitude: 37.7749, longitude: -122.4194),
            regionCode: "US",
            videosInChannel: [
                ChannelDetailData.Video(
                    videoId: "v1",
                    title: "Test Video",
                    videoType: .sermon,
                    channelId: channelId,
                    channelName: "Test Channel",
                    speaker: ChannelDetailData.Video.Speaker(speakerId: "s1", speakerName: "Test Speaker"),
                    language: ChannelDetailData.Video.Language(languageCode: "en", sourceCountryFlag: "🇺🇸"),
                    thumbnailUrl: URL(string: "https://example.com/thumbnail.jpg")!,
                    description: "Test Description",
                    datePublished: Date()
                )
            ],
            websiteUrl: URL(string: "https://example.com")!
        )
        mockRepository.getChannelDetailDataResult = .success(expectedResponse)
        
        // When
        let result = await useCase.execute(channelId: channelId)
        
        // Then
        XCTAssertTrue(mockRepository.getChannelDetailDataCalled)
        XCTAssertEqual(mockRepository.getChannelDetailDataChannelId, channelId)
//        XCTAssertEqual(result, .success(expectedResponse))
    }
    
    func testGetChannelDetailDataFailure() async {
        // Given
        let channelId = "channel123"
        let expectedError = BusinessErrors.unknownError()
        mockRepository.getChannelDetailDataResult = .failure(expectedError)
        
        // When
        let result = await useCase.execute(channelId: channelId)
        
        // Then
        XCTAssertTrue(mockRepository.getChannelDetailDataCalled)
        XCTAssertEqual(mockRepository.getChannelDetailDataChannelId, channelId)
        switch result {
        case .failure(let error):
            XCTAssertTrue(error is BusinessErrors.unknownError)
        default:
            XCTFail("Expected failure with unknown error")
        }
    }
}

private class MockChannelRepository: ChannelRepository {
    var getChannelDetailDataResult: Result<ChannelDetailData, BusinessError> = .failure(BusinessErrors.unknownError())
    
    var getChannelDetailDataCalled = false
    var getChannelDetailDataChannelId: String?
    
    func getChannelDetailData(ofChannelId channelId: String) async -> Result<ChannelDetailData, BusinessError> {
        getChannelDetailDataCalled = true
        getChannelDetailDataChannelId = channelId
        return getChannelDetailDataResult
    }

    func getChannelsData() async -> Result<GetChannelsData, BusinessError> {
        return .failure(BusinessErrors.unknownError())
    }
}
