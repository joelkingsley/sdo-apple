import XCTest
@testable import SDO

class MockLanguageRepository: LanguageRepository {
    var shouldSucceed = true
    var shouldThrowCustomError = false
    var languages: [LanguageData] = []
    var error: Error?

    func getAllLanguages() async -> Result<[LanguageData], Error> {
        if shouldSucceed {
            return .success(languages)
        } else if shouldThrowCustomError {
            return .failure(BusinessErrors.customError(message: "Custom error"))
        } else if let error = error {
            return .failure(error)
        } else {
            return .failure(NSError(domain: "Test", code: 1, userInfo: nil))
        }
    }
}

final class GetAllLanguagesUseCaseTests: XCTestCase {
    func testExecute_Success() async {
        let mockRepo = MockLanguageRepository()
        let expectedLanguages = [LanguageData(code: "en", name: "English")]
        mockRepo.shouldSucceed = true
        mockRepo.languages = expectedLanguages
        let useCase = GetAllLanguagesUseCase(languageRepository: mockRepo)

        let result = await useCase.execute()
        switch result {
        case .success(let languages):
            XCTAssertEqual(languages.count, 1)
            XCTAssertEqual(languages.first?.code, "en")
        default:
            XCTFail("Expected success")
        }
    }

    func testExecute_CustomBusinessError() async {
        let mockRepo = MockLanguageRepository()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = true
        let useCase = GetAllLanguagesUseCase(languageRepository: mockRepo)

        let result = await useCase.execute()
        switch result {
        case .failure(let error):
            XCTAssertTrue(error is BusinessError)
        default:
            XCTFail("Expected failure with BusinessError")
        }
    }

    func testExecute_GenericError() async {
        let mockRepo = MockLanguageRepository()
        mockRepo.shouldSucceed = false
        mockRepo.shouldThrowCustomError = false
        mockRepo.error = NSError(domain: "Test", code: 2, userInfo: nil)
        let useCase = GetAllLanguagesUseCase(languageRepository: mockRepo)

        let result = await useCase.execute()
        switch result {
        case .failure(let error):
            XCTAssertFalse(error is BusinessError)
        default:
            XCTFail("Expected failure with generic error")
        }
    }
}
