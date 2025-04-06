//
//  ExploreRoute.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

// 탐색 탭 라우트
enum ExploreRoute: Hashable {
    case feed
    case detail(Content)
    case searchResults(Query)
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .feed:
            FeedView()
        case .detail(let content):
            ContentDetailView(content: content)
        case .searchResults(let query):
            SearchResultsView(query: query)
        }
    }
}
