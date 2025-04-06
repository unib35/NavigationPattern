# SwiftUI 탭 기반 네비게이션 패턴

이 문서는 탭 기반 애플리케이션을 위한 확장 가능하고 유지보수하기 쉬운 네비게이션 패턴에 대해 설명합니다. 이 패턴은 복잡한 네비게이션 흐름을 체계적으로 관리하고, 탭 내부 이동과 탭 외부 이동을 일관된 방식으로 처리합니다.

## 목차

- [구조 개요](#구조-개요)
- [핵심 컴포넌트](#핵심-컴포넌트)
- [기본 사용법](#기본-사용법)
- [문제 해결](#문제-해결)

## 구조 개요

이 네비게이션 패턴은 다음 세 가지 주요 흐름을 관리합니다:

1. **탭 내부 네비게이션**: 각 탭의 내부 화면 간 이동
2. **탭 간 네비게이션**: 한 탭에서 다른 탭으로 이동
3. **탭 외부 네비게이션**: 탭 구조와 독립적인 전체 화면 이동

시스템은 코디네이터 패턴을 기반으로 하며, 다음과 같은 세 가지 주요 코디네이터로 구성됩니다:

- **AppFlowCoordinator**: 앱의 주요 상태 관리 및 일반화된 네비게이션 처리
- **TabCoordinator**: 탭 선택 및 탭 내 네비게이션 스택 관리
- **ModalCoordinator**: 모달 프레젠테이션 관리

## 핵심 컴포넌트

### 앱 상태 정의

```swift
enum AppFlowState: Hashable {
    case authentication
    case onboarding
    case mainTabs
    case fullScreen(FullScreenRoute)
}
```

### 라우트 정의

```swift
enum AppRoute: Hashable {
    case tab(TabRoute)
    case fullScreen(FullScreenRoute)
}

enum TabRoute: Hashable {
    case explore(ExploreRoute)
    case library(LibraryRoute)
    case profile(ProfileRoute)
}
```

### AppFlowCoordinator

```swift
@Observable
class AppFlowCoordinator {
    var currentState: AppFlowState = .authentication
    var previousState: AppFlowState? = nil

    private var navigationStack: [AppFlowState] = []

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

    func navigateTo(_ state: AppFlowState) {
        previousState = currentState
        switch state {
        case .fullScreen:
            navigationStack.append(state)
        case .mainTabs, .authentication, .onboarding:
            navigationStack = [state]
        }
        currentState = state
    }

    func navigateBack() {
        if !navigationStack.isEmpty {
            _ = navigationStack.popLast()
        }
        currentState = navigationStack.last ?? .mainTabs
    }

    func navigateToRoot(_ state: AppFlowState = .mainTabs) {
        navigationStack = [state]
        currentState = state
    }

    func navigateToFullScreen(_ route: FullScreenRoute) {
        navigateTo(.fullScreen(route))
    }

    func canNavigateBack() -> Bool {
        return navigationStack.count > 1
    }

    func isInNavigationStack(_ stateType: AppFlowState.Type) -> Bool {
        return navigationStack.contains { type(of: $0) == stateType }
    }
}
```

### 네비게이션 컨트롤러 및 컨테이너 뷰

`NavigationController`와 각 탭의 컨테이너 뷰는 경로 관리를 일관되게 처리하여 앱 전역에서 네비게이션 흐름을 조정합니다.

## 기본 사용법

- 탭 내부 네비게이션:

```swift
@Environment(\navigator) private var navigator

Button("상세 화면으로 이동") {
    navigator(.tab(.explore(.detail(content))))
}
```

- 탭 간 네비게이션:

```swift
Button("프로필 설정으로 이동") {
    navigator(.tab(.profile(.settings)))
}
```

- 전체 화면 네비게이션:

```swift
Button("이용약관 보기") {
    navigator(.fullScreen(.termsAndConditions))
}
```

## 탭 이외의 뷰 이동

- 해당 뷰로 이동:

```swift
@Environment(AppFlowCoordinator.self) private var appFlowCoordinator

Button("뒤로 가기") {
    if appFlowCoordinator.canNavigateBack() {
        appFlowCoordinator.navigateTo(.authentication)
    }
}
```

- 뒤로 이동:

```swift
@Environment(AppFlowCoordinator.self) private var appFlowCoordinator

Button("뒤로 가기") {
    if appFlowCoordinator.canNavigateBack() {
        appFlowCoordinator.navigateBack()
    }
}
```

- 루트로 이동:

```swift
Button("루트로 이동") {
    appFlowCoordinator.navigateToRoot()
}
```

## 문제 해결

- 네비게이션 스택 관리: 스택 기반 처리 방식으로 복잡한 화면 흐름을 신뢰할 수 있게 처리합니다.
- 다중 모달 충돌 방지
- 화면 전환 애니메이션 최적화

---

이 업데이트된 네비게이션 패턴은 상태 전환을 더 명확하게 관리하며, 일관되고 예측 가능한 네비게이션 경험을 제공합니다. 특히 스택 기반 상태 관리를 통해 복잡한 상태 전환을 직관적이고 신뢰할 수 있는 방식으로 처리합니다. 앱 상태 변화 시 각 흐름 간의 전환을 더욱 원활하게 관리하여 사용자 경험을 크게 향상시킵니다.

