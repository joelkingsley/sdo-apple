//
//  AboutTheAppView.swift
//  SDO
//
//  Created by Joel Kingsley on 26/11/2022.
//

import SwiftUI

struct AboutTheAppView: View {
    var body: some View {
        ScrollView {
            VStack {
                Image("Text Logo")
                Text("aboutTheAppDescription1Text")
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                Text("aboutTheAppDescription2Text")
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                Text("aboutTheAppDescription3Text")
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                Text("aboutTheAppDescription4Text")
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                Text("aboutTheAppDescription5Text")
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                Link("joelkingsley.r@gmail.com", destination: URL(string: "mailto:joelkingsley.r@gmail.com")!)
                    .padding(.bottom, 30)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("aboutTheAppLabel")
        }
    }
}

struct AboutTheAppView_Previews: PreviewProvider {
    static var previews: some View {
        AboutTheAppView()
    }
}
