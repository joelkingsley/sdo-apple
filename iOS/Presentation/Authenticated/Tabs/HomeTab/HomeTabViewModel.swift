//
//  HomeTabViewModel.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 25/06/2022.
//

import Foundation
import SwiftUI

class HomeTabViewModel: ObservableObject {
    @Published
    var videos: [String: [VideoData]] = [
        "Your List": [exampleVideo1, exampleVideo2],
        "Popular on SDO": [exampleVideo1, exampleVideo2, exampleVideo1, exampleVideo2],
        "Continue Watching": [exampleVideo1, exampleVideo2],
        "New Releases": [exampleVideo1, exampleVideo2],
        "Short Clips": [exampleVideo2]
    ]
    
    var allCategories: [String] {
        return videos.keys.map({ String($0) })
    }
}
