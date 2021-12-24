//
//  Store.swift
//  TestFrogmi
//
//  Created by José Antonio Aravena on 23-12-21.
//

import Foundation

class Store: Codable {
    var name: String
    var code: String
    var address: String

    init(id:Int,name: String, code: String, address: String) {
        self.name = name
        self.code = code
        self.address = address
    }
    
    enum CodingKeys: String, CodingKey {
            case address = "full_address"
            case name
            case code
    }
}
