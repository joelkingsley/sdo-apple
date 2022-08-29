//
//  GetVideosForHomeScreenDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 25/08/2022.
//

import Foundation

extension GetHomeScreenDataQuery.Data {
    func toEntity() throws -> HomeScreenData {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let continueWatchingVideos = try continueWatching.map { $0.video }.map { video -> HomeScreenData.HomeVideo in
            guard let datePublished = formatter.date(from: video.datePublished) else {
                throw BusinessErrors.parsingError()
            }
            return HomeScreenData.HomeVideo(
                videoId: video.videoId,
                title: video.title,
                channelId: video.channel.channelId,
                channelName: video.channel.channelName,
                thumbnailURL: URL(string: "https://i0.wp.com/seelen-gewinnen.de/wp-content/uploads/2022/03/Gruppenfoto-ohne-Hintergrund.jpg?fit=768%2C576&ssl=1")!,
                datePublished: datePublished,
                views: 0
            )
        }
        let userListVideos = try userList.map { $0.video }.map { video -> HomeScreenData.HomeVideo in
            guard let datePublished = formatter.date(from: video.datePublished) else {
                throw BusinessErrors.parsingError()
            }
            return HomeScreenData.HomeVideo(
                videoId: video.videoId,
                title: video.title,
                channelId: video.channel.channelId,
                channelName: video.channel.channelName,
                thumbnailURL: URL(string: "https://i0.wp.com/seelen-gewinnen.de/wp-content/uploads/2022/03/Gruppenfoto-ohne-Hintergrund.jpg?fit=768%2C576&ssl=1")!,
                datePublished: datePublished,
                views: 0
            )
        }
        let newReleaseVideos = try newReleases.map { video -> HomeScreenData.HomeVideo in
            guard let datePublished = formatter.date(from: video.datePublished) else {
                throw BusinessErrors.parsingError()
            }
            return HomeScreenData.HomeVideo(
                videoId: video.videoId,
                title: video.title,
                channelId: video.channel.channelId,
                channelName: video.channel.channelName,
                thumbnailURL: URL(string: "https://i0.wp.com/seelen-gewinnen.de/wp-content/uploads/2022/03/Gruppenfoto-ohne-Hintergrund.jpg?fit=768%2C576&ssl=1")!,
                datePublished: datePublished,
                views: 0
            )
        }
        return HomeScreenData(
            continueWatchingVideos: continueWatchingVideos,
            userListVideos: userListVideos,
            newReleasesVideos: newReleaseVideos
        )
    }
}
