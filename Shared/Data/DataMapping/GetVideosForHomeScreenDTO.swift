//
//  GetVideosForHomeScreenDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 25/08/2022.
//

import Foundation

extension GetDataForHomeScreenQuery.Data.ContinueWatching: Identifiable {
    public var id: UUID {
        return UUID(uuidString: video.videoId) ?? UUID()
    }
}

extension GetDataForHomeScreenQuery.Data.UserList: Identifiable {
    public var id: UUID {
        return UUID(uuidString: video.videoId) ?? UUID()
    }
}

extension GetDataForHomeScreenQuery.Data.NewRelease: Identifiable {
    public var id: UUID {
        return UUID(uuidString: videoId) ?? UUID()
    }
}
