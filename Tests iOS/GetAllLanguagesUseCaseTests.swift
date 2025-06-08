import XCTest
@testable import SDO

class MockLanguageRepository: LanguageRepository {
    var shouldSucceed = true
    var shouldThrowCustomError = false
    var languages: [LanguageData] = []
    var error: Error?

    func getAllLanguages() async -> Result<[LanguageData], BusinessError> {
        if shouldSucceed {
            return .success(languages)
        } else if shouldThrowCustomError {
            return .failure(BusinessErrors.customError(code: "Custom error"))
        } else if let error = error {
            return .failure(error as! BusinessError)
        } else {
            return .failure(BusinessErrors.unknownError())
        }
    }
}

final class GetAllLanguagesUseCaseTests: XCTestCase {
//    func testExecute_Success() async {
//        let mockRepo = MockLanguageRepository()
//        let expectedLanguages = [
//            LanguageData(
//                languageCode: "",
//                sourceCountryFlag: ""
//            )
//        ]
//        mockRepo.shouldSucceed = true
//        mockRepo.languages = expectedLanguages
//        let useCase = GetAllLanguagesUseCase(languageRepository: mockRepo)
//
//        let result = await useCase.execute()
//        switch result {
//        case .success(let languages):
//            XCTAssertEqual(languages.count, 1)
//            XCTAssertEqual(languages.first?.id, "en")
//            XCTAssertEqual(languages.first?.name, "English")
//            XCTAssertEqual(languages.first?.nativeName, "English")
//            XCTAssertFalse(languages.first?.isRtl ?? true)
//        default:
//            XCTFail("Expected success")
//        }
//    }

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
        mockRepo.error = BusinessErrors.unknownError()
        let useCase = GetAllLanguagesUseCase(languageRepository: mockRepo)

        let result = await useCase.execute()
        switch result {
        case .failure(let error):
            XCTAssertTrue(error is BusinessError)
        default:
            XCTFail("Expected failure with generic error")
        }
    }
}
