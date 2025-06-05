import XCTest
@testable import SDO

class MockChannelRepositoryForGetChannels: ChannelRepository {
    var shouldSucceed = true
    var shouldThrowCustomError = false
    var channelsData: GetChannelsData?
    var error: Error?

    func getChannelsData() async -> Result<GetChannelsData, Error> {
        if shouldSucceed, let data = channelsData {
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
    func getChannelDetailData(ofChannelId channelId: String) async -> Result<ChannelDetailData, Error> {
        return .failure(NSError(domain: "Test", code: 0, userInfo: nil))
    }
}

final class GetChannelsDataUseCaseTests: XCTestCase {
    func testExecute_Success() async {
        let mockRepo = MockChannelRepositoryForGetChannels()
        let expectedData = GetChannelsData(channels: [])
        mockRepo.shouldSucceed = true
        mockRepo.channelsData = expectedData
        let useCase = GetChannelsDataUseCase(channelsRepository: mockRepo)

        let result = await useCase.execute()
        switch result {
        case .success(let data):
            XCTAssertEqual(data.channels.count, 0)
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
        mockRepo.error = NSError(domain: "Test", code: 2, userInfo: nil)
        let useCase = GetChannelsDataUseCase(channelsRepository: mockRepo)

        let result = await useCase.execute()
        switch result {
        case .failure(let error):
            XCTAssertFalse(error is BusinessError)
        default:
            XCTFail("Expected failure with generic error")
        }
    }
}
