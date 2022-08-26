//
//  VideoRepository.swift
//  SDO
//
//  Created by Joel Kingsley on 24/08/2022.
//

import Foundation

/**
 Repository that performs operations related to Videos
 */
protocol VideoRepository {
    /// Gets the data needed for the home screen
    func getDataForHomeScreen(userUuid: String) async -> Result<HomeScreenData, BusinessError>
}
