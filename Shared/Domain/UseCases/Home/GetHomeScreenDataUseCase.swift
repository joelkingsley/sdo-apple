//
//  GetHomeScreenDataUseCase.swift
//  SDO
//
//  Created by Joel Kingsley on 30/08/2022.
//

import Foundation

/// Retrieves the home screen data
class GetHomeScreenDataUseCase {
    let videoRepository: VideoRepository
    
    init(videoRepository: VideoRepository) {
        self.videoRepository = videoRepository
    }
    
    func execute(userUuid: String) async -> Result<HomeScreenData, BusinessError> {
        do {
            let homeScreenData = try await videoRepository.getHomeScreenData().get()
            return .success(homeScreenData)
        } catch {
            if let customError = error as? BusinessErrors.customError {
                AppLogger.error(customError.localizedDescription)
                return .failure(customError.asErrorForGetHomeScreenDataUseCase())
            }
            return .failure(error)
        }
    }
}

#if DEBUG
import XCTest

class GetHomeScreenDataUseCaseTests: XCTestCase {
    var useCase: GetHomeScreenDataUseCase!
    var mockVideoRepository: MockVideoRepository!

    override func setUp() {
        super.setUp()
        mockVideoRepository = MockVideoRepository()
        useCase = GetHomeScreenDataUseCase(videoRepository: mockVideoRepository)
    }

    override func tearDown() {
        useCase = nil
        mockVideoRepository = nil
        super.tearDown()
    }

    func testExecuteSuccess() async {
        // Arrange
        let expectedData = HomeScreenData() // Assuming HomeScreenData has a default initializer
        mockVideoRepository.result = .success(expectedData)

        // Act
        let result = await useCase.execute(userUuid: "test-uuid")

        // Assert
        switch result {
        case .success(let data):
            XCTAssertEqual(data, expectedData)
        case .failure:
            XCTFail("Expected success but got failure")
        }
    }

    func testExecuteFailure() async {
        // Arrange
        let expectedError = BusinessErrors.customError(code: "test-error")
        mockVideoRepository.result = .failure(expectedError)

        // Act
        let result = await useCase.execute(userUuid: "test-uuid")

        // Assert
        switch result {
        case .success:
            XCTFail("Expected failure but got success")
        case .failure(let error):
            XCTAssertEqual(error.localizedDescription, expectedError.localizedDescription)
        }
    }
}

class MockVideoRepository: VideoRepository {
    var result: Result<HomeScreenData, BusinessError>!

    func getHomeScreenData() async -> Result<HomeScreenData, BusinessError> {
        return result
    }
}
#endif
