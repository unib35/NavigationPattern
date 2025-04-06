//
//  NavigationDestination.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

// MARK: - 네비게이션 목적지 정의
enum TabDestination: Hashable, CaseIterable, Identifiable {
    case explore
    case library
    case profile
    
    var id: Self { self }
    
    @ViewBuilder
    var label: some View {
        switch self {
        case .explore:
            Label("탐색", systemImage: "magnifyingglass")
        case .library:
            Label("라이브러리", systemImage: "books.vertical")
        case .profile:
            Label("프로필", systemImage: "person")
        }
    }
}
