//
//  LibraryTabViewModel.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 04/11/2022.
//

import Foundation
import SwiftUI

@MainActor
class LibraryTabViewModel: ObservableObject {
    private let getUserDataUseCase = GetUserDataUseCase(
        userRepository: HasuraUserRepository(
            graphQLService: HasuraGraphQLService()))
    
    @Published var userData: Result<UserData, BusinessError>?
    
    func onLoaded(user: SDOUser?) {
        guard let user else {
            userData = .failure(BusinessErrors.unknownError())
            return
        }
        Task {
            switch await getUserDataUseCase.execute(userUuid: user.uid) {
            case let .success(data):
                userData = .success(data)
            case let .failure(error):
                AppLogger.error(error.localizedDescription)
                userData = .failure(error)
            }
        }
    }
}
