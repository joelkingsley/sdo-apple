//
//  ApiError.swift
//  SDO
//
//  Created by Joel Kingsley on 31/08/2022.
//

import Foundation

typealias ApiError = Error

enum ApiErrors: ApiError, Equatable {
    // Generic Errors
    struct serverError: ApiError {}
    struct clientError: ApiError {}
    struct noContent: ApiError {}
    struct parsingError: ApiError {}
    
    struct customError: ApiError {
        let code: String
    }
}

extension ApiErrors.serverError: LocalizedError {
    var errorDescription: String? {
        return "Server error"
    }
}

extension ApiErrors.clientError: LocalizedError {
    var errorDescription: String? {
        return "Client error"
    }
}

extension ApiErrors.noContent: LocalizedError {
    var errorDescription: String? {
        return "No Content"
    }
}

extension ApiErrors.parsingError: LocalizedError {
    var errorDescription: String? {
        return "Parsing Error"
    }
}

extension ApiErrors.customError: LocalizedError {
    var errorDescription: String? {
        return "Custom Error"
    }
}
