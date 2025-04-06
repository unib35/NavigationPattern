//
//  AuthRoute.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

// 인증 관련 라우트
enum AuthRoute: Hashable {
    case login
    case register
    case forgotPassword
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .login:
            LoginView()
        case .register:
            RegisterView()
        case .forgotPassword:
            ForgotPasswordView()
        }
    }
}
