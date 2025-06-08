import XCTest
@testable import SDO

class ChannelDataTests: XCTestCase {
    func testDescriptionString() {
        let channel = ChannelData(channelId: "123", channelName: "Test Channel", channelType: .church)
        let expected = "Channel ID: 123, Channel Name: Test Channel, Channel Type: channelsTypeChurchLabel"
        XCTAssertEqual(channel.descriptionString(), expected)
    }
    
    func testChannelNameInAllCaps() {
        let channel = ChannelData(channelId: "456", channelName: "myChannel", channelType: .soulWinningClub)
        XCTAssertEqual(channel.channelNameInAllCaps(), "MYCHANNEL")
    }
    
    func testIsChurch() {
        let channel = ChannelData(channelId: "789", channelName: "Church Channel", channelType: .church)
        XCTAssertTrue(channel.isChurch())
        XCTAssertFalse(channel.isSoulWinningClub())
    }
    
    func testIsSoulWinningClub() {
        let channel = ChannelData(channelId: "101", channelName: "SWC Channel", channelType: .soulWinningClub)
        XCTAssertTrue(channel.isSoulWinningClub())
        XCTAssertFalse(channel.isChurch())
    }
}
