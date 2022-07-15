//
//  AppLogger.swift
//  SDO
//
//  Created by Joel Kingsley on 03/07/2022.
//

import Foundation

struct AppLogger {
    static func debug(_ items: Any...) {
        log(level: "DEBUG", message: items)
    }
    
    static func error(_ items: String...) {
        log(level: "ERROR", message: items)
    }
    
    static func log(level: String, message: Any...) {
        print("\(level): ", message)
    }
}
