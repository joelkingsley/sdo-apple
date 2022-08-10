//
//  SearchTabViewModel.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 09/08/2022.
//

import Foundation

class SearchTabViewModel: ObservableObject {
    @Published var languages: [(String, String)]
    
    init() {
        self.languages = [
            ("🇬🇧", Locale.current.localizedString(forLanguageCode: "en")!),
            ("🇩🇪", Locale.current.localizedString(forLanguageCode: "de")!),
            ("🇮🇳", Locale.current.localizedString(forLanguageCode: "ta")!)
        ]
    }
}
