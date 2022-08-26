//
//  VideoRepository.swift
//  SDO
//
//  Created by Joel Kingsley on 24/08/2022.
//

import Foundation

protocol VideoRepository {
    func getDataForHomeScreen(userUuid: String) async -> Result<HomeScreenData, BusinessError>
}
