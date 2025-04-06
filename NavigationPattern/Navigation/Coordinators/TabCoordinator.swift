//
//  TabCoordinator.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

@Observable
class TabCoordinator {
    // 선택된 탭
    var selectedTab: TabDestination = .explore
    
    // 각 탭별 라우트 스택
    var exploreRoutes: [ExploreRoute] = []
    var libraryRoutes: [LibraryRoute] = []
    var profileRoutes: [ProfileRoute] = []
    
    // 특정 탭으로 이동
    func selectTab(_ tab: TabDestination) {
        selectedTab = tab
    }
    
    // 현재 탭의 라우트 스택 가져오기
    func currentRouteStack() -> Binding<[Any]> {
        switch selectedTab {
        case .explore:
            return Binding<[Any]>(
                get: { self.exploreRoutes },
                set: { self.exploreRoutes = $0 as? [ExploreRoute] ?? [] }
            )
        case .library:
            return Binding<[Any]>(
                get: { self.libraryRoutes },
                set: { self.libraryRoutes = $0 as? [LibraryRoute] ?? [] }
            )
        case .profile:
            return Binding<[Any]>(
                get: { self.profileRoutes },
                set: { self.profileRoutes = $0 as? [ProfileRoute] ?? [] }
            )
        }
    }
    
    // 현재 탭의 라우트 스택 지우기
    func clearCurrentTabRoutes() {
        switch selectedTab {
        case .explore:
            exploreRoutes.removeAll()
        case .library:
            libraryRoutes.removeAll()
        case .profile:
            profileRoutes.removeAll()
        }
    }
    
    // 특정 탭의 라우트 스택 지우기
    func clearRoutes(for tab: TabDestination) {
        switch tab {
        case .explore:
            exploreRoutes.removeAll()
        case .library:
            libraryRoutes.removeAll()
        case .profile:
            profileRoutes.removeAll()
        }
    }
    
    // 모든 탭의 라우트 스택 지우기
    func clearAllTabRoutes() {
        exploreRoutes.removeAll()
        libraryRoutes.removeAll()
        profileRoutes.removeAll()
    }
}
