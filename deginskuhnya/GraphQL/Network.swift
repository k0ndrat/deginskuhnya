//
//  Network.swift
//  deginskuhnya
//
//  Created by Vladislav Condratiev on 14.08.2021.
//
import Apollo
import Starscream
import UIKit

var secretToken = "478NXSdQJOvyQO1ZNvUTPiXQFPCgHsMqIYY4IOF27a6cI7J41wN473Ufkon4bUKN"
var graphQlUrl = "https://randomfood.hasura.app/v1/graphql/"

class Network {
    static let shared = Network()

    private(set) lazy var apollo: ApolloClient = {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)

        let client = URLSessionClient()
        let provider = NetworkInterceptorProvider(store: store, client: client)
        let url = URL(string: graphQlUrl)!

        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url)
        return ApolloClient(networkTransport: requestChainTransport,
                            store: store)
    }()
}

// MARK: - NetworkInterceptorProvider

struct NetworkInterceptorProvider: InterceptorProvider {
    private let store: ApolloStore
    private let client: URLSessionClient

    init(store: ApolloStore, client: URLSessionClient) {
        self.store = store
        self.client = client
    }

    func interceptors<Operation: GraphQLOperation>(for _: Operation) -> [ApolloInterceptor] {
        let iteractors: [ApolloInterceptor] = [MaxRetryInterceptor(),
                                               RequestLoggingInterceptor(),
                                               UserManagementInterceptor(),
                                               NetworkFetchInterceptor(client: client),
                                               ResponseLoggingInterceptor(),
                                               ResponseCodeInterceptor(),
                                               AutomaticPersistedQueryInterceptor(),
                                               ]

        return iteractors
    }
}

// MARK: - ResponseLoggingInterceptor

class ResponseLoggingInterceptor: ApolloInterceptor {
    enum ResponseLoggingError: Error {
        case notYetReceived
    }

    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        defer {
            chain.proceedAsync(request: request,
                               response: response,
                               completion: completion)
        }

        guard let receivedResponse = response else {
            chain.handleErrorAsync(ResponseLoggingError.notYetReceived,
                                   request: request,
                                   response: response,
                                   completion: completion)
            return
        }

        print("HTTP Response: \(receivedResponse.httpResponse)")

        if let stringData = String(bytes: receivedResponse.rawData, encoding: .utf8) {
            print("Data: \(stringData)")
        } else {
            print("Could not convert data to string!")
        }
    }
}

// MARK: - RequestLoggingInterceptor

class RequestLoggingInterceptor: ApolloInterceptor {
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        print("Outgoing request: \(request)")
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}

// MARK: - UserManagementInterceptor

class UserManagementInterceptor: ApolloInterceptor {
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        
        request.addHeader(name: "x-hasura-admin-secret", value: "Bearer \(secretToken)")
        

        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}
