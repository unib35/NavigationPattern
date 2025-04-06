//
//  FavoritesView.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(\.navigator) private var navigator
    
    var body: some View {
        List {
            ForEach(Content.samples.prefix(2)) { content in
                Button(action: {
                    navigator(.tab(.library(.detail(content))))
                }) {
                    Text(content.title)
                }
            }
        }
        .navigationTitle("즐겨찾기")
    }
}
