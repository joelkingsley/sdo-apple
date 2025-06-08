import XCTest
import MapKit
@testable import SDO

final class FilterChannelsUseCaseTests: XCTestCase {
    
    private class MockChannelData: GetChannelsData.ChannelData {
        override init(
            channelId: String,
            channelName: String,
            type: ChannelTypeData,
            location: GetChannelsData.ChannelData.Location,
            regionCode: String,
            addressText: String
        ) {
            super.init(
                channelId: channelId,
                channelName: channelName,
                type: type,
                location: location,
                regionCode: regionCode,
                addressText: addressText
            )
        }
    }
    
    private var useCase: FilterChannelsUseCase!
    
    override func setUp() {
        super.setUp()
        useCase = FilterChannelsUseCase()
    }
    
    override func tearDown() {
        useCase = nil
        super.tearDown()
    }
    
    func testFilterChannelsByWorldRegionWithSearchText() {
        // Given
        let channels = [
            MockChannelData(
                channelId: "1",
                channelName: "Channel 1",
                type: .church,
                location: GetChannelsData.ChannelData.Location(latitude: 37.7749, longitude: -122.4194),
                regionCode: "US",
                addressText: "123 Test St, US"
            ),
            MockChannelData(
                channelId: "2",
                channelName: "Channel 2",
                type: .church,
                location: GetChannelsData.ChannelData.Location(latitude: 51.5074, longitude: -0.1278),
                regionCode: "GB",
                addressText: "456 Test St, UK"
            ),
            MockChannelData(
                channelId: "3",
                channelName: "Channel 3",
                type: .church,
                location: GetChannelsData.ChannelData.Location(latitude: 48.8566, longitude: 2.3522),
                regionCode: "FR",
                addressText: "789 Test St, FR"
            )
        ]
        
        // When
        let filteredChannels = useCase.execute(
            channels,
            withRegion: Locale.Region.world,
            withSearchText: "Channel"
        )
        
        // Then
        XCTAssertEqual(filteredChannels.count, 3)
        XCTAssertEqual(filteredChannels[0].channelName, "Channel 1")
        XCTAssertEqual(filteredChannels[1].channelName, "Channel 2")
        XCTAssertEqual(filteredChannels[2].channelName, "Channel 3")
    }
    
    func testFilterChannelsBySpecificRegionWithSearchText() {
        // Given
        let channels = [
            MockChannelData(
                channelId: "1",
                channelName: "Channel 1",
                type: .church,
                location: GetChannelsData.ChannelData.Location(latitude: 37.7749, longitude: -122.4194),
                regionCode: "US",
                addressText: "123 Test St, US"
            ),
            MockChannelData(
                channelId: "2",
                channelName: "Channel 2",
                type: .church,
                location: GetChannelsData.ChannelData.Location(latitude: 51.5074, longitude: -0.1278),
                regionCode: "GB",
                addressText: "456 Test St, UK"
            ),
            MockChannelData(
                channelId: "3",
                channelName: "Channel 3",
                type: .church,
                location: GetChannelsData.ChannelData.Location(latitude: 48.8566, longitude: 2.3522),
                regionCode: "FR",
                addressText: "789 Test St, FR"
            )
        ]
        
        // When
        let filteredChannels = useCase.execute(
            channels,
            withRegion: Locale.Region("US"),
            withSearchText: "Channel"
        )
        
        // Then
        XCTAssertEqual(filteredChannels.count, 1)
        XCTAssertEqual(filteredChannels[0].channelName, "Channel 1")
    }
    
    func testFilterChannelsWithEmptySearchText() {
        // Given
        let channels = [
            MockChannelData(
                channelId: "1",
                channelName: "Channel 1",
                type: .church,
                location: GetChannelsData.ChannelData.Location(latitude: 37.7749, longitude: -122.4194),
                regionCode: "US",
                addressText: "123 Test St, US"
            ),
            MockChannelData(
                channelId: "2",
                channelName: "Channel 2",
                type: .church,
                location: GetChannelsData.ChannelData.Location(latitude: 51.5074, longitude: -0.1278),
                regionCode: "GB",
                addressText: "456 Test St, UK"
            ),
            MockChannelData(
                channelId: "3",
                channelName: "Channel 3",
                type: .church,
                location: GetChannelsData.ChannelData.Location(latitude: 48.8566, longitude: 2.3522),
                regionCode: "FR",
                addressText: "789 Test St, FR"
            )
        ]
        
        // When
        let filteredChannels = useCase.execute(
            channels,
            withRegion: Locale.Region.world,
            withSearchText: ""
        )
        
        // Then
        XCTAssertEqual(filteredChannels.count, 3)
        XCTAssertEqual(filteredChannels[0].channelName, "Channel 1")
        XCTAssertEqual(filteredChannels[1].channelName, "Channel 2")
        XCTAssertEqual(filteredChannels[2].channelName, "Channel 3")
    }
}
