//
//  BusinessError.swift
//  SDO
//
//  Created by Joel Kingsley on 03/07/2022.
//

import Foundation

typealias BusinessError = Error

enum BusinessErrors: BusinessError {
    // Generic Errors
    struct serverError: BusinessError {}
    struct clientError: BusinessError {}
    
    // Google Sign In Errors
    struct emptyWordList: BusinessError {}
}

extension BusinessErrors.serverError: LocalizedError {
    var errorDescription: String? {
        return "Server error"
    }
}

extension BusinessErrors.clientError: LocalizedError {
    var errorDescription: String? {
        return "Client error"
    }
}

extension BusinessErrors.emptyWordList: LocalizedError {
    var errorDescription: String? {
        return "Empty word list in file"
    }
}
