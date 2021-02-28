//
//  NetworkClient.swift
//  HappyCoin
//
//  Created by Stefano on 24.02.21.
//

import Combine
import Foundation

protocol CoinFetchable {
    func coins() -> AnyPublisher<Void, Error>
    func coins(forIds ids: [Int]) -> AnyPublisher<Void, Error>
}

protocol NetworkClient {
    func request<T>(
        with components: URLComponents
    ) -> AnyPublisher<T, CoinError> where T: Decodable
}

extension NetworkClient {
    
    func request<T>(
        with components: URLComponents
    ) -> AnyPublisher<T, CoinError> where T: Decodable {
        
        guard let url = components.url else {
            let error = CoinError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: URLRequest(url: url))
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { CoinError.network(description: $0.localizedDescription) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

final class NetworkClientImpl: NetworkClient { }
