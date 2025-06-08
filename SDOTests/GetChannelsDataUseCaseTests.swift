import XCTest
@testable import SDO

class MockChannelRepositoryForGetChannels: ChannelRepository {
    var shouldSucceed = true
    var shouldThrowCustomError = false
    var channelsData: GetChannelsData?
    var error: Error?

    func getChannelsData() async -> Result<GetChannelsData, BusinessError> {
        if shouldSucceed, let data = channelsData {
            return .success(data)
        } else if shouldThrowCustomError {
            return .failure(BusinessErrors.customError(code: "Custom error"))
        } else if let error = error {
            return .failure(error as! BusinessError)
        } else {
            return .failure(BusinessErrors.unknownError())
        }
    }

    func getChannelDetailData(ofChannelId channelId: String) async -> Result<ChannelDetailData, BusinessError> {
        return .failure(BusinessErrors.unknownError())
    }
}

final class GetChannelsDataUseCaseTests: XCTestCase {
    func testExecute_Success() async {
        let mockRepo = MockChannelRepositoryForGetChannels()
        let expectedData = GetChannelsData(
            channels: [
                GetChannelsData.ChannelData(
                    channelId: "c1",
                    channelName: "Test Channel",
                    type: .church,
                    location: GetChannelsData.ChannelData.Location(
                        latitude: 37.7749,
                        longitude: -122.4194
                    ),
                    regionCode: "US",
                    addressText: "123 Test St, Test City, US"
                )
            ]
        )
        mockRepo.shouldSucceed = true
        mockRepo.channelsData = expectedData
        let useCase = GetChannelsDataUseCase(channelsRepository: mockRepo)

        let result = await useCase.execute()
        switch result {
        case .success(let data):
            XCTAssertEqual(data.channels.count, 1)
            XCTAssertEqual(data.channels[0].channelId, "c1")
            XCTAssertEqual(data.channels[0].channelName, "Test Channel")
            XCTAssertEqual(data.channels[0].type, .church)
            XCTAssertEqual(data.channels[0].location.latitude, 37.7749)
            XCTAssertEqual(data.channels[0].location.longitude, -122.4194)
            XCTAssertEqual(data.channels[0].regionCode, "US")
            XCTAssertEqual(data.channels[0].addressText, "123 Test St, Test City, US")
        default:
            XCTFail("Expected success")
        }
    }

    func testExecute_CustomBusinessError() async {
        let mockRepo = MockChannelRepositoryForGetChannels()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = true
        let useCase = GetChannelsDataUseCase(channelsRepository: mockRepo)

        let result = await useCase.execute()
        switch result {
        case .failure(let error):
            XCTAssertTrue(error is BusinessError)
        default:
            XCTFail("Expected failure with BusinessError")
        }
    }

    func testExecute_GenericError() async {
        let mockRepo = MockChannelRepositoryForGetChannels()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = false
        mockRepo.error = BusinessErrors.unknownError()
        let useCase = GetChannelsDataUseCase(channelsRepository: mockRepo)

        let result = await useCase.execute()
        switch result {
        case .failure(let error):
            XCTAssertTrue(error is BusinessError)
        default:
            XCTFail("Expected failure with generic error")
        }
    }
}
