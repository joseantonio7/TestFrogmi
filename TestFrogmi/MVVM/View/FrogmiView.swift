//
//  FrogmiView.swift
//  TestFrogmi
//
//  Created by José Antonio Aravena on 23-12-21.
//

import SwiftUI

struct FrogmiState {
    var myStores: [AnyViewModel<BaseState, StoreInput>]
    var next: String
}


struct FrogmiView: View {

    @EnvironmentObject
    private var viewModel: AnyViewModel<FrogmiState, Never>

    var body: some View {
        VStack {
            NavigationView {
                List(viewModel.myStores) { viewModel in
                    StoreCell(store: viewModel.store)
                }.refreshable {
                    viewModel.next()
                }
                .navigationBarTitle("My App")
            }
        }
    }
}
