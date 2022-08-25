//
//  VideoMocks.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 25/06/2022.
//

import Foundation

let exampleVideo1 = VideoData(
    videoId: "dummy1",
    videoTitle: "Being Baptist",
    videoDescription: "Being Baptist traces the history from the historic anabaptists to the impact of the independent fundametal churches of today.",
    videoType: .documentary,
    channel: ChannelData(
        channelId: "b6981812-9b66-4661-9fde-a8ad101ca3a5",
        channelName: "Verity Baptist Church",
        channelTypeName: .church
    ),
    speaker: SpeakerData(
        speakerId: "dummy",
        speakerName: "Pastor Roger Jiminez"
    ),
    language: LanguageData(
        languageCode: "en",
        sourceCountryFlag: "🇬🇧"
    ),
    thumbnailURL: URL(
        string: "https://i0.wp.com/seelen-gewinnen.de/wp-content/uploads/2022/03/Gruppenfoto-ohne-Hintergrund.jpg?fit=768%2C576&ssl=1")!,
    datePublished: Date(timeIntervalSinceNow: -60000),
    views: 2_001,
    gcpStorageFileName: "videos/8f7193e8-fd9b-4e6a-9c80-fa61b523fe1f/sermons/Being Baptist (Documentary) - Verity Baptist Church.mp4",
    gcpStorageBucketName: "sdo_free"
)

let exampleVideo2 = VideoData(
    videoId: "dummy2",
    videoTitle: "Being Baptist",
    videoDescription: "Being Baptist traces the history from the historic anabaptists to the impact of the independent fundametal churches of today.",
    videoType: .documentary,
    channel: ChannelData(
        channelId: "b6981812-9b66-4661-9fde-a8ad101ca3a5",
        channelName: "Verity Baptist Church",
        channelTypeName: .church
    ),
    speaker: SpeakerData(
        speakerId: "dummy",
        speakerName: "Pastor Roger Jiminez"
    ),
    language: LanguageData(
        languageCode: "en",
        sourceCountryFlag: "🇬🇧"
    ),
    thumbnailURL: URL(
        string: "https://i0.wp.com/seelen-gewinnen.de/wp-content/uploads/2022/03/Gruppenfoto-ohne-Hintergrund.jpg?fit=768%2C576&ssl=1")!,
    datePublished: Date(timeIntervalSinceNow: -6000),
    views: 10_012_321,
    gcpStorageFileName: "videos/8f7193e8-fd9b-4e6a-9c80-fa61b523fe1f/sermons/Being Baptist (Documentary) - Verity Baptist Church.mp4",
    gcpStorageBucketName: "sdo_free"
)
