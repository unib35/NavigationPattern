//
//  FullScreenRoute.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

// 전체 화면 라우트 (탭 외부)
enum FullScreenRoute: Hashable {
    case login
    case register
    case passwordReset
    case termsAndConditions
    case privacyPolicy
    case onboardingStep(Int)
    case settings
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .login:
            LoginView()
        case .register:
            RegisterView()
        case .passwordReset:
            PasswordResetView()
        case .termsAndConditions:
            TermsAndConditionsView()
        case .privacyPolicy:
            PrivacyPolicyView()
        case .onboardingStep(let step):
            OnboardingStepView(step: step)
        case .settings:
            SettingsView()
        }
    }
}
