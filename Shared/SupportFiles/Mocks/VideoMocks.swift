//
//  VideoMocks.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 25/06/2022.
//

import Foundation

let exampleVideo1 = HomeScreenData.HomeVideo(
    videoId: "dummy1",
    title: "Being Baptist",
    channelName: "Verity Baptist Church",
    thumbnailURL: URL(string: "https://i0.wp.com/seelen-gewinnen.de/wp-content/uploads/2022/03/Gruppenfoto-ohne-Hintergrund.jpg?fit=768%2C576&ssl=1")!,
    datePublished: Date(timeIntervalSinceNow: -60000),
    views: 2_001
)

let exampleVideo2 = HomeScreenData.HomeVideo(
    videoId: "dummy2",
    title: "Being Baptist",
    channelName: "Verity Baptist Church",
    thumbnailURL: URL(string: "https://i0.wp.com/seelen-gewinnen.de/wp-content/uploads/2022/03/Gruppenfoto-ohne-Hintergrund.jpg?fit=768%2C576&ssl=1")!,
    datePublished: Date(timeIntervalSinceNow: -60000),
    views: 10_012_321
)

let exampleVideoDetail1 = VideoDetailData(
    videoId: "dummy1",
    title: "Being Baptist",
    thumbnailURL: URL(string: "https://i0.wp.com/seelen-gewinnen.de/wp-content/uploads/2022/03/Gruppenfoto-ohne-Hintergrund.jpg?fit=768%2C576&ssl=1")!,
    videoType: .documentary,
    datePublished: Date(timeIntervalSinceNow: -60000),
    description: "Being Baptist traces the history from the historic anabaptists to the impact of the independent fundametal churches of today.",
    speaker: VideoDetailData.SpeakerData(speakerId: "dummy1", speakerName: "Pastor Roger Jimenez"),
    canUserWatch: false,
    subscriptionVideoBelongsTo: SubscriptionData(
        subscriptionId: "dummy1",
        subscriptionName: "Verity Baptist",
        subscriptionCost: 199,
        currencyCode: "INR",
        eligibleForTrial: true,
        timeIntervalOfTrial: 2629748.16
    ),
    allAccessSubscription: SubscriptionData(
        subscriptionId: "dummy2",
        subscriptionName: "SDO All Access",
        subscriptionCost: 349,
        currencyCode: "INR",
        eligibleForTrial: true,
        timeIntervalOfTrial: 2629748.16
    ),
    relatedVideos: [
        VideoDetailData.RelatedVideo(
            videoId: "dummy1",
            title: "Once Saved Always Saved",
            channelName: "Faithful Word Baptist Church",
            thumbnailURL: URL(
                string: "https://i0.wp.com/seelen-gewinnen.de/wp-content/uploads/2022/03/Gruppenfoto-ohne-Hintergrund.jpg?fit=768%2C576&ssl=1"
            )!,
            datePublished: Date(timeIntervalSinceNow: -60000),
            views: 9_000
        ),
        VideoDetailData.RelatedVideo(
            videoId: "dummy2",
            title: "1, 2, 3, Repent After Me",
            channelName: "Faithful Word Baptist Church",
            thumbnailURL: URL(
                string: "https://i0.wp.com/seelen-gewinnen.de/wp-content/uploads/2022/03/Gruppenfoto-ohne-Hintergrund.jpg?fit=768%2C576&ssl=1"
            )!,
            datePublished: Date(timeIntervalSinceNow: -60000),
            views: 9_000
        )
    ],
    language: VideoDetailData.LanguageData(
        languageName: "English",
        sourceCountryFlag: "🇬🇧"
    )
)
