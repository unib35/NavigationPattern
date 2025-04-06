//
//  MainTabContainer.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

// 메인 탭 컨테이너
struct MainTabContainer: View {
    @Environment(TabCoordinator.self) private var tabCoordinator
    @Environment(ModalCoordinator.self) private var modalCoordinator
    
    var body: some View {
        TabView(selection: Binding(
            get: { tabCoordinator.selectedTab },
            set: { tabCoordinator.selectedTab = $0 }
        )) {
            ForEach(TabDestination.allCases) { destination in
                tabView(for: destination)
                    .tabItem { destination.label }
                    .tag(destination)
            }
        }
    }
    
    @ViewBuilder
    private func tabView(for destination: TabDestination) -> some View {
        switch destination {
        case .explore:
            ExploreNavigationContainer()
        case .library:
            LibraryNavigationContainer()
        case .profile:
            ProfileNavigationContainer()
        }
    }
}
