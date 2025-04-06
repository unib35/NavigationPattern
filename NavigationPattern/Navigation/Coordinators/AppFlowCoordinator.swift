//
//  AppFlowCoordinator.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI
import Foundation

@Observable
class AppFlowCoordinator {
    // 현재 앱 상태
    var currentState: AppFlowState = .authentication
    var previousState: AppFlowState? = nil
    
    // 탭 외부의 전체 화면 경로 스택
    private var navigationStack: [AppFlowState] = []
    
    // 초기 상태 결정
    func determineInitialState() {
        if UserDefaults.standard.bool(forKey: "hasCompletedOnboarding") {
            if UserDefaults.standard.bool(forKey: "isUserLoggedIn") {
                navigateTo(.mainTabs)
            } else {
                navigateTo(.authentication)
            }
        } else {
            navigateTo(.onboarding)
        }
    }
    
    // 일반화된 네비게이션 메서드
    func navigateTo(_ state: AppFlowState) {
        previousState = currentState
        
        // 스택 관리
        switch state {
        case .fullScreen:
            // 전체 화면은 스택에 추가
            navigationStack.append(state)
        case .mainTabs, .authentication, .onboarding:
            // 메인 상태로 이동하면 스택 초기화
            navigationStack = [state]
        }
        
        currentState = state
    }
    
    // 뒤로 이동
    func navigateBack() {
        // 현재 상태를 스택에서 제거
        if !navigationStack.isEmpty {
            _ = navigationStack.popLast()
        }
        
        // 이전 상태로 돌아가기
        if let previousState = navigationStack.last {
            currentState = previousState
        } else {
            // 스택이 비어있으면 메인 탭으로
            currentState = .mainTabs
        }
    }
    
    // 루트로 이동 (지정된 상태로 스택 초기화)
    func navigateToRoot(_ state: AppFlowState = .mainTabs) {
        navigationStack = [state]
        currentState = state
    }
    
    // 편의 메서드: 전체 화면으로 이동
    func navigateToFullScreen(_ route: FullScreenRoute) {
        navigateTo(.fullScreen(route))
    }
    
    // 편의 메서드: 이전 화면 확인
    func canNavigateBack() -> Bool {
        return navigationStack.count > 1
    }
    
    // 특정 상태가 현재 스택에 있는지 확인
    func isInNavigationStack(_ stateType: AppFlowState.Type) -> Bool {
        return navigationStack.contains { type(of: $0) == stateType }
    }
}
