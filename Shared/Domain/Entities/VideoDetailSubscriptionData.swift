//
//  VideoDetailSubscriptionData.swift
//  SDO
//
//  Created by Joel Kingsley on 29/08/2022.
//

import Foundation

struct VideoDetailSubscriptionData {
    let signedUrl: URL?
    let subscriptionVideoBelongsTo: SubscriptionData?
    let allAccessSubscription: SubscriptionData
    
    var canUserWatch: Bool {
        return signedUrl != nil
    }
}
