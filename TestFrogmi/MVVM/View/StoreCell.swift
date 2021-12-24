//
//  StoreCell.swift
//  TestFrogmi
//
//  Created by José Antonio Aravena on 23-12-21.
//

import SwiftUI

struct StoreCell: View {
    let store: Store

    var body: some View {
        VStack(alignment: .leading) {
            HStack(){
                Text(store.name + " | ")
                    .font(.headline)
                Text(store.code)
                    .font(.headline)
                    .foregroundColor(Color.gray)
            }
            Text(store.address)
                .font(.footnote)
        }
    }
}
