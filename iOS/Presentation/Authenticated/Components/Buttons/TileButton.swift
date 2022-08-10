//
//  TileButton.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 30/07/2022.
//

import SwiftUI

struct TileButton: View {
    
    var text: LocalizedStringKey
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(text)
                    .font(.callout)
                    .bold()
                    .frame(height: 60, alignment: .center)
                Spacer()
            }
        }
        .foregroundColor(Color(uiColor: .systemBackground))
        .background(Color(uiColor: .label))
        .cornerRadius(5)
    }
}

struct TileButton_Previews: PreviewProvider {
    static var previews: some View {
        TileButton(text: "Channels") {}
    }
}
