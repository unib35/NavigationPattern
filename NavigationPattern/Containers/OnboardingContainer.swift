//
//  OnboardingContainer.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

// 온보딩 컨테이너
struct OnboardingContainer: View {
    @Environment(AppFlowCoordinator.self) private var appFlowCoordinator
    @State private var currentStep = 0
    let totalSteps = 3
    
    var body: some View {
        VStack {
            TabView(selection: $currentStep) {
                ForEach(0..<totalSteps, id: \.self) { index in
                    OnboardingStepView(step: index)
                        .tag(index)
                }
            }
            .tabViewStyle(.page)
            
            Button(currentStep < totalSteps - 1 ? "다음" : "시작하기") {
                if currentStep < totalSteps - 1 {
                    currentStep += 1
                } else {
                    UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
                    appFlowCoordinator.navigateTo(.authentication)
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
}
