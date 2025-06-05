import XCTest
@testable import SDO

final class FilterChannelsUseCaseTests: XCTestCase {
    struct MockChannelData: GetChannelsData.ChannelData {
        var channelName: String
        var regionCode: String
    }

    func testFilterChannels_WorldRegionWithSearchText() {
        let useCase = FilterChannelsUseCase()
        let channels = [
            MockChannelData(channelName: "Apple News", regionCode: "US"),
            MockChannelData(channelName: "Banana TV", regionCode: "IN"),
            MockChannelData(channelName: "Cherry Media", regionCode: "GB")
        ]
        let result = useCase.execute(channels, withRegion: .world, withSearchText: "apple")
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.channelName, "Apple News")
    }

    func testFilterChannels_SpecificRegionWithSearchText() {
        let useCase = FilterChannelsUseCase()
        let channels = [
            MockChannelData(channelName: "Apple News", regionCode: "US"),
            MockChannelData(channelName: "Banana TV", regionCode: "IN"),
            MockChannelData(channelName: "Cherry Media", regionCode: "GB")
        ]
        let result = useCase.execute(channels, withRegion: Locale.Region("US"), withSearchText: "news")
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.channelName, "Apple News")
    }

    func testFilterChannels_EmptySearchText() {
        let useCase = FilterChannelsUseCase()
        let channels = [
            MockChannelData(channelName: "Apple News", regionCode: "US"),
            MockChannelData(channelName: "Banana TV", regionCode: "IN")
        ]
        let result = useCase.execute(channels, withRegion: .world, withSearchText: "")
        XCTAssertEqual(result.count, 2)
    }
}
