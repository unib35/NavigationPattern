//
//  LibraryRoute.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

// 라이브러리 탭 라우트
enum LibraryRoute: Hashable {
    case collections
    case favorites
    case detail(Content)
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .collections:
            CollectionsView()
        case .favorites:
            FavoritesView()
        case .detail(let content):
            ContentDetailView(content: content)
        }
    }
}
