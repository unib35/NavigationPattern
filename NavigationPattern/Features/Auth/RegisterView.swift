//
//  RegisterView.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.navigator) private var navigator
    @Environment(AppFlowCoordinator.self) private var appFlowCoordinator
    @Environment(\.dismiss) private var dismiss
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("회원가입")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("이메일", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            
            SecureField("비밀번호", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("비밀번호 확인", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("회원가입") {
                // 회원가입 로직 (간단한 데모용)
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                appFlowCoordinator.navigateTo(.mainTabs)
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
            
            Button("이미 계정이 있으신가요? 로그인") {
                navigator(.fullScreen(.login))
            }
            
            Button("이용약관 보기") {
                navigator(.fullScreen(.termsAndConditions))
            }
            .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("회원가입")
    }
}

#Preview {
    RegisterView()
}
