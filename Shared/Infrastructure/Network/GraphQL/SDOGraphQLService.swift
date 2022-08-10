//
//  SDOGraphQLService.swift
//  SDO
//
//  Created by Joel Kingsley on 11/08/2022.
//

import Foundation
import Apollo

/**
 Used to perform GraphQL operations in the app
 */
protocol SDOGraphQLService {
    /// Executes a GraphQL query and returns a data response or throws an error
    func executeQuery<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy,
        contextIdentifier: UUID?,
        queue: DispatchQueue
    ) async throws -> Query.Data
    
    /// Executes a GraphQL mutation and returns a data response or throws an error
    func executeMutation<Mutation: GraphQLMutation>(
        mutation: Mutation,
        publishResultToStore: Bool,
        queue: DispatchQueue
    ) async throws -> Mutation.Data
}
