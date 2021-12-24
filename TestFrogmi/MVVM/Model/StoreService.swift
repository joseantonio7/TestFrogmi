//
//  StoreService.swift
//  TestFrogmi
//
//  Created by José Antonio Aravena on 23-12-21.
//

import Combine

protocol StoreService {
    func fetchStores(_ string:String ) -> AnyPublisher<MyDataList, Error>
}
