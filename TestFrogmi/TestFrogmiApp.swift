//
//  TestFrogmiApp.swift
//  TestFrogmi
//
//  Created by José Antonio Aravena on 23-12-21.
//

import SwiftUI

@main
struct TestFrogmiApp: App {
    var body: some Scene {
        WindowGroup {
            let storeService = FrogmiStoreService()
            let viewModel = AnyViewModel(FrogmiViewModel(storeService: storeService))
            let contentView = FrogmiView()
                .environmentObject(viewModel)
            contentView
            
        }
    }
}
