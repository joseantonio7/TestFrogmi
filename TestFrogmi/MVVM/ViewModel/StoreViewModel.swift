//
//  StoreViewModel.swift
//  TestFrogmi
//
//  Created by José Antonio Aravena on 23-12-21.
//

import Foundation
import Combine

class StoreViewModel: ViewModel {
    @Published
    private(set) var state: BaseState

    let storeService: StoreService
    var token: AnyCancellable!

    private let store: Store

    init(id:Int,store: Store, storeService: StoreService) {
        self.storeService = storeService
        self.store = store
        self.state = BaseState(id: id, store: store)
    }

    func next() {

    }

    func trigger(_ input: StoreInput) {
        switch input {
        case .response:
            break
        }
    }
}
