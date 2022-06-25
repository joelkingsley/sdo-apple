//
//  HomeTabViewModel.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 25/06/2022.
//

import Foundation

struct HomeTabViewModel {
    var videos: [String: [VideoData]]?
    
    var allCategories: [String] {
        return videos?.keys.map({ String($0) }) ?? []
    }
}
