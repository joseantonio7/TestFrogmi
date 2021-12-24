//
//  Agent.swift
//  TestFrogmi
//
//  Created by José Antonio Aravena on 23-12-21.
//

import Combine
import NetworkExtension

struct Agent {

    struct Response<T> {
        let value: T
        let response: URLResponse
    }

    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                print(result.data.description)
                let value = try decoder.decode(T.self, from: result.data)
                print(value)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
