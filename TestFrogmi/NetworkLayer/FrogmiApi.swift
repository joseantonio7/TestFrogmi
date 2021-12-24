//
//  FrogmiApi.swift
//  TestFrogmi
//
//  Created by José Antonio Aravena on 23-12-21.
//

import Combine
import Foundation

enum FrogmiApi {
    static let agent = Agent()
    static let base = URL(string: Constants.baseURL)!
}

extension FrogmiApi {

    static func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, Error> {
        return agent.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}

extension FrogmiApi {
    static func download(_ string: String) -> AnyPublisher<MyDataList, Error> {
        var request:URLRequest
        if(string==""){
            request = URLRequest(url: base.appendingPathComponent("test2"))
        } else {
            request = URLRequest(url: URL(string: string)!)
        }
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["Authorization": Constants.auth,
                                       "X-Company-UUID": Constants.company,
                                       "Content-Type": Constants.content]
        return run(request)
    }
}
