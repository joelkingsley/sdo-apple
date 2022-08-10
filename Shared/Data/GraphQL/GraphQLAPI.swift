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
        channel_type_name
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
          GraphQLField("channel_type_name", type: .nonNull(.scalar(channel_types_enum.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(channelId: String, channelName: String, channelTypeName: channel_types_enum) {
        self.init(unsafeResultMap: ["__typename": "channels", "channel_id": channelId, "channel_name": channelName, "channel_type_name": channelTypeName])
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

      public var channelTypeName: channel_types_enum {
        get {
          return resultMap["channel_type_name"]! as! channel_types_enum
        }
        set {
          resultMap.updateValue(newValue, forKey: "channel_type_name")
        }
      }
    }
  }
}
