//
//  ActionButton.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 25/06/2022.
//

import SwiftUI

struct ActionButton: View {
    var imageName: String
    
    var text: String
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                
                Image(systemName: imageName)
                    .font(.sdoHeadline)
                
                Text(text)
                    .bold()
                    .font(.sdoCallout)
                
                Spacer()
            }
        }
        .padding(.vertical, 6)
        .foregroundColor(Color.white)
        .background(Color.accentColor)
        .cornerRadius(3.0)
    }

}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(imageName: "play.fill", text: "Play") {
            print("Tapped")
        }
    }
}
