//
//  AuthenticationContainer.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

// 인증 화면 컨테이너
struct AuthenticationContainer: View {
    @State private var routes: [AuthRoute] = []
    @Environment(AppFlowCoordinator.self) private var appFlowCoordinator
    
    var body: some View {
        NavigationStack(path: $routes) {
            LoginView()
                .navigationDestination(for: AuthRoute.self) { route in
                    route.view
                }
        }
        .environment(\.navigator, NavigationController(action: { route in
            switch route {
            case .tab:
                // 인증 화면에서는 탭 라우트 처리하지 않음
                break
                
            case .fullScreen(let fullScreenRoute):
                if fullScreenRoute == .login || fullScreenRoute == .register {
                    if let authRoute = convertToAuthRoute(fullScreenRoute) {
                        routes.append(authRoute)
                    }
                } else {
                    appFlowCoordinator.navigateToFullScreen(fullScreenRoute)
                }
            }
        }))
    }
    
    // FullScreenRoute를 AuthRoute로 변환
    private func convertToAuthRoute(_ route: FullScreenRoute) -> AuthRoute? {
        switch route {
        case .login:
            return .login
        case .register:
            return .register
        case .passwordReset:
            return .forgotPassword
        default:
            return nil
        }
    }
}
