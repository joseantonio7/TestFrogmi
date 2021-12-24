//
//  FrogmiStoreService.swift
//  TestFrogmi
//
//  Created by José Antonio Aravena on 23-12-21.
//

import Foundation
import Combine


struct FrogmiStoreService: StoreService {
    func fetchStores(_ string:String) -> AnyPublisher<MyDataList, Error> {
        return FrogmiApi.download(string)
    }
}
