//
//  GraphQLErrorTransformer.swift
//  SDO
//
//  Created by Joel Kingsley on 31/08/2022.
//

import Foundation
import Apollo

enum GraphQLErrorTransformer {
    static func transform(graphQLError: GraphQLError) -> ApiError {
        do {
            guard let graphQLErrorExtension = graphQLError.extensions else {
                return ApiErrors.serverError()
            }
            let jsonData = try JSONSerialization.data(withJSONObject: graphQLErrorExtension, options: [])
            let hasuraError = try JSONDecoder().decode(HasuraGraphQLErrorResponseDTO.self, from: jsonData)
            guard let errorInternal = hasuraError.errorInternal,
                  let errorResponse = errorInternal.response,
                  let errorBody = errorResponse.body,
                  let error = errorBody.error,
                  let code = error.code
            else {
                return ApiErrors.serverError()
            }
            return ApiErrors.customError(code: code)
        } catch {
            return ApiErrors.serverError()
        }
    }
    
    static func transform(apiError: ApiError) -> BusinessError {
        if apiError is ApiErrors.serverError {
            return BusinessErrors.serverError()
        } else if apiError is ApiErrors.parsingError {
            return BusinessErrors.parsingError()
        } else if apiError is ApiErrors.clientError {
            return BusinessErrors.clientError()
        } else if apiError is ApiErrors.noContent {
            return BusinessErrors.noContent()
        } else if let customError = apiError as? ApiErrors.customError {
            return BusinessErrors.customError(code: customError.code)
        } else {
            return BusinessErrors.unknownError()
        }
    }
}
