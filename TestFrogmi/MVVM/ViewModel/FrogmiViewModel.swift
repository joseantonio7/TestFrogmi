//
//  FrogmiViewModel.swift
//  TestFrogmi
//
//  Created by José Antonio Aravena on 23-12-21.
//

import Foundation
import Combine
import SwiftUI

class FrogmiViewModel: ViewModel {
    
    @Published
    var state: FrogmiState
    var subscription = Set<AnyCancellable>()
    var storeService: StoreService
    init(storeService: StoreService) {

        self.storeService = storeService
        self.state = FrogmiState(myStores: [], next: "")
        helper("")
    }

    func trigger(_ input: Never) {
    }

    func next() {
        helper(self.state.next)
    }
    
    func helper(_ string: String){
        let myStores = self.storeService.fetchStores(string)
        let _: () = myStores.sink { _ in
            print("subscription ended")
        } receiveValue: { stores in
            if (self.state.myStores.isEmpty){
                let viewModels = stores.data.enumerated().map {
                    AnyViewModel(StoreViewModel(id: $0, store: $1.attributes, storeService: self.storeService))
                }
                self.state = FrogmiState(myStores: viewModels, next: stores.links.next )
            }else {
           
                let viewModels: [AnyViewModel<BaseState, StoreInput>] = self.state.myStores + stores.data.enumerated().map {
                    AnyViewModel(StoreViewModel(id: $0, store: $1.attributes, storeService: self.storeService))
                }
                self.state = FrogmiState(myStores: viewModels, next: stores.links.next )
            }
        }.store(in: &subscription)
    }
}
