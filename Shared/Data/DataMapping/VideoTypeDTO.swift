//
//  VideoTypeDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 19/02/2023.
//

import Foundation

enum VideoTypeDTO: String {
    case sermon
    case documentary
    case short
    case music
    
    init(rawValue: String) throws {
        switch rawValue {
        case "sermon":
            self = .sermon
        case "documentary":
            self = .documentary
        case "short":
            self = .short
        case "music":
            self = .music
        default:
            AppLogger.error("Unexpectedly got invalid option for VideoTypeDTO: \(rawValue)")
            throw BusinessErrors.parsingError()
        }
    }
    
    init(videoType: VideoType) {
        switch videoType {
        case .sermon:
            self = .sermon
        case .documentary:
            self = .documentary
        case .short:
            self = .short
        case .music:
            self = .music
        }
    }
}
