//
//  FrogmiState.swift
//  TestFrogmi
//
//  Created by José Antonio Aravena on 23-12-21.
//

import Foundation

struct BaseState: Codable, Identifiable {
    var id: Int
    var store: Store
}

enum StoreInput {
    case response(Int)
}
