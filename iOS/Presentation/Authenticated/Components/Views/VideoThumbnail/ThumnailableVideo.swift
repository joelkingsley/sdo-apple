//
//  ThumnailableVideo.swift
//  SDO
//
//  Created by Joel Kingsley on 25/08/2022.
//

import Foundation

protocol ThumbnailableVideo {
    var id: UUID { get }
    var videoTitle: String { get }
    var videoDescription: String { get }
    var channel: ChannelData { get }
    var thumbnailURL: URL { get }
    var datePublished: Date { get }
    var views: Int { get }
}
