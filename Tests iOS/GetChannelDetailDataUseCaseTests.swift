import XCTest
@testable import SDO

class MockChannelRepository: ChannelRepository {
    var shouldSucceed = true
    var shouldThrowCustomError = false
    var channelDetailData: ChannelDetailData?
    var error: Error?

    func getChannelDetailData(ofChannelId channelId: String) async -> Result<ChannelDetailData, Error> {
        if shouldSucceed, let data = channelDetailData {
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
}

final class GetChannelDetailDataUseCaseTests: XCTestCase {
    func testExecute_Success() async {
        let mockRepo = MockChannelRepository()
        let expectedData = ChannelDetailData(id: "1", name: "Test Channel")
        mockRepo.shouldSucceed = true
        mockRepo.channelDetailData = expectedData
        let useCase = GetChannelsDetailDataUseCase(channelsRepository: mockRepo)

        let result = await useCase.execute(channelId: "1")
        switch result {
        case .success(let data):
            XCTAssertEqual(data.id, "1")
            XCTAssertEqual(data.name, "Test Channel")
        default:
            XCTFail("Expected success")
        }
    }

    func testExecute_CustomBusinessError() async {
        let mockRepo = MockChannelRepository()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = true
        let useCase = GetChannelsDetailDataUseCase(channelsRepository: mockRepo)

        let result = await useCase.execute(channelId: "1")
        switch result {
        case .failure(let error):
            XCTAssertTrue(error is BusinessError)
        default:
            XCTFail("Expected failure with BusinessError")
        }
    }

    func testExecute_GenericError() async {
        let mockRepo = MockChannelRepository()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = false
        mockRepo.error = NSError(domain: "Test", code: 2, userInfo: nil)
        let useCase = GetChannelsDetailDataUseCase(channelsRepository: mockRepo)

        let result = await useCase.execute(channelId: "1")
        switch result {
        case .failure(let error):
            XCTAssertFalse(error is BusinessError)
        default:
            XCTFail("Expected failure with generic error")
        }
    }
}
