// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public enum channel_types_enum: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case church
  case soulWinningClub
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "church": self = .church
      case "soulWinningClub": self = .soulWinningClub
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .church: return "church"
      case .soulWinningClub: return "soulWinningClub"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: channel_types_enum, rhs: channel_types_enum) -> Bool {
    switch (lhs, rhs) {
      case (.church, .church): return true
      case (.soulWinningClub, .soulWinningClub): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [channel_types_enum] {
    return [
      .church,
      .soulWinningClub,
    ]
  }
}

public enum video_types_enum: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case documentary
  case music
  case sermon
  case short
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "documentary": self = .documentary
      case "music": self = .music
      case "sermon": self = .sermon
      case "short": self = .short
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .documentary: return "documentary"
      case .music: return "music"
      case .sermon: return "sermon"
      case .short: return "short"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: video_types_enum, rhs: video_types_enum) -> Bool {
    switch (lhs, rhs) {
      case (.documentary, .documentary): return true
      case (.music, .music): return true
      case (.sermon, .sermon): return true
      case (.short, .short): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [video_types_enum] {
    return [
      .documentary,
      .music,
      .sermon,
      .short,
    ]
  }
}

public final class GetVideoUrlDataMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation GetVideoUrlData($videoId: String!) {
      getVideoUrlData(arg1: {videoId: $videoId}) {
        __typename
        videoUrl
      }
    }
    """

  public let operationName: String = "GetVideoUrlData"

  public var videoId: String

  public init(videoId: String) {
    self.videoId = videoId
  }

  public var variables: GraphQLMap? {
    return ["videoId": videoId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getVideoUrlData", arguments: ["arg1": ["videoId": GraphQLVariable("videoId")]], type: .nonNull(.object(GetVideoUrlDatum.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getVideoUrlData: GetVideoUrlDatum) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "getVideoUrlData": getVideoUrlData.resultMap])
    }

    public var getVideoUrlData: GetVideoUrlDatum {
      get {
        return GetVideoUrlDatum(unsafeResultMap: resultMap["getVideoUrlData"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "getVideoUrlData")
      }
    }

    public struct GetVideoUrlDatum: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["GetVideoUrlDataOutput"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("videoUrl", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(videoUrl: String) {
        self.init(unsafeResultMap: ["__typename": "GetVideoUrlDataOutput", "videoUrl": videoUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoUrl: String {
        get {
          return resultMap["videoUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "videoUrl")
        }
      }
    }
  }
}

public final class UpdateVideoLikeDislikeStatusMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateVideoLikeDislikeStatus($userUuid: String!, $videoId: uuid!, $liked: Boolean) {
      insert_videos_likes_dislikes_one(
        object: {liked: $liked, user_uuid: $userUuid, video_id: $videoId}
        on_conflict: {constraint: videos_likes_dislikes_pkey, update_columns: liked}
      ) {
        __typename
        liked
      }
    }
    """

  public let operationName: String = "UpdateVideoLikeDislikeStatus"

  public var userUuid: String
  public var videoId: String
  public var liked: Bool?

  public init(userUuid: String, videoId: String, liked: Bool? = nil) {
    self.userUuid = userUuid
    self.videoId = videoId
    self.liked = liked
  }

  public var variables: GraphQLMap? {
    return ["userUuid": userUuid, "videoId": videoId, "liked": liked]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("insert_videos_likes_dislikes_one", arguments: ["object": ["liked": GraphQLVariable("liked"), "user_uuid": GraphQLVariable("userUuid"), "video_id": GraphQLVariable("videoId")], "on_conflict": ["constraint": "videos_likes_dislikes_pkey", "update_columns": "liked"]], type: .object(InsertVideosLikesDislikesOne.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(insertVideosLikesDislikesOne: InsertVideosLikesDislikesOne? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "insert_videos_likes_dislikes_one": insertVideosLikesDislikesOne.flatMap { (value: InsertVideosLikesDislikesOne) -> ResultMap in value.resultMap }])
    }

    /// insert a single row into the table: "videos_likes_dislikes"
    public var insertVideosLikesDislikesOne: InsertVideosLikesDislikesOne? {
      get {
        return (resultMap["insert_videos_likes_dislikes_one"] as? ResultMap).flatMap { InsertVideosLikesDislikesOne(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "insert_videos_likes_dislikes_one")
      }
    }

    public struct InsertVideosLikesDislikesOne: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["videos_likes_dislikes"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("liked", type: .scalar(Bool.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(liked: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "videos_likes_dislikes", "liked": liked])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var liked: Bool? {
        get {
          return resultMap["liked"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "liked")
        }
      }
    }
  }
}

public final class GetAppleIdRefreshTokenMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation GetAppleIdRefreshToken($code: String!) {
      getAppleIdRefreshToken(arg1: {code: $code}) {
        __typename
        refreshToken
      }
    }
    """

  public let operationName: String = "GetAppleIdRefreshToken"

  public var code: String

  public init(code: String) {
    self.code = code
  }

  public var variables: GraphQLMap? {
    return ["code": code]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getAppleIdRefreshToken", arguments: ["arg1": ["code": GraphQLVariable("code")]], type: .object(GetAppleIdRefreshToken.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getAppleIdRefreshToken: GetAppleIdRefreshToken? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "getAppleIdRefreshToken": getAppleIdRefreshToken.flatMap { (value: GetAppleIdRefreshToken) -> ResultMap in value.resultMap }])
    }

    public var getAppleIdRefreshToken: GetAppleIdRefreshToken? {
      get {
        return (resultMap["getAppleIdRefreshToken"] as? ResultMap).flatMap { GetAppleIdRefreshToken(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "getAppleIdRefreshToken")
      }
    }

    public struct GetAppleIdRefreshToken: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["GetAppleIdRefreshTokenOutput"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("refreshToken", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(refreshToken: String) {
        self.init(unsafeResultMap: ["__typename": "GetAppleIdRefreshTokenOutput", "refreshToken": refreshToken])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var refreshToken: String {
        get {
          return resultMap["refreshToken"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "refreshToken")
        }
      }
    }
  }
}

public final class RevokeAppleIdRefreshTokenMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation RevokeAppleIdRefreshToken($refreshToken: String!) {
      revokeAppleIdRefreshToken(arg1: {refreshToken: $refreshToken}) {
        __typename
        isRevoked
      }
    }
    """

  public let operationName: String = "RevokeAppleIdRefreshToken"

  public var refreshToken: String

  public init(refreshToken: String) {
    self.refreshToken = refreshToken
  }

  public var variables: GraphQLMap? {
    return ["refreshToken": refreshToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("revokeAppleIdRefreshToken", arguments: ["arg1": ["refreshToken": GraphQLVariable("refreshToken")]], type: .object(RevokeAppleIdRefreshToken.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(revokeAppleIdRefreshToken: RevokeAppleIdRefreshToken? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "revokeAppleIdRefreshToken": revokeAppleIdRefreshToken.flatMap { (value: RevokeAppleIdRefreshToken) -> ResultMap in value.resultMap }])
    }

    public var revokeAppleIdRefreshToken: RevokeAppleIdRefreshToken? {
      get {
        return (resultMap["revokeAppleIdRefreshToken"] as? ResultMap).flatMap { RevokeAppleIdRefreshToken(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "revokeAppleIdRefreshToken")
      }
    }

    public struct RevokeAppleIdRefreshToken: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RevokeAppleIdRefreshTokenOutput"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("isRevoked", type: .nonNull(.scalar(Bool.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(isRevoked: Bool) {
        self.init(unsafeResultMap: ["__typename": "RevokeAppleIdRefreshTokenOutput", "isRevoked": isRevoked])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var isRevoked: Bool {
        get {
          return resultMap["isRevoked"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isRevoked")
        }
      }
    }
  }
}

public final class GetAllChannelsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllChannels {
      channels {
        __typename
        channel_id
        channel_name
        channel_type
        location_lat
        location_long
        region_code
        address_text
      }
    }
    """

  public let operationName: String = "GetAllChannels"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("channels", type: .nonNull(.list(.nonNull(.object(Channel.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(channels: [Channel]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "channels": channels.map { (value: Channel) -> ResultMap in value.resultMap }])
    }

    /// An array relationship
    public var channels: [Channel] {
      get {
        return (resultMap["channels"] as! [ResultMap]).map { (value: ResultMap) -> Channel in Channel(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Channel) -> ResultMap in value.resultMap }, forKey: "channels")
      }
    }

    public struct Channel: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["channels"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel_name", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel_type", type: .nonNull(.scalar(channel_types_enum.self))),
          GraphQLField("location_lat", type: .nonNull(.scalar(String.self))),
          GraphQLField("location_long", type: .nonNull(.scalar(String.self))),
          GraphQLField("region_code", type: .nonNull(.scalar(String.self))),
          GraphQLField("address_text", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(channelId: String, channelName: String, channelType: channel_types_enum, locationLat: String, locationLong: String, regionCode: String, addressText: String) {
        self.init(unsafeResultMap: ["__typename": "channels", "channel_id": channelId, "channel_name": channelName, "channel_type": channelType, "location_lat": locationLat, "location_long": locationLong, "region_code": regionCode, "address_text": addressText])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var channelId: String {
        get {
          return resultMap["channel_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "channel_id")
        }
      }

      public var channelName: String {
        get {
          return resultMap["channel_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "channel_name")
        }
      }

      public var channelType: channel_types_enum {
        get {
          return resultMap["channel_type"]! as! channel_types_enum
        }
        set {
          resultMap.updateValue(newValue, forKey: "channel_type")
        }
      }

      public var locationLat: String {
        get {
          return resultMap["location_lat"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "location_lat")
        }
      }

      public var locationLong: String {
        get {
          return resultMap["location_long"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "location_long")
        }
      }

      public var regionCode: String {
        get {
          return resultMap["region_code"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "region_code")
        }
      }

      public var addressText: String {
        get {
          return resultMap["address_text"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "address_text")
        }
      }
    }
  }
}

public final class GetHomeScreenDataQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetHomeScreenData {
      documentaries: videos(
        where: {video_type: {_eq: documentary}}
        order_by: {date_published: desc}
        limit: 15
      ) {
        __typename
        video_id
        channel {
          __typename
          channel_id
          channel_name
        }
        date_published
        title
        speaker {
          __typename
          speaker_name
        }
        gcp_thumbnail_bucket_name
        gcp_thumbnail_file_name
      }
      sermons: videos(
        where: {video_type: {_eq: sermon}}
        order_by: {date_published: desc}
        limit: 15
      ) {
        __typename
        video_id
        channel {
          __typename
          channel_id
          channel_name
        }
        date_published
        title
        speaker {
          __typename
          speaker_name
        }
        gcp_thumbnail_bucket_name
        gcp_thumbnail_file_name
      }
      shorts: videos(
        where: {video_type: {_eq: short}}
        order_by: {date_published: desc}
        limit: 15
      ) {
        __typename
        video_id
        channel {
          __typename
          channel_id
          channel_name
        }
        date_published
        title
        speaker {
          __typename
          speaker_name
        }
        gcp_thumbnail_bucket_name
        gcp_thumbnail_file_name
      }
      musicVideos: videos(
        where: {video_type: {_eq: music}}
        order_by: {date_published: desc}
        limit: 15
      ) {
        __typename
        video_id
        channel {
          __typename
          channel_id
          channel_name
        }
        date_published
        title
        speaker {
          __typename
          speaker_name
        }
        gcp_thumbnail_bucket_name
        gcp_thumbnail_file_name
      }
    }
    """

  public let operationName: String = "GetHomeScreenData"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("videos", alias: "documentaries", arguments: ["where": ["video_type": ["_eq": "documentary"]], "order_by": ["date_published": "desc"], "limit": 15], type: .nonNull(.list(.nonNull(.object(Documentary.selections))))),
        GraphQLField("videos", alias: "sermons", arguments: ["where": ["video_type": ["_eq": "sermon"]], "order_by": ["date_published": "desc"], "limit": 15], type: .nonNull(.list(.nonNull(.object(Sermon.selections))))),
        GraphQLField("videos", alias: "shorts", arguments: ["where": ["video_type": ["_eq": "short"]], "order_by": ["date_published": "desc"], "limit": 15], type: .nonNull(.list(.nonNull(.object(Short.selections))))),
        GraphQLField("videos", alias: "musicVideos", arguments: ["where": ["video_type": ["_eq": "music"]], "order_by": ["date_published": "desc"], "limit": 15], type: .nonNull(.list(.nonNull(.object(MusicVideo.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(documentaries: [Documentary], sermons: [Sermon], shorts: [Short], musicVideos: [MusicVideo]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "documentaries": documentaries.map { (value: Documentary) -> ResultMap in value.resultMap }, "sermons": sermons.map { (value: Sermon) -> ResultMap in value.resultMap }, "shorts": shorts.map { (value: Short) -> ResultMap in value.resultMap }, "musicVideos": musicVideos.map { (value: MusicVideo) -> ResultMap in value.resultMap }])
    }

    /// An array relationship
    public var documentaries: [Documentary] {
      get {
        return (resultMap["documentaries"] as! [ResultMap]).map { (value: ResultMap) -> Documentary in Documentary(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Documentary) -> ResultMap in value.resultMap }, forKey: "documentaries")
      }
    }

    /// An array relationship
    public var sermons: [Sermon] {
      get {
        return (resultMap["sermons"] as! [ResultMap]).map { (value: ResultMap) -> Sermon in Sermon(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Sermon) -> ResultMap in value.resultMap }, forKey: "sermons")
      }
    }

    /// An array relationship
    public var shorts: [Short] {
      get {
        return (resultMap["shorts"] as! [ResultMap]).map { (value: ResultMap) -> Short in Short(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Short) -> ResultMap in value.resultMap }, forKey: "shorts")
      }
    }

    /// An array relationship
    public var musicVideos: [MusicVideo] {
      get {
        return (resultMap["musicVideos"] as! [ResultMap]).map { (value: ResultMap) -> MusicVideo in MusicVideo(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: MusicVideo) -> ResultMap in value.resultMap }, forKey: "musicVideos")
      }
    }

    public struct Documentary: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["videos"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("video_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel", type: .nonNull(.object(Channel.selections))),
          GraphQLField("date_published", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("speaker", type: .nonNull(.object(Speaker.selections))),
          GraphQLField("gcp_thumbnail_bucket_name", type: .nonNull(.scalar(String.self))),
          GraphQLField("gcp_thumbnail_file_name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(videoId: String, channel: Channel, datePublished: String, title: String, speaker: Speaker, gcpThumbnailBucketName: String, gcpThumbnailFileName: String) {
        self.init(unsafeResultMap: ["__typename": "videos", "video_id": videoId, "channel": channel.resultMap, "date_published": datePublished, "title": title, "speaker": speaker.resultMap, "gcp_thumbnail_bucket_name": gcpThumbnailBucketName, "gcp_thumbnail_file_name": gcpThumbnailFileName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoId: String {
        get {
          return resultMap["video_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "video_id")
        }
      }

      /// An object relationship
      public var channel: Channel {
        get {
          return Channel(unsafeResultMap: resultMap["channel"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "channel")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["date_published"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date_published")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An object relationship
      public var speaker: Speaker {
        get {
          return Speaker(unsafeResultMap: resultMap["speaker"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "speaker")
        }
      }

      /// Name of GCP bucket where video is stored
      public var gcpThumbnailBucketName: String {
        get {
          return resultMap["gcp_thumbnail_bucket_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_bucket_name")
        }
      }

      /// The relative file path including the file extension to the thumbnail (without bucket name)
      public var gcpThumbnailFileName: String {
        get {
          return resultMap["gcp_thumbnail_file_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_file_name")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["channels"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(channelId: String, channelName: String) {
          self.init(unsafeResultMap: ["__typename": "channels", "channel_id": channelId, "channel_name": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var channelId: String {
          get {
            return resultMap["channel_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channel_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_name")
          }
        }
      }

      public struct Speaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["speakers"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("speaker_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speakerName: String) {
          self.init(unsafeResultMap: ["__typename": "speakers", "speaker_name": speakerName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// If a single person, it should be in the following format: <title> <full name>. If multiple people, each person should be mentioned in the same format with an appropriate comma or ampersand between them. If it is a group, then just the group's name is enough.
        public var speakerName: String {
          get {
            return resultMap["speaker_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "speaker_name")
          }
        }
      }
    }

    public struct Sermon: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["videos"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("video_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel", type: .nonNull(.object(Channel.selections))),
          GraphQLField("date_published", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("speaker", type: .nonNull(.object(Speaker.selections))),
          GraphQLField("gcp_thumbnail_bucket_name", type: .nonNull(.scalar(String.self))),
          GraphQLField("gcp_thumbnail_file_name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(videoId: String, channel: Channel, datePublished: String, title: String, speaker: Speaker, gcpThumbnailBucketName: String, gcpThumbnailFileName: String) {
        self.init(unsafeResultMap: ["__typename": "videos", "video_id": videoId, "channel": channel.resultMap, "date_published": datePublished, "title": title, "speaker": speaker.resultMap, "gcp_thumbnail_bucket_name": gcpThumbnailBucketName, "gcp_thumbnail_file_name": gcpThumbnailFileName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoId: String {
        get {
          return resultMap["video_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "video_id")
        }
      }

      /// An object relationship
      public var channel: Channel {
        get {
          return Channel(unsafeResultMap: resultMap["channel"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "channel")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["date_published"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date_published")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An object relationship
      public var speaker: Speaker {
        get {
          return Speaker(unsafeResultMap: resultMap["speaker"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "speaker")
        }
      }

      /// Name of GCP bucket where video is stored
      public var gcpThumbnailBucketName: String {
        get {
          return resultMap["gcp_thumbnail_bucket_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_bucket_name")
        }
      }

      /// The relative file path including the file extension to the thumbnail (without bucket name)
      public var gcpThumbnailFileName: String {
        get {
          return resultMap["gcp_thumbnail_file_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_file_name")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["channels"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(channelId: String, channelName: String) {
          self.init(unsafeResultMap: ["__typename": "channels", "channel_id": channelId, "channel_name": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var channelId: String {
          get {
            return resultMap["channel_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channel_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_name")
          }
        }
      }

      public struct Speaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["speakers"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("speaker_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speakerName: String) {
          self.init(unsafeResultMap: ["__typename": "speakers", "speaker_name": speakerName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// If a single person, it should be in the following format: <title> <full name>. If multiple people, each person should be mentioned in the same format with an appropriate comma or ampersand between them. If it is a group, then just the group's name is enough.
        public var speakerName: String {
          get {
            return resultMap["speaker_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "speaker_name")
          }
        }
      }
    }

    public struct Short: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["videos"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("video_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel", type: .nonNull(.object(Channel.selections))),
          GraphQLField("date_published", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("speaker", type: .nonNull(.object(Speaker.selections))),
          GraphQLField("gcp_thumbnail_bucket_name", type: .nonNull(.scalar(String.self))),
          GraphQLField("gcp_thumbnail_file_name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(videoId: String, channel: Channel, datePublished: String, title: String, speaker: Speaker, gcpThumbnailBucketName: String, gcpThumbnailFileName: String) {
        self.init(unsafeResultMap: ["__typename": "videos", "video_id": videoId, "channel": channel.resultMap, "date_published": datePublished, "title": title, "speaker": speaker.resultMap, "gcp_thumbnail_bucket_name": gcpThumbnailBucketName, "gcp_thumbnail_file_name": gcpThumbnailFileName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoId: String {
        get {
          return resultMap["video_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "video_id")
        }
      }

      /// An object relationship
      public var channel: Channel {
        get {
          return Channel(unsafeResultMap: resultMap["channel"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "channel")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["date_published"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date_published")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An object relationship
      public var speaker: Speaker {
        get {
          return Speaker(unsafeResultMap: resultMap["speaker"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "speaker")
        }
      }

      /// Name of GCP bucket where video is stored
      public var gcpThumbnailBucketName: String {
        get {
          return resultMap["gcp_thumbnail_bucket_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_bucket_name")
        }
      }

      /// The relative file path including the file extension to the thumbnail (without bucket name)
      public var gcpThumbnailFileName: String {
        get {
          return resultMap["gcp_thumbnail_file_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_file_name")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["channels"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(channelId: String, channelName: String) {
          self.init(unsafeResultMap: ["__typename": "channels", "channel_id": channelId, "channel_name": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var channelId: String {
          get {
            return resultMap["channel_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channel_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_name")
          }
        }
      }

      public struct Speaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["speakers"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("speaker_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speakerName: String) {
          self.init(unsafeResultMap: ["__typename": "speakers", "speaker_name": speakerName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// If a single person, it should be in the following format: <title> <full name>. If multiple people, each person should be mentioned in the same format with an appropriate comma or ampersand between them. If it is a group, then just the group's name is enough.
        public var speakerName: String {
          get {
            return resultMap["speaker_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "speaker_name")
          }
        }
      }
    }

    public struct MusicVideo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["videos"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("video_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel", type: .nonNull(.object(Channel.selections))),
          GraphQLField("date_published", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("speaker", type: .nonNull(.object(Speaker.selections))),
          GraphQLField("gcp_thumbnail_bucket_name", type: .nonNull(.scalar(String.self))),
          GraphQLField("gcp_thumbnail_file_name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(videoId: String, channel: Channel, datePublished: String, title: String, speaker: Speaker, gcpThumbnailBucketName: String, gcpThumbnailFileName: String) {
        self.init(unsafeResultMap: ["__typename": "videos", "video_id": videoId, "channel": channel.resultMap, "date_published": datePublished, "title": title, "speaker": speaker.resultMap, "gcp_thumbnail_bucket_name": gcpThumbnailBucketName, "gcp_thumbnail_file_name": gcpThumbnailFileName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoId: String {
        get {
          return resultMap["video_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "video_id")
        }
      }

      /// An object relationship
      public var channel: Channel {
        get {
          return Channel(unsafeResultMap: resultMap["channel"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "channel")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["date_published"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date_published")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An object relationship
      public var speaker: Speaker {
        get {
          return Speaker(unsafeResultMap: resultMap["speaker"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "speaker")
        }
      }

      /// Name of GCP bucket where video is stored
      public var gcpThumbnailBucketName: String {
        get {
          return resultMap["gcp_thumbnail_bucket_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_bucket_name")
        }
      }

      /// The relative file path including the file extension to the thumbnail (without bucket name)
      public var gcpThumbnailFileName: String {
        get {
          return resultMap["gcp_thumbnail_file_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_file_name")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["channels"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(channelId: String, channelName: String) {
          self.init(unsafeResultMap: ["__typename": "channels", "channel_id": channelId, "channel_name": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var channelId: String {
          get {
            return resultMap["channel_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channel_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_name")
          }
        }
      }

      public struct Speaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["speakers"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("speaker_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speakerName: String) {
          self.init(unsafeResultMap: ["__typename": "speakers", "speaker_name": speakerName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// If a single person, it should be in the following format: <title> <full name>. If multiple people, each person should be mentioned in the same format with an appropriate comma or ampersand between them. If it is a group, then just the group's name is enough.
        public var speakerName: String {
          get {
            return resultMap["speaker_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "speaker_name")
          }
        }
      }
    }
  }
}

public final class GetVideoDetailDataQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetVideoDetailData($videoId: uuid!, $channelId: uuid!, $userUuid: String!) {
      videoDetail: videos(where: {video_id: {_eq: $videoId}}) {
        __typename
        video_id
        title
        video_type
        date_published
        description
        speaker {
          __typename
          speaker_id
          speaker_name
        }
        channel {
          __typename
          channel_id
          channel_name
          channel_type
        }
        language {
          __typename
          language_code
          source_country_flag
        }
        gcp_thumbnail_bucket_name
        gcp_thumbnail_file_name
      }
      moreVideosInChannel: videos(
        where: {channel_id: {_eq: $channelId}, video_id: {_neq: $videoId}}
      ) {
        __typename
        video_id
        title
        channel {
          __typename
          channel_id
          channel_name
        }
        date_published
        speaker {
          __typename
          speaker_name
        }
        gcp_thumbnail_bucket_name
        gcp_thumbnail_file_name
      }
      videos_likes_dislikes(
        where: {user_uuid: {_eq: $userUuid}, video_id: {_eq: $videoId}}
      ) {
        __typename
        liked
      }
    }
    """

  public let operationName: String = "GetVideoDetailData"

  public var videoId: String
  public var channelId: String
  public var userUuid: String

  public init(videoId: String, channelId: String, userUuid: String) {
    self.videoId = videoId
    self.channelId = channelId
    self.userUuid = userUuid
  }

  public var variables: GraphQLMap? {
    return ["videoId": videoId, "channelId": channelId, "userUuid": userUuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("videos", alias: "videoDetail", arguments: ["where": ["video_id": ["_eq": GraphQLVariable("videoId")]]], type: .nonNull(.list(.nonNull(.object(VideoDetail.selections))))),
        GraphQLField("videos", alias: "moreVideosInChannel", arguments: ["where": ["channel_id": ["_eq": GraphQLVariable("channelId")], "video_id": ["_neq": GraphQLVariable("videoId")]]], type: .nonNull(.list(.nonNull(.object(MoreVideosInChannel.selections))))),
        GraphQLField("videos_likes_dislikes", arguments: ["where": ["user_uuid": ["_eq": GraphQLVariable("userUuid")], "video_id": ["_eq": GraphQLVariable("videoId")]]], type: .nonNull(.list(.nonNull(.object(VideosLikesDislike.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(videoDetail: [VideoDetail], moreVideosInChannel: [MoreVideosInChannel], videosLikesDislikes: [VideosLikesDislike]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "videoDetail": videoDetail.map { (value: VideoDetail) -> ResultMap in value.resultMap }, "moreVideosInChannel": moreVideosInChannel.map { (value: MoreVideosInChannel) -> ResultMap in value.resultMap }, "videos_likes_dislikes": videosLikesDislikes.map { (value: VideosLikesDislike) -> ResultMap in value.resultMap }])
    }

    /// An array relationship
    public var videoDetail: [VideoDetail] {
      get {
        return (resultMap["videoDetail"] as! [ResultMap]).map { (value: ResultMap) -> VideoDetail in VideoDetail(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: VideoDetail) -> ResultMap in value.resultMap }, forKey: "videoDetail")
      }
    }

    /// An array relationship
    public var moreVideosInChannel: [MoreVideosInChannel] {
      get {
        return (resultMap["moreVideosInChannel"] as! [ResultMap]).map { (value: ResultMap) -> MoreVideosInChannel in MoreVideosInChannel(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: MoreVideosInChannel) -> ResultMap in value.resultMap }, forKey: "moreVideosInChannel")
      }
    }

    /// An array relationship
    public var videosLikesDislikes: [VideosLikesDislike] {
      get {
        return (resultMap["videos_likes_dislikes"] as! [ResultMap]).map { (value: ResultMap) -> VideosLikesDislike in VideosLikesDislike(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: VideosLikesDislike) -> ResultMap in value.resultMap }, forKey: "videos_likes_dislikes")
      }
    }

    public struct VideoDetail: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["videos"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("video_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("video_type", type: .nonNull(.scalar(video_types_enum.self))),
          GraphQLField("date_published", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("speaker", type: .nonNull(.object(Speaker.selections))),
          GraphQLField("channel", type: .nonNull(.object(Channel.selections))),
          GraphQLField("language", type: .nonNull(.object(Language.selections))),
          GraphQLField("gcp_thumbnail_bucket_name", type: .nonNull(.scalar(String.self))),
          GraphQLField("gcp_thumbnail_file_name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(videoId: String, title: String, videoType: video_types_enum, datePublished: String, description: String, speaker: Speaker, channel: Channel, language: Language, gcpThumbnailBucketName: String, gcpThumbnailFileName: String) {
        self.init(unsafeResultMap: ["__typename": "videos", "video_id": videoId, "title": title, "video_type": videoType, "date_published": datePublished, "description": description, "speaker": speaker.resultMap, "channel": channel.resultMap, "language": language.resultMap, "gcp_thumbnail_bucket_name": gcpThumbnailBucketName, "gcp_thumbnail_file_name": gcpThumbnailFileName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoId: String {
        get {
          return resultMap["video_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "video_id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var videoType: video_types_enum {
        get {
          return resultMap["video_type"]! as! video_types_enum
        }
        set {
          resultMap.updateValue(newValue, forKey: "video_type")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["date_published"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date_published")
        }
      }

      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      /// An object relationship
      public var speaker: Speaker {
        get {
          return Speaker(unsafeResultMap: resultMap["speaker"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "speaker")
        }
      }

      /// An object relationship
      public var channel: Channel {
        get {
          return Channel(unsafeResultMap: resultMap["channel"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "channel")
        }
      }

      /// An object relationship
      public var language: Language {
        get {
          return Language(unsafeResultMap: resultMap["language"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "language")
        }
      }

      /// Name of GCP bucket where video is stored
      public var gcpThumbnailBucketName: String {
        get {
          return resultMap["gcp_thumbnail_bucket_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_bucket_name")
        }
      }

      /// The relative file path including the file extension to the thumbnail (without bucket name)
      public var gcpThumbnailFileName: String {
        get {
          return resultMap["gcp_thumbnail_file_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_file_name")
        }
      }

      public struct Speaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["speakers"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("speaker_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("speaker_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speakerId: String, speakerName: String) {
          self.init(unsafeResultMap: ["__typename": "speakers", "speaker_id": speakerId, "speaker_name": speakerName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var speakerId: String {
          get {
            return resultMap["speaker_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "speaker_id")
          }
        }

        /// If a single person, it should be in the following format: <title> <full name>. If multiple people, each person should be mentioned in the same format with an appropriate comma or ampersand between them. If it is a group, then just the group's name is enough.
        public var speakerName: String {
          get {
            return resultMap["speaker_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "speaker_name")
          }
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["channels"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_name", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_type", type: .nonNull(.scalar(channel_types_enum.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(channelId: String, channelName: String, channelType: channel_types_enum) {
          self.init(unsafeResultMap: ["__typename": "channels", "channel_id": channelId, "channel_name": channelName, "channel_type": channelType])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var channelId: String {
          get {
            return resultMap["channel_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channel_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_name")
          }
        }

        public var channelType: channel_types_enum {
          get {
            return resultMap["channel_type"]! as! channel_types_enum
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_type")
          }
        }
      }

      public struct Language: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["languages"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("language_code", type: .nonNull(.scalar(String.self))),
            GraphQLField("source_country_flag", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(languageCode: String, sourceCountryFlag: String) {
          self.init(unsafeResultMap: ["__typename": "languages", "language_code": languageCode, "source_country_flag": sourceCountryFlag])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var languageCode: String {
          get {
            return resultMap["language_code"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "language_code")
          }
        }

        public var sourceCountryFlag: String {
          get {
            return resultMap["source_country_flag"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "source_country_flag")
          }
        }
      }
    }

    public struct MoreVideosInChannel: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["videos"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("video_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel", type: .nonNull(.object(Channel.selections))),
          GraphQLField("date_published", type: .nonNull(.scalar(String.self))),
          GraphQLField("speaker", type: .nonNull(.object(Speaker.selections))),
          GraphQLField("gcp_thumbnail_bucket_name", type: .nonNull(.scalar(String.self))),
          GraphQLField("gcp_thumbnail_file_name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(videoId: String, title: String, channel: Channel, datePublished: String, speaker: Speaker, gcpThumbnailBucketName: String, gcpThumbnailFileName: String) {
        self.init(unsafeResultMap: ["__typename": "videos", "video_id": videoId, "title": title, "channel": channel.resultMap, "date_published": datePublished, "speaker": speaker.resultMap, "gcp_thumbnail_bucket_name": gcpThumbnailBucketName, "gcp_thumbnail_file_name": gcpThumbnailFileName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoId: String {
        get {
          return resultMap["video_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "video_id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An object relationship
      public var channel: Channel {
        get {
          return Channel(unsafeResultMap: resultMap["channel"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "channel")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["date_published"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date_published")
        }
      }

      /// An object relationship
      public var speaker: Speaker {
        get {
          return Speaker(unsafeResultMap: resultMap["speaker"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "speaker")
        }
      }

      /// Name of GCP bucket where video is stored
      public var gcpThumbnailBucketName: String {
        get {
          return resultMap["gcp_thumbnail_bucket_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_bucket_name")
        }
      }

      /// The relative file path including the file extension to the thumbnail (without bucket name)
      public var gcpThumbnailFileName: String {
        get {
          return resultMap["gcp_thumbnail_file_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_file_name")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["channels"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(channelId: String, channelName: String) {
          self.init(unsafeResultMap: ["__typename": "channels", "channel_id": channelId, "channel_name": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var channelId: String {
          get {
            return resultMap["channel_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channel_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_name")
          }
        }
      }

      public struct Speaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["speakers"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("speaker_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speakerName: String) {
          self.init(unsafeResultMap: ["__typename": "speakers", "speaker_name": speakerName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// If a single person, it should be in the following format: <title> <full name>. If multiple people, each person should be mentioned in the same format with an appropriate comma or ampersand between them. If it is a group, then just the group's name is enough.
        public var speakerName: String {
          get {
            return resultMap["speaker_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "speaker_name")
          }
        }
      }
    }

    public struct VideosLikesDislike: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["videos_likes_dislikes"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("liked", type: .scalar(Bool.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(liked: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "videos_likes_dislikes", "liked": liked])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var liked: Bool? {
        get {
          return resultMap["liked"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "liked")
        }
      }
    }
  }
}

public final class GetVideosForSearchTextQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetVideosForSearchText($searchText: String!, $limit: Int!, $offset: Int!) {
      videos(
        where: {_or: [{channel: {channel_name: {_ilike: $searchText}}}, {title: {_ilike: $searchText}}]}
        limit: $limit
        offset: $offset
      ) {
        __typename
        video_id
        video_type
        title
        channel {
          __typename
          channel_id
          channel_name
        }
        date_published
        speaker {
          __typename
          speaker_name
        }
        gcp_thumbnail_bucket_name
        gcp_thumbnail_file_name
      }
      videos_aggregate(
        where: {_or: [{channel: {channel_name: {_ilike: $searchText}}}, {title: {_ilike: $searchText}}]}
      ) {
        __typename
        aggregate {
          __typename
          count
        }
      }
    }
    """

  public let operationName: String = "GetVideosForSearchText"

  public var searchText: String
  public var limit: Int
  public var offset: Int

  public init(searchText: String, limit: Int, offset: Int) {
    self.searchText = searchText
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["searchText": searchText, "limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("videos", arguments: ["where": ["_or": [["channel": ["channel_name": ["_ilike": GraphQLVariable("searchText")]]], ["title": ["_ilike": GraphQLVariable("searchText")]]]], "limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .nonNull(.list(.nonNull(.object(Video.selections))))),
        GraphQLField("videos_aggregate", arguments: ["where": ["_or": [["channel": ["channel_name": ["_ilike": GraphQLVariable("searchText")]]], ["title": ["_ilike": GraphQLVariable("searchText")]]]]], type: .nonNull(.object(VideosAggregate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(videos: [Video], videosAggregate: VideosAggregate) {
      self.init(unsafeResultMap: ["__typename": "query_root", "videos": videos.map { (value: Video) -> ResultMap in value.resultMap }, "videos_aggregate": videosAggregate.resultMap])
    }

    /// An array relationship
    public var videos: [Video] {
      get {
        return (resultMap["videos"] as! [ResultMap]).map { (value: ResultMap) -> Video in Video(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Video) -> ResultMap in value.resultMap }, forKey: "videos")
      }
    }

    /// An aggregate relationship
    public var videosAggregate: VideosAggregate {
      get {
        return VideosAggregate(unsafeResultMap: resultMap["videos_aggregate"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "videos_aggregate")
      }
    }

    public struct Video: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["videos"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("video_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("video_type", type: .nonNull(.scalar(video_types_enum.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel", type: .nonNull(.object(Channel.selections))),
          GraphQLField("date_published", type: .nonNull(.scalar(String.self))),
          GraphQLField("speaker", type: .nonNull(.object(Speaker.selections))),
          GraphQLField("gcp_thumbnail_bucket_name", type: .nonNull(.scalar(String.self))),
          GraphQLField("gcp_thumbnail_file_name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(videoId: String, videoType: video_types_enum, title: String, channel: Channel, datePublished: String, speaker: Speaker, gcpThumbnailBucketName: String, gcpThumbnailFileName: String) {
        self.init(unsafeResultMap: ["__typename": "videos", "video_id": videoId, "video_type": videoType, "title": title, "channel": channel.resultMap, "date_published": datePublished, "speaker": speaker.resultMap, "gcp_thumbnail_bucket_name": gcpThumbnailBucketName, "gcp_thumbnail_file_name": gcpThumbnailFileName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoId: String {
        get {
          return resultMap["video_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "video_id")
        }
      }

      public var videoType: video_types_enum {
        get {
          return resultMap["video_type"]! as! video_types_enum
        }
        set {
          resultMap.updateValue(newValue, forKey: "video_type")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An object relationship
      public var channel: Channel {
        get {
          return Channel(unsafeResultMap: resultMap["channel"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "channel")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["date_published"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date_published")
        }
      }

      /// An object relationship
      public var speaker: Speaker {
        get {
          return Speaker(unsafeResultMap: resultMap["speaker"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "speaker")
        }
      }

      /// Name of GCP bucket where video is stored
      public var gcpThumbnailBucketName: String {
        get {
          return resultMap["gcp_thumbnail_bucket_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_bucket_name")
        }
      }

      /// The relative file path including the file extension to the thumbnail (without bucket name)
      public var gcpThumbnailFileName: String {
        get {
          return resultMap["gcp_thumbnail_file_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_file_name")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["channels"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(channelId: String, channelName: String) {
          self.init(unsafeResultMap: ["__typename": "channels", "channel_id": channelId, "channel_name": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var channelId: String {
          get {
            return resultMap["channel_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channel_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_name")
          }
        }
      }

      public struct Speaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["speakers"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("speaker_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speakerName: String) {
          self.init(unsafeResultMap: ["__typename": "speakers", "speaker_name": speakerName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// If a single person, it should be in the following format: <title> <full name>. If multiple people, each person should be mentioned in the same format with an appropriate comma or ampersand between them. If it is a group, then just the group's name is enough.
        public var speakerName: String {
          get {
            return resultMap["speaker_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "speaker_name")
          }
        }
      }
    }

    public struct VideosAggregate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["videos_aggregate"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("aggregate", type: .object(Aggregate.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(aggregate: Aggregate? = nil) {
        self.init(unsafeResultMap: ["__typename": "videos_aggregate", "aggregate": aggregate.flatMap { (value: Aggregate) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var aggregate: Aggregate? {
        get {
          return (resultMap["aggregate"] as? ResultMap).flatMap { Aggregate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "aggregate")
        }
      }

      public struct Aggregate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["videos_aggregate_fields"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int) {
          self.init(unsafeResultMap: ["__typename": "videos_aggregate_fields", "count": count])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var count: Int {
          get {
            return resultMap["count"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }
      }
    }
  }
}

public final class GetVideosForSearchTextAndVideoTypeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetVideosForSearchTextAndVideoType($searchText: String!, $videoType: video_types_enum!, $limit: Int!, $offset: Int!) {
      videos(
        where: {_or: [{channel: {channel_name: {_ilike: $searchText}}}, {title: {_ilike: $searchText}}], video_type: {_eq: $videoType}}
        limit: $limit
        offset: $offset
      ) {
        __typename
        video_id
        video_type
        title
        channel {
          __typename
          channel_id
          channel_name
        }
        date_published
        speaker {
          __typename
          speaker_name
        }
        gcp_thumbnail_bucket_name
        gcp_thumbnail_file_name
      }
      videos_aggregate(
        where: {_or: [{channel: {channel_name: {_ilike: $searchText}}}, {title: {_ilike: $searchText}}], video_type: {_eq: $videoType}}
      ) {
        __typename
        aggregate {
          __typename
          count
        }
      }
    }
    """

  public let operationName: String = "GetVideosForSearchTextAndVideoType"

  public var searchText: String
  public var videoType: video_types_enum
  public var limit: Int
  public var offset: Int

  public init(searchText: String, videoType: video_types_enum, limit: Int, offset: Int) {
    self.searchText = searchText
    self.videoType = videoType
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["searchText": searchText, "videoType": videoType, "limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("videos", arguments: ["where": ["_or": [["channel": ["channel_name": ["_ilike": GraphQLVariable("searchText")]]], ["title": ["_ilike": GraphQLVariable("searchText")]]], "video_type": ["_eq": GraphQLVariable("videoType")]], "limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .nonNull(.list(.nonNull(.object(Video.selections))))),
        GraphQLField("videos_aggregate", arguments: ["where": ["_or": [["channel": ["channel_name": ["_ilike": GraphQLVariable("searchText")]]], ["title": ["_ilike": GraphQLVariable("searchText")]]], "video_type": ["_eq": GraphQLVariable("videoType")]]], type: .nonNull(.object(VideosAggregate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(videos: [Video], videosAggregate: VideosAggregate) {
      self.init(unsafeResultMap: ["__typename": "query_root", "videos": videos.map { (value: Video) -> ResultMap in value.resultMap }, "videos_aggregate": videosAggregate.resultMap])
    }

    /// An array relationship
    public var videos: [Video] {
      get {
        return (resultMap["videos"] as! [ResultMap]).map { (value: ResultMap) -> Video in Video(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Video) -> ResultMap in value.resultMap }, forKey: "videos")
      }
    }

    /// An aggregate relationship
    public var videosAggregate: VideosAggregate {
      get {
        return VideosAggregate(unsafeResultMap: resultMap["videos_aggregate"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "videos_aggregate")
      }
    }

    public struct Video: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["videos"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("video_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("video_type", type: .nonNull(.scalar(video_types_enum.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel", type: .nonNull(.object(Channel.selections))),
          GraphQLField("date_published", type: .nonNull(.scalar(String.self))),
          GraphQLField("speaker", type: .nonNull(.object(Speaker.selections))),
          GraphQLField("gcp_thumbnail_bucket_name", type: .nonNull(.scalar(String.self))),
          GraphQLField("gcp_thumbnail_file_name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(videoId: String, videoType: video_types_enum, title: String, channel: Channel, datePublished: String, speaker: Speaker, gcpThumbnailBucketName: String, gcpThumbnailFileName: String) {
        self.init(unsafeResultMap: ["__typename": "videos", "video_id": videoId, "video_type": videoType, "title": title, "channel": channel.resultMap, "date_published": datePublished, "speaker": speaker.resultMap, "gcp_thumbnail_bucket_name": gcpThumbnailBucketName, "gcp_thumbnail_file_name": gcpThumbnailFileName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoId: String {
        get {
          return resultMap["video_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "video_id")
        }
      }

      public var videoType: video_types_enum {
        get {
          return resultMap["video_type"]! as! video_types_enum
        }
        set {
          resultMap.updateValue(newValue, forKey: "video_type")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An object relationship
      public var channel: Channel {
        get {
          return Channel(unsafeResultMap: resultMap["channel"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "channel")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["date_published"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date_published")
        }
      }

      /// An object relationship
      public var speaker: Speaker {
        get {
          return Speaker(unsafeResultMap: resultMap["speaker"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "speaker")
        }
      }

      /// Name of GCP bucket where video is stored
      public var gcpThumbnailBucketName: String {
        get {
          return resultMap["gcp_thumbnail_bucket_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_bucket_name")
        }
      }

      /// The relative file path including the file extension to the thumbnail (without bucket name)
      public var gcpThumbnailFileName: String {
        get {
          return resultMap["gcp_thumbnail_file_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_file_name")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["channels"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(channelId: String, channelName: String) {
          self.init(unsafeResultMap: ["__typename": "channels", "channel_id": channelId, "channel_name": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var channelId: String {
          get {
            return resultMap["channel_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channel_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_name")
          }
        }
      }

      public struct Speaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["speakers"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("speaker_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speakerName: String) {
          self.init(unsafeResultMap: ["__typename": "speakers", "speaker_name": speakerName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// If a single person, it should be in the following format: <title> <full name>. If multiple people, each person should be mentioned in the same format with an appropriate comma or ampersand between them. If it is a group, then just the group's name is enough.
        public var speakerName: String {
          get {
            return resultMap["speaker_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "speaker_name")
          }
        }
      }
    }

    public struct VideosAggregate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["videos_aggregate"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("aggregate", type: .object(Aggregate.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(aggregate: Aggregate? = nil) {
        self.init(unsafeResultMap: ["__typename": "videos_aggregate", "aggregate": aggregate.flatMap { (value: Aggregate) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var aggregate: Aggregate? {
        get {
          return (resultMap["aggregate"] as? ResultMap).flatMap { Aggregate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "aggregate")
        }
      }

      public struct Aggregate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["videos_aggregate_fields"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int) {
          self.init(unsafeResultMap: ["__typename": "videos_aggregate_fields", "count": count])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var count: Int {
          get {
            return resultMap["count"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }
      }
    }
  }
}

public final class GetVideosForSearchTextAndLanguageCodeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetVideosForSearchTextAndLanguageCode($searchText: String!, $languageCode: String!, $limit: Int!, $offset: Int!) {
      videos(
        where: {_or: [{channel: {channel_name: {_ilike: $searchText}}}, {title: {_ilike: $searchText}}], language_code: {_eq: $languageCode}}
        limit: $limit
        offset: $offset
      ) {
        __typename
        video_id
        video_type
        title
        channel {
          __typename
          channel_id
          channel_name
        }
        date_published
        speaker {
          __typename
          speaker_name
        }
        gcp_thumbnail_bucket_name
        gcp_thumbnail_file_name
      }
      videos_aggregate(
        where: {_or: [{channel: {channel_name: {_ilike: $searchText}}}, {title: {_ilike: $searchText}}], language_code: {_eq: $languageCode}}
      ) {
        __typename
        aggregate {
          __typename
          count
        }
      }
    }
    """

  public let operationName: String = "GetVideosForSearchTextAndLanguageCode"

  public var searchText: String
  public var languageCode: String
  public var limit: Int
  public var offset: Int

  public init(searchText: String, languageCode: String, limit: Int, offset: Int) {
    self.searchText = searchText
    self.languageCode = languageCode
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["searchText": searchText, "languageCode": languageCode, "limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("videos", arguments: ["where": ["_or": [["channel": ["channel_name": ["_ilike": GraphQLVariable("searchText")]]], ["title": ["_ilike": GraphQLVariable("searchText")]]], "language_code": ["_eq": GraphQLVariable("languageCode")]], "limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .nonNull(.list(.nonNull(.object(Video.selections))))),
        GraphQLField("videos_aggregate", arguments: ["where": ["_or": [["channel": ["channel_name": ["_ilike": GraphQLVariable("searchText")]]], ["title": ["_ilike": GraphQLVariable("searchText")]]], "language_code": ["_eq": GraphQLVariable("languageCode")]]], type: .nonNull(.object(VideosAggregate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(videos: [Video], videosAggregate: VideosAggregate) {
      self.init(unsafeResultMap: ["__typename": "query_root", "videos": videos.map { (value: Video) -> ResultMap in value.resultMap }, "videos_aggregate": videosAggregate.resultMap])
    }

    /// An array relationship
    public var videos: [Video] {
      get {
        return (resultMap["videos"] as! [ResultMap]).map { (value: ResultMap) -> Video in Video(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Video) -> ResultMap in value.resultMap }, forKey: "videos")
      }
    }

    /// An aggregate relationship
    public var videosAggregate: VideosAggregate {
      get {
        return VideosAggregate(unsafeResultMap: resultMap["videos_aggregate"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "videos_aggregate")
      }
    }

    public struct Video: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["videos"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("video_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("video_type", type: .nonNull(.scalar(video_types_enum.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel", type: .nonNull(.object(Channel.selections))),
          GraphQLField("date_published", type: .nonNull(.scalar(String.self))),
          GraphQLField("speaker", type: .nonNull(.object(Speaker.selections))),
          GraphQLField("gcp_thumbnail_bucket_name", type: .nonNull(.scalar(String.self))),
          GraphQLField("gcp_thumbnail_file_name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(videoId: String, videoType: video_types_enum, title: String, channel: Channel, datePublished: String, speaker: Speaker, gcpThumbnailBucketName: String, gcpThumbnailFileName: String) {
        self.init(unsafeResultMap: ["__typename": "videos", "video_id": videoId, "video_type": videoType, "title": title, "channel": channel.resultMap, "date_published": datePublished, "speaker": speaker.resultMap, "gcp_thumbnail_bucket_name": gcpThumbnailBucketName, "gcp_thumbnail_file_name": gcpThumbnailFileName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoId: String {
        get {
          return resultMap["video_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "video_id")
        }
      }

      public var videoType: video_types_enum {
        get {
          return resultMap["video_type"]! as! video_types_enum
        }
        set {
          resultMap.updateValue(newValue, forKey: "video_type")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An object relationship
      public var channel: Channel {
        get {
          return Channel(unsafeResultMap: resultMap["channel"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "channel")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["date_published"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date_published")
        }
      }

      /// An object relationship
      public var speaker: Speaker {
        get {
          return Speaker(unsafeResultMap: resultMap["speaker"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "speaker")
        }
      }

      /// Name of GCP bucket where video is stored
      public var gcpThumbnailBucketName: String {
        get {
          return resultMap["gcp_thumbnail_bucket_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_bucket_name")
        }
      }

      /// The relative file path including the file extension to the thumbnail (without bucket name)
      public var gcpThumbnailFileName: String {
        get {
          return resultMap["gcp_thumbnail_file_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_file_name")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["channels"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(channelId: String, channelName: String) {
          self.init(unsafeResultMap: ["__typename": "channels", "channel_id": channelId, "channel_name": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var channelId: String {
          get {
            return resultMap["channel_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channel_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_name")
          }
        }
      }

      public struct Speaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["speakers"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("speaker_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speakerName: String) {
          self.init(unsafeResultMap: ["__typename": "speakers", "speaker_name": speakerName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// If a single person, it should be in the following format: <title> <full name>. If multiple people, each person should be mentioned in the same format with an appropriate comma or ampersand between them. If it is a group, then just the group's name is enough.
        public var speakerName: String {
          get {
            return resultMap["speaker_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "speaker_name")
          }
        }
      }
    }

    public struct VideosAggregate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["videos_aggregate"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("aggregate", type: .object(Aggregate.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(aggregate: Aggregate? = nil) {
        self.init(unsafeResultMap: ["__typename": "videos_aggregate", "aggregate": aggregate.flatMap { (value: Aggregate) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var aggregate: Aggregate? {
        get {
          return (resultMap["aggregate"] as? ResultMap).flatMap { Aggregate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "aggregate")
        }
      }

      public struct Aggregate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["videos_aggregate_fields"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int) {
          self.init(unsafeResultMap: ["__typename": "videos_aggregate_fields", "count": count])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var count: Int {
          get {
            return resultMap["count"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }
      }
    }
  }
}

public final class GetVideosForSearchTextVideoTypeAndLanguageCodeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetVideosForSearchTextVideoTypeAndLanguageCode($searchText: String!, $videoType: video_types_enum!, $languageCode: String!, $limit: Int!, $offset: Int!) {
      videos(
        where: {_or: [{channel: {channel_name: {_ilike: $searchText}}}, {title: {_ilike: $searchText}}], video_type: {_eq: $videoType}, language_code: {_eq: $languageCode}}
        limit: $limit
        offset: $offset
      ) {
        __typename
        video_id
        video_type
        title
        channel {
          __typename
          channel_id
          channel_name
        }
        date_published
        speaker {
          __typename
          speaker_name
        }
        gcp_thumbnail_bucket_name
        gcp_thumbnail_file_name
      }
      videos_aggregate(
        where: {_or: [{channel: {channel_name: {_ilike: $searchText}}}, {title: {_ilike: $searchText}}], video_type: {_eq: $videoType}, language_code: {_eq: $languageCode}}
      ) {
        __typename
        aggregate {
          __typename
          count
        }
      }
    }
    """

  public let operationName: String = "GetVideosForSearchTextVideoTypeAndLanguageCode"

  public var searchText: String
  public var videoType: video_types_enum
  public var languageCode: String
  public var limit: Int
  public var offset: Int

  public init(searchText: String, videoType: video_types_enum, languageCode: String, limit: Int, offset: Int) {
    self.searchText = searchText
    self.videoType = videoType
    self.languageCode = languageCode
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["searchText": searchText, "videoType": videoType, "languageCode": languageCode, "limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("videos", arguments: ["where": ["_or": [["channel": ["channel_name": ["_ilike": GraphQLVariable("searchText")]]], ["title": ["_ilike": GraphQLVariable("searchText")]]], "video_type": ["_eq": GraphQLVariable("videoType")], "language_code": ["_eq": GraphQLVariable("languageCode")]], "limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .nonNull(.list(.nonNull(.object(Video.selections))))),
        GraphQLField("videos_aggregate", arguments: ["where": ["_or": [["channel": ["channel_name": ["_ilike": GraphQLVariable("searchText")]]], ["title": ["_ilike": GraphQLVariable("searchText")]]], "video_type": ["_eq": GraphQLVariable("videoType")], "language_code": ["_eq": GraphQLVariable("languageCode")]]], type: .nonNull(.object(VideosAggregate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(videos: [Video], videosAggregate: VideosAggregate) {
      self.init(unsafeResultMap: ["__typename": "query_root", "videos": videos.map { (value: Video) -> ResultMap in value.resultMap }, "videos_aggregate": videosAggregate.resultMap])
    }

    /// An array relationship
    public var videos: [Video] {
      get {
        return (resultMap["videos"] as! [ResultMap]).map { (value: ResultMap) -> Video in Video(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Video) -> ResultMap in value.resultMap }, forKey: "videos")
      }
    }

    /// An aggregate relationship
    public var videosAggregate: VideosAggregate {
      get {
        return VideosAggregate(unsafeResultMap: resultMap["videos_aggregate"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "videos_aggregate")
      }
    }

    public struct Video: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["videos"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("video_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("video_type", type: .nonNull(.scalar(video_types_enum.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel", type: .nonNull(.object(Channel.selections))),
          GraphQLField("date_published", type: .nonNull(.scalar(String.self))),
          GraphQLField("speaker", type: .nonNull(.object(Speaker.selections))),
          GraphQLField("gcp_thumbnail_bucket_name", type: .nonNull(.scalar(String.self))),
          GraphQLField("gcp_thumbnail_file_name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(videoId: String, videoType: video_types_enum, title: String, channel: Channel, datePublished: String, speaker: Speaker, gcpThumbnailBucketName: String, gcpThumbnailFileName: String) {
        self.init(unsafeResultMap: ["__typename": "videos", "video_id": videoId, "video_type": videoType, "title": title, "channel": channel.resultMap, "date_published": datePublished, "speaker": speaker.resultMap, "gcp_thumbnail_bucket_name": gcpThumbnailBucketName, "gcp_thumbnail_file_name": gcpThumbnailFileName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoId: String {
        get {
          return resultMap["video_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "video_id")
        }
      }

      public var videoType: video_types_enum {
        get {
          return resultMap["video_type"]! as! video_types_enum
        }
        set {
          resultMap.updateValue(newValue, forKey: "video_type")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An object relationship
      public var channel: Channel {
        get {
          return Channel(unsafeResultMap: resultMap["channel"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "channel")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["date_published"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date_published")
        }
      }

      /// An object relationship
      public var speaker: Speaker {
        get {
          return Speaker(unsafeResultMap: resultMap["speaker"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "speaker")
        }
      }

      /// Name of GCP bucket where video is stored
      public var gcpThumbnailBucketName: String {
        get {
          return resultMap["gcp_thumbnail_bucket_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_bucket_name")
        }
      }

      /// The relative file path including the file extension to the thumbnail (without bucket name)
      public var gcpThumbnailFileName: String {
        get {
          return resultMap["gcp_thumbnail_file_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gcp_thumbnail_file_name")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["channels"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(channelId: String, channelName: String) {
          self.init(unsafeResultMap: ["__typename": "channels", "channel_id": channelId, "channel_name": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var channelId: String {
          get {
            return resultMap["channel_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channel_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channel_name")
          }
        }
      }

      public struct Speaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["speakers"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("speaker_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speakerName: String) {
          self.init(unsafeResultMap: ["__typename": "speakers", "speaker_name": speakerName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// If a single person, it should be in the following format: <title> <full name>. If multiple people, each person should be mentioned in the same format with an appropriate comma or ampersand between them. If it is a group, then just the group's name is enough.
        public var speakerName: String {
          get {
            return resultMap["speaker_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "speaker_name")
          }
        }
      }
    }

    public struct VideosAggregate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["videos_aggregate"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("aggregate", type: .object(Aggregate.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(aggregate: Aggregate? = nil) {
        self.init(unsafeResultMap: ["__typename": "videos_aggregate", "aggregate": aggregate.flatMap { (value: Aggregate) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var aggregate: Aggregate? {
        get {
          return (resultMap["aggregate"] as? ResultMap).flatMap { Aggregate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "aggregate")
        }
      }

      public struct Aggregate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["videos_aggregate_fields"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int) {
          self.init(unsafeResultMap: ["__typename": "videos_aggregate_fields", "count": count])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var count: Int {
          get {
            return resultMap["count"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }
      }
    }
  }
}

public final class GetChannelDetailQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetChannelDetail($channelId: uuid!) {
      channels(where: {channel_id: {_eq: $channelId}}) {
        __typename
        channel_id
        channel_name
        channel_type
        location_lat
        location_long
        region_code
        videosInChannel: videos {
          __typename
          video_id
          title
          video_type
          speaker {
            __typename
            speaker_id
            speaker_name
          }
          language {
            __typename
            language_code
            source_country_flag
          }
          gcp_thumbnail_bucket_name
          gcp_thumbnail_file_name
          description
          date_published
        }
        website_url
      }
    }
    """

  public let operationName: String = "GetChannelDetail"

  public var channelId: String

  public init(channelId: String) {
    self.channelId = channelId
  }

  public var variables: GraphQLMap? {
    return ["channelId": channelId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("channels", arguments: ["where": ["channel_id": ["_eq": GraphQLVariable("channelId")]]], type: .nonNull(.list(.nonNull(.object(Channel.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(channels: [Channel]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "channels": channels.map { (value: Channel) -> ResultMap in value.resultMap }])
    }

    /// An array relationship
    public var channels: [Channel] {
      get {
        return (resultMap["channels"] as! [ResultMap]).map { (value: ResultMap) -> Channel in Channel(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Channel) -> ResultMap in value.resultMap }, forKey: "channels")
      }
    }

    public struct Channel: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["channels"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel_name", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel_type", type: .nonNull(.scalar(channel_types_enum.self))),
          GraphQLField("location_lat", type: .nonNull(.scalar(String.self))),
          GraphQLField("location_long", type: .nonNull(.scalar(String.self))),
          GraphQLField("region_code", type: .nonNull(.scalar(String.self))),
          GraphQLField("videos", alias: "videosInChannel", type: .nonNull(.list(.nonNull(.object(VideosInChannel.selections))))),
          GraphQLField("website_url", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(channelId: String, channelName: String, channelType: channel_types_enum, locationLat: String, locationLong: String, regionCode: String, videosInChannel: [VideosInChannel], websiteUrl: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "channels", "channel_id": channelId, "channel_name": channelName, "channel_type": channelType, "location_lat": locationLat, "location_long": locationLong, "region_code": regionCode, "videosInChannel": videosInChannel.map { (value: VideosInChannel) -> ResultMap in value.resultMap }, "website_url": websiteUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var channelId: String {
        get {
          return resultMap["channel_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "channel_id")
        }
      }

      public var channelName: String {
        get {
          return resultMap["channel_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "channel_name")
        }
      }

      public var channelType: channel_types_enum {
        get {
          return resultMap["channel_type"]! as! channel_types_enum
        }
        set {
          resultMap.updateValue(newValue, forKey: "channel_type")
        }
      }

      public var locationLat: String {
        get {
          return resultMap["location_lat"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "location_lat")
        }
      }

      public var locationLong: String {
        get {
          return resultMap["location_long"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "location_long")
        }
      }

      public var regionCode: String {
        get {
          return resultMap["region_code"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "region_code")
        }
      }

      /// An array relationship
      public var videosInChannel: [VideosInChannel] {
        get {
          return (resultMap["videosInChannel"] as! [ResultMap]).map { (value: ResultMap) -> VideosInChannel in VideosInChannel(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: VideosInChannel) -> ResultMap in value.resultMap }, forKey: "videosInChannel")
        }
      }

      public var websiteUrl: String? {
        get {
          return resultMap["website_url"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "website_url")
        }
      }

      public struct VideosInChannel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["videos"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("video_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("video_type", type: .nonNull(.scalar(video_types_enum.self))),
            GraphQLField("speaker", type: .nonNull(.object(Speaker.selections))),
            GraphQLField("language", type: .nonNull(.object(Language.selections))),
            GraphQLField("gcp_thumbnail_bucket_name", type: .nonNull(.scalar(String.self))),
            GraphQLField("gcp_thumbnail_file_name", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("date_published", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(videoId: String, title: String, videoType: video_types_enum, speaker: Speaker, language: Language, gcpThumbnailBucketName: String, gcpThumbnailFileName: String, description: String, datePublished: String) {
          self.init(unsafeResultMap: ["__typename": "videos", "video_id": videoId, "title": title, "video_type": videoType, "speaker": speaker.resultMap, "language": language.resultMap, "gcp_thumbnail_bucket_name": gcpThumbnailBucketName, "gcp_thumbnail_file_name": gcpThumbnailFileName, "description": description, "date_published": datePublished])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var videoId: String {
          get {
            return resultMap["video_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "video_id")
          }
        }

        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var videoType: video_types_enum {
          get {
            return resultMap["video_type"]! as! video_types_enum
          }
          set {
            resultMap.updateValue(newValue, forKey: "video_type")
          }
        }

        /// An object relationship
        public var speaker: Speaker {
          get {
            return Speaker(unsafeResultMap: resultMap["speaker"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "speaker")
          }
        }

        /// An object relationship
        public var language: Language {
          get {
            return Language(unsafeResultMap: resultMap["language"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "language")
          }
        }

        /// Name of GCP bucket where video is stored
        public var gcpThumbnailBucketName: String {
          get {
            return resultMap["gcp_thumbnail_bucket_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "gcp_thumbnail_bucket_name")
          }
        }

        /// The relative file path including the file extension to the thumbnail (without bucket name)
        public var gcpThumbnailFileName: String {
          get {
            return resultMap["gcp_thumbnail_file_name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "gcp_thumbnail_file_name")
          }
        }

        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        public var datePublished: String {
          get {
            return resultMap["date_published"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "date_published")
          }
        }

        public struct Speaker: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["speakers"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("speaker_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("speaker_name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(speakerId: String, speakerName: String) {
            self.init(unsafeResultMap: ["__typename": "speakers", "speaker_id": speakerId, "speaker_name": speakerName])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var speakerId: String {
            get {
              return resultMap["speaker_id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "speaker_id")
            }
          }

          /// If a single person, it should be in the following format: <title> <full name>. If multiple people, each person should be mentioned in the same format with an appropriate comma or ampersand between them. If it is a group, then just the group's name is enough.
          public var speakerName: String {
            get {
              return resultMap["speaker_name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "speaker_name")
            }
          }
        }

        public struct Language: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["languages"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("language_code", type: .nonNull(.scalar(String.self))),
              GraphQLField("source_country_flag", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(languageCode: String, sourceCountryFlag: String) {
            self.init(unsafeResultMap: ["__typename": "languages", "language_code": languageCode, "source_country_flag": sourceCountryFlag])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var languageCode: String {
            get {
              return resultMap["language_code"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "language_code")
            }
          }

          public var sourceCountryFlag: String {
            get {
              return resultMap["source_country_flag"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "source_country_flag")
            }
          }
        }
      }
    }
  }
}

public final class GetAllLanguagesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllLanguages {
      languages {
        __typename
        language_code
        source_country_flag
      }
    }
    """

  public let operationName: String = "GetAllLanguages"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("languages", type: .nonNull(.list(.nonNull(.object(Language.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(languages: [Language]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "languages": languages.map { (value: Language) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "languages"
    public var languages: [Language] {
      get {
        return (resultMap["languages"] as! [ResultMap]).map { (value: ResultMap) -> Language in Language(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Language) -> ResultMap in value.resultMap }, forKey: "languages")
      }
    }

    public struct Language: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["languages"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("language_code", type: .nonNull(.scalar(String.self))),
          GraphQLField("source_country_flag", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(languageCode: String, sourceCountryFlag: String) {
        self.init(unsafeResultMap: ["__typename": "languages", "language_code": languageCode, "source_country_flag": sourceCountryFlag])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var languageCode: String {
        get {
          return resultMap["language_code"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "language_code")
        }
      }

      public var sourceCountryFlag: String {
        get {
          return resultMap["source_country_flag"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "source_country_flag")
        }
      }
    }
  }
}

public final class GetUserDataQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetUserData($userUuid: String!) {
      users_by_pk(user_uuid: $userUuid) {
        __typename
        user_uuid
        user_email
      }
    }
    """

  public let operationName: String = "GetUserData"

  public var userUuid: String

  public init(userUuid: String) {
    self.userUuid = userUuid
  }

  public var variables: GraphQLMap? {
    return ["userUuid": userUuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("users_by_pk", arguments: ["user_uuid": GraphQLVariable("userUuid")], type: .object(UsersByPk.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(usersByPk: UsersByPk? = nil) {
      self.init(unsafeResultMap: ["__typename": "query_root", "users_by_pk": usersByPk.flatMap { (value: UsersByPk) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "users" using primary key columns
    public var usersByPk: UsersByPk? {
      get {
        return (resultMap["users_by_pk"] as? ResultMap).flatMap { UsersByPk(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "users_by_pk")
      }
    }

    public struct UsersByPk: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["users"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_uuid", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_email", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userUuid: String, userEmail: String) {
        self.init(unsafeResultMap: ["__typename": "users", "user_uuid": userUuid, "user_email": userEmail])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userUuid: String {
        get {
          return resultMap["user_uuid"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_uuid")
        }
      }

      public var userEmail: String {
        get {
          return resultMap["user_email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_email")
        }
      }
    }
  }
}
