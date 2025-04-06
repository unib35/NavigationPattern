//
//  RootView.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

// 앱의 루트 뷰 - 모든 코디네이터 통합
struct RootView: View {
    @State private var appFlowCoordinator = AppFlowCoordinator()
    @State private var tabCoordinator = TabCoordinator()
    @State private var modalCoordinator = ModalCoordinator()
    
    var body: some View {
        Group {
            switch appFlowCoordinator.currentState {
            case .authentication:
                AuthenticationContainer()
                    .transition(.opacity.combined(with: .slide))
                
            case .onboarding:
                OnboardingContainer()
                    .transition(.move(edge: .trailing))
                
            case .mainTabs:
                MainTabContainer()
                    .transition(.opacity)
                
            case .fullScreen(let route):
                FullScreenContainer(route: route)
                    .transition(.move(edge: .trailing))
            }
        }
        .animation(.easeInOut, value: appFlowCoordinator.currentState)
        .environment(appFlowCoordinator)
        .environment(tabCoordinator)
        .environment(modalCoordinator)
        .sheet(item: Binding(
            get: { modalCoordinator.activeModal },
            set: { modalCoordinator.activeModal = $0 }
        )) { modal in
            modal.view
        }
        .onAppear {
            appFlowCoordinator.determineInitialState()
        }
    }
}
