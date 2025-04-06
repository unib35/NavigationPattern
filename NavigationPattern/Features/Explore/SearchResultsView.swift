//
//  SearchResultsView.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct SearchResultsView: View {
    let query: Query
    @Environment(\.navigator) private var navigator
    
    var body: some View {
        List {
            Section(header: Text("'\(query.term)'에 대한 결과")) {
                ForEach(Content.samples.suffix(3)) { content in
                    Button(action: {
                        navigator(.tab(.explore(.detail(content))))
                    }) {
                        Text(content.title)
                    }
                }
            }
        }
        .navigationTitle("검색 결과")
    }
}
