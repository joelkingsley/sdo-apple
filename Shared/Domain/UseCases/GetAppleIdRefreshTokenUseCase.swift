//
//  GetAppleIdRefreshTokenUseCase.swift
//  SDO
//
//  Created by Joel Kingsley on 23/11/2022.
//

import Foundation

class GetAppleIdRefreshTokenUseCase {
    let tokenRepository: TokenRepository
    
    init(tokenRepository: TokenRepository) {
        self.tokenRepository = tokenRepository
    }
    
    func execute(authorizationCode: String) async -> Result<AppleTokenResponse, BusinessError> {
        do {
            let appleTokenResponse = try await tokenRepository.getAppleIdRefreshToken(
                authorizationCode: authorizationCode).get()
            return .success(appleTokenResponse)
        } catch {
            if let customError = error as? BusinessErrors.customError {
                AppLogger.error(customError.localizedDescription)
                return .failure(customError.asErrorForGetAppleIdRefreshTokenUseCase())
            }
            return .failure(error)
        }
    }
}
