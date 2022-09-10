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
        thumbnailUrl
        isVideoAccessibleToUser
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
          GraphQLField("thumbnailUrl", type: .nonNull(.scalar(String.self))),
          GraphQLField("isVideoAccessibleToUser", type: .nonNull(.scalar(Bool.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(videoUrl: String, thumbnailUrl: String, isVideoAccessibleToUser: Bool) {
        self.init(unsafeResultMap: ["__typename": "GetVideoUrlDataOutput", "videoUrl": videoUrl, "thumbnailUrl": thumbnailUrl, "isVideoAccessibleToUser": isVideoAccessibleToUser])
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

      public var thumbnailUrl: String {
        get {
          return resultMap["thumbnailUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "thumbnailUrl")
        }
      }

      public var isVideoAccessibleToUser: Bool {
        get {
          return resultMap["isVideoAccessibleToUser"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isVideoAccessibleToUser")
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
  }
}

public final class GetHomeScreenDataQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetHomeScreenData($uuid: String!) {
      continueWatching: continue_watching(where: {user_uuid: {_eq: $uuid}}) {
        __typename
        resume_time
        video {
          __typename
          video_id
          channel {
            __typename
            channel_id
            channel_name
          }
          date_published
          title
          views
        }
      }
      userList: user_list(where: {user_uuid: {_eq: $uuid}}) {
        __typename
        video {
          __typename
          video_id
          channel {
            __typename
            channel_id
            channel_name
          }
          date_published
          title
          views
        }
      }
      newReleases: videos(order_by: {date_published: desc}) {
        __typename
        video_id
        channel {
          __typename
          channel_id
          channel_name
        }
        date_published
        title
        views
      }
    }
    """

  public let operationName: String = "GetHomeScreenData"

  public var uuid: String

  public init(uuid: String) {
    self.uuid = uuid
  }

  public var variables: GraphQLMap? {
    return ["uuid": uuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("continue_watching", alias: "continueWatching", arguments: ["where": ["user_uuid": ["_eq": GraphQLVariable("uuid")]]], type: .nonNull(.list(.nonNull(.object(ContinueWatching.selections))))),
        GraphQLField("user_list", alias: "userList", arguments: ["where": ["user_uuid": ["_eq": GraphQLVariable("uuid")]]], type: .nonNull(.list(.nonNull(.object(UserList.selections))))),
        GraphQLField("videos", alias: "newReleases", arguments: ["order_by": ["date_published": "desc"]], type: .nonNull(.list(.nonNull(.object(NewRelease.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(continueWatching: [ContinueWatching], userList: [UserList], newReleases: [NewRelease]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "continueWatching": continueWatching.map { (value: ContinueWatching) -> ResultMap in value.resultMap }, "userList": userList.map { (value: UserList) -> ResultMap in value.resultMap }, "newReleases": newReleases.map { (value: NewRelease) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "continue_watching"
    public var continueWatching: [ContinueWatching] {
      get {
        return (resultMap["continueWatching"] as! [ResultMap]).map { (value: ResultMap) -> ContinueWatching in ContinueWatching(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: ContinueWatching) -> ResultMap in value.resultMap }, forKey: "continueWatching")
      }
    }

    /// fetch data from the table: "user_list"
    public var userList: [UserList] {
      get {
        return (resultMap["userList"] as! [ResultMap]).map { (value: ResultMap) -> UserList in UserList(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: UserList) -> ResultMap in value.resultMap }, forKey: "userList")
      }
    }

    /// An array relationship
    public var newReleases: [NewRelease] {
      get {
        return (resultMap["newReleases"] as! [ResultMap]).map { (value: ResultMap) -> NewRelease in NewRelease(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: NewRelease) -> ResultMap in value.resultMap }, forKey: "newReleases")
      }
    }

    public struct ContinueWatching: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["continue_watching"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("resume_time", type: .nonNull(.scalar(String.self))),
          GraphQLField("video", type: .nonNull(.object(Video.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(resumeTime: String, video: Video) {
        self.init(unsafeResultMap: ["__typename": "continue_watching", "resume_time": resumeTime, "video": video.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var resumeTime: String {
        get {
          return resultMap["resume_time"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "resume_time")
        }
      }

      /// An object relationship
      public var video: Video {
        get {
          return Video(unsafeResultMap: resultMap["video"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "video")
        }
      }

      public struct Video: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["videos"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("video_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel", type: .nonNull(.object(Channel.selections))),
            GraphQLField("date_published", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("views", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(videoId: String, channel: Channel, datePublished: String, title: String, views: Int) {
          self.init(unsafeResultMap: ["__typename": "videos", "video_id": videoId, "channel": channel.resultMap, "date_published": datePublished, "title": title, "views": views])
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

        public var views: Int {
          get {
            return resultMap["views"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "views")
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
      }
    }

    public struct UserList: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["user_list"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("video", type: .nonNull(.object(Video.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(video: Video) {
        self.init(unsafeResultMap: ["__typename": "user_list", "video": video.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// An object relationship
      public var video: Video {
        get {
          return Video(unsafeResultMap: resultMap["video"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "video")
        }
      }

      public struct Video: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["videos"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("video_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel", type: .nonNull(.object(Channel.selections))),
            GraphQLField("date_published", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("views", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(videoId: String, channel: Channel, datePublished: String, title: String, views: Int) {
          self.init(unsafeResultMap: ["__typename": "videos", "video_id": videoId, "channel": channel.resultMap, "date_published": datePublished, "title": title, "views": views])
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

        public var views: Int {
          get {
            return resultMap["views"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "views")
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
      }
    }

    public struct NewRelease: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["videos"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("video_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel", type: .nonNull(.object(Channel.selections))),
          GraphQLField("date_published", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("views", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(videoId: String, channel: Channel, datePublished: String, title: String, views: Int) {
        self.init(unsafeResultMap: ["__typename": "videos", "video_id": videoId, "channel": channel.resultMap, "date_published": datePublished, "title": title, "views": views])
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

      public var views: Int {
        get {
          return resultMap["views"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "views")
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
    }
  }
}

public final class GetVideoDetailDataQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetVideoDetailData($videoId: uuid!, $channelId: uuid!) {
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
      }
      relatedVideos: videos(where: {channel_id: {_eq: $channelId}}) {
        __typename
        video_id
        title
        channel {
          __typename
          channel_name
        }
        date_published
        views
      }
    }
    """

  public let operationName: String = "GetVideoDetailData"

  public var videoId: String
  public var channelId: String

  public init(videoId: String, channelId: String) {
    self.videoId = videoId
    self.channelId = channelId
  }

  public var variables: GraphQLMap? {
    return ["videoId": videoId, "channelId": channelId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("videos", alias: "videoDetail", arguments: ["where": ["video_id": ["_eq": GraphQLVariable("videoId")]]], type: .nonNull(.list(.nonNull(.object(VideoDetail.selections))))),
        GraphQLField("videos", alias: "relatedVideos", arguments: ["where": ["channel_id": ["_eq": GraphQLVariable("channelId")]]], type: .nonNull(.list(.nonNull(.object(RelatedVideo.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(videoDetail: [VideoDetail], relatedVideos: [RelatedVideo]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "videoDetail": videoDetail.map { (value: VideoDetail) -> ResultMap in value.resultMap }, "relatedVideos": relatedVideos.map { (value: RelatedVideo) -> ResultMap in value.resultMap }])
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
    public var relatedVideos: [RelatedVideo] {
      get {
        return (resultMap["relatedVideos"] as! [ResultMap]).map { (value: ResultMap) -> RelatedVideo in RelatedVideo(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: RelatedVideo) -> ResultMap in value.resultMap }, forKey: "relatedVideos")
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
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(videoId: String, title: String, videoType: video_types_enum, datePublished: String, description: String, speaker: Speaker, channel: Channel, language: Language) {
        self.init(unsafeResultMap: ["__typename": "videos", "video_id": videoId, "title": title, "video_type": videoType, "date_published": datePublished, "description": description, "speaker": speaker.resultMap, "channel": channel.resultMap, "language": language.resultMap])
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

    public struct RelatedVideo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["videos"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("video_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("channel", type: .nonNull(.object(Channel.selections))),
          GraphQLField("date_published", type: .nonNull(.scalar(String.self))),
          GraphQLField("views", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(videoId: String, title: String, channel: Channel, datePublished: String, views: Int) {
        self.init(unsafeResultMap: ["__typename": "videos", "video_id": videoId, "title": title, "channel": channel.resultMap, "date_published": datePublished, "views": views])
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

      public var views: Int {
        get {
          return resultMap["views"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "views")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["channels"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("channel_name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(channelName: String) {
          self.init(unsafeResultMap: ["__typename": "channels", "channel_name": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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
    }
  }
}
