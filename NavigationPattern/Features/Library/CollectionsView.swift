//
//  CollectionsView.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct CollectionsView: View {
    @Environment(\.navigator) private var navigator
    
    var body: some View {
        List {
            Section(header: Text("컬렉션")) {
                Button("모든 콘텐츠") {
                    // 이동 로직
                }
                
                Button("즐겨찾기 보기") {
                    navigator(.tab(.library(.favorites)))
                }
            }
            
            Section(header: Text("최근 추가됨")) {
                ForEach(Content.samples.prefix(3)) { content in
                    Button(action: {
                        navigator(.tab(.library(.detail(content))))
                    }) {
                        Text(content.title)
                    }
                }
            }
        }
        .navigationTitle("라이브러리")
    }
}
