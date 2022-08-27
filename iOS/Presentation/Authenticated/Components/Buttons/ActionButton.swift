//
//  ActionButton.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 25/06/2022.
//

import SwiftUI

struct ActionButton: View {
    var imageName: String
    
    var text: LocalizedStringKey
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                
                Image(systemName: imageName)
                    .font(.sdoHeadline)
                
                Text(text)
                    .font(.sdoTitle2)
                    .bold()
                
                Spacer()
            }
            .frame(height: 40)
        }
        .padding(.vertical, 6)
        .foregroundColor(Color(uiColor: .systemBackground))
        .background(Color(uiColor: .label))
        .cornerRadius(10)
    }

}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(imageName: "play.fill", text: "Play") {
            print("Tapped")
        }
    }
}
