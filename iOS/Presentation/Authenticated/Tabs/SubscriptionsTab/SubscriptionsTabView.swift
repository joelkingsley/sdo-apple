//
//  SubscriptionsTabView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 09/04/2022.
//

import SwiftUI

struct SubscriptionsTabView: View {
    var body: some View {
        Text("Subscriptions Tab")
            .navigationBarTitle(Text("subscriptionsScreenTitle", comment: "Label: Navigation bar title of Subscriptions Screen"))
    }
}

struct SubscriptionsTabView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionsTabView()
    }
}
