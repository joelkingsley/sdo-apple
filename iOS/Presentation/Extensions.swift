//
//  Extensions.swift
//  SDO
//
//  Created by Joel Kingsley on 27/06/2022.
//

import SwiftUI

extension UIApplication {
    
    var keyWindow: UIWindow? {
        // Get connected scenes
        return UIApplication.shared.connectedScenes
            // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive }
            // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
            // Get its associated windows
            .flatMap({ $0 as? UIWindowScene })?.windows
            // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
    
}

/// Custom app toolbar
var appCustomToolbar: some View {
    HStack {
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
            
            Spacer()
        }
    }
    .padding(.top, 20)
    .padding(.bottom, 30)
    .padding(.leading, 20)
}
