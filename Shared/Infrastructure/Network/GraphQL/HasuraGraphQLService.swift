//
//  HasuraGraphQLService.swift
//  SDO
//
//  Created by Joel Kingsley on 10/08/2022.
//

import Foundation
import Apollo

/**
 Used to perform GraphQL operations with Hasura
 */
class HasuraGraphQLService {
    private let apolloClient: ApolloClient?
    private let graphQLUrl: URL! = URL(string: "https://sdo-hasura.hasura.app/v1/graphql")
    
    init() {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let sessionConfiguration = URLSessionConfiguration.default
        let urlSessionClient = URLSessionClient(
            sessionConfiguration: sessionConfiguration,
            callbackQueue: nil
        )
        let interceptorProvider = GraphQLInterceptorProvider(
            client: urlSessionClient,
            shouldInvalidateClientOnDeinit: true,
            store: store
        )
        let requestChainTransport = RequestChainNetworkTransport(
            interceptorProvider: interceptorProvider,
            endpointURL: graphQLUrl
        )
        apolloClient = ApolloClient(networkTransport: requestChainTransport, store: store)
    }
}

// MARK: - SDOGraphQLService

extension HasuraGraphQLService: SDOGraphQLService {
    func executeQuery<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy = .fetchIgnoringCacheCompletely,
        contextIdentifier: UUID? = nil,
        queue: DispatchQueue = .global()
    ) async throws -> Query.Data {
        return try await withCheckedThrowingContinuation({ continuation in
            apolloClient?.fetch(
                query: query,
                cachePolicy: cachePolicy,
                contextIdentifier: contextIdentifier,
                queue: queue
            ) { result in
                switch result {
                case let .success(graphQLResult):
                    if let errors = graphQLResult.errors {
                        AppLogger.error(String(describing: errors))
                        DispatchQueue.main.async {
                            continuation.resume(throwing: BusinessErrors.serverError())
                        }
                    } else if let data = graphQLResult.data {
                        DispatchQueue.main.async {
                            continuation.resume(returning: data)
                        }
                    } else {
                        DispatchQueue.main.async {
                            continuation.resume(throwing: BusinessErrors.noContent())
                        }
                    }
                case let .failure(error):
                    AppLogger.error(String(describing: error))
                    DispatchQueue.main.async {
                        continuation.resume(throwing: BusinessErrors.serverError())
                    }
                }
            }
        })
    }
    
    func executeMutation<Mutation: GraphQLMutation>(
        mutation: Mutation,
        publishResultToStore: Bool = true,
        queue: DispatchQueue = .global()
    ) async throws -> Mutation.Data {
        return try await withCheckedThrowingContinuation({ continuation in
            apolloClient?.perform(
                mutation: mutation,
                publishResultToStore: publishResultToStore,
                queue: queue
            ) { result in
                switch result {
                case let .success(graphQLResult):
                    if let errors = graphQLResult.errors {
                        AppLogger.error(String(describing: errors))
                        DispatchQueue.main.async {
                            continuation.resume(throwing: BusinessErrors.serverError())
                        }
                    } else if let data = graphQLResult.data {
                        DispatchQueue.main.async {
                            continuation.resume(returning: data)
                        }
                    } else {
                        DispatchQueue.main.async {
                            continuation.resume(throwing: BusinessErrors.noContent())
                        }
                    }
                case let .failure(error):
                    AppLogger.error(String(describing: error))
                    DispatchQueue.main.async {
                        continuation.resume(throwing: BusinessErrors.serverError())
                    }
                }
            }
        })
    }
}

// MARK: - GraphQLInterceptorProvider

/**
 Provides custom graphQL interceptors
 */
class GraphQLInterceptorProvider: DefaultInterceptorProvider {
    override func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(AuthGraphQLInterceptor(), at: 0)
        return interceptors
    }
}

// MARK: - Custom Interceptors

/**
 Interceptor for performing authentication related operations to the GraphQL request and response
 */
class AuthGraphQLInterceptor: ApolloInterceptor {
    func interceptAsync<Operation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) where Operation : GraphQLOperation {
        let accessToken = UserSession.accessToken ?? ""
        request.addHeader(name: "Authorization", value: "Bearer \(accessToken)")
        AppLogger.debug("Request : \(request)")
        AppLogger.debug("Response : \(String(describing: response?.httpResponse))")
        chain.proceedAsync(request: request, response: response, completion: completion)
    }
}
