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

public final class GetDataForHomeScreenQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetDataForHomeScreen($uuid: String!) {
      continueWatching: continue_watching(where: {user_uuid: {_eq: $uuid}}) {
        __typename
        resume_time
        video {
          __typename
          video_id
          channel {
            __typename
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
          channel_name
        }
        date_published
        title
        views
      }
    }
    """

  public let operationName: String = "GetDataForHomeScreen"

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
