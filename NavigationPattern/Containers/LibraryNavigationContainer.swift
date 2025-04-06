//
//  LibraryNavigationContainer.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct LibraryNavigationContainer: View {
    @State private var routeStack: [LibraryRoute] = []
    @Environment(TabCoordinator.self) private var tabCoordinator
    @Environment(ModalCoordinator.self) private var modalCoordinator
    @Environment(AppFlowCoordinator.self) private var appFlowCoordinator
    
    var body: some View {
        NavigationStack(path: $routeStack) {
            CollectionsView()
                .navigationDestination(for: LibraryRoute.self) { route in
                    route.view
                }
        }
        .environment(\.navigator, NavigationController(action: { route in
            switch route {
            case .tab(let tabRoute):
                handleTabRoute(tabRoute)
                
            case .fullScreen(let fullScreenRoute):
                appFlowCoordinator.navigateToFullScreen(fullScreenRoute)
            }
        }))
        .onAppear {
            // 이 탭이 선택될 때 라우트 배열 동기화
            if tabCoordinator.selectedTab == .library {
                routeStack = tabCoordinator.libraryRoutes
            }
        }
        .onChange(of: routeStack) {
            // 라우트 변경시 코디네이터 업데이트
            tabCoordinator.libraryRoutes = routeStack
        }
        .onChange(of: tabCoordinator.selectedTab) {
            // 탭이 변경되면 라우트 배열 동기화
            if tabCoordinator.selectedTab == .library {
                routeStack = tabCoordinator.libraryRoutes
            }
        }
    }
    
    private func handleTabRoute(_ tabRoute: TabRoute) {
        switch tabRoute {
        case .library(let libraryRoute):
            routeStack.append(libraryRoute)
            
        case .explore, .profile:
            // 다른 탭으로 이동하고 해당 경로로 이동
            let destination = tabRoute
            
            // 1. 탭 변경
            switch tabRoute {
            case .explore:
                tabCoordinator.selectedTab = .explore
            case .profile:
                tabCoordinator.selectedTab = .profile
            default:
                break
            }
            
            // 2. 목적지 라우트 설정
            DispatchQueue.main.async {
                switch destination {
                case .explore(let route):
                    tabCoordinator.exploreRoutes.append(route)
                case .profile(let route):
                    tabCoordinator.profileRoutes.append(route)
                default:
                    break
                }
            }
        }
    }
}
