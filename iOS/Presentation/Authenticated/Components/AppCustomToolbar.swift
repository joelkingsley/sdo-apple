//
//  AppCustomToolbar.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 31/07/2022.
//

import Foundation
import SwiftUI

/// Custom app toolbar
var appCustomToolbar: some View {
    HStack(alignment: .top) {
        Image(
            systemName: "globe.asia.australia.fill"
        )
        .foregroundColor(.accentColor)
        .font(.system(size: 25))

        VStack {
            HStack {
                Text(verbatim: "Sound Doctrine")
                    .font(
                        .custom(
                            "Copperplate",
                            fixedSize: 25
                        )
                        .weight(.heavy)
                    )
                    .foregroundColor(.accentColor)
                Spacer()
            }

            HStack {
                Text(verbatim: "Online")
                    .font(
                        .custom(
                            "Copperplate",
                            fixedSize: 15
                        )
                        .weight(.heavy)
                    )
                    .foregroundColor(.accentColor)
                Spacer()
            }
        }
    }
    .padding(.bottom, 5)
}
