//
//  LoginView.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.navigator) private var navigator
    @Environment(AppFlowCoordinator.self) private var appFlowCoordinator
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("로그인")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("이메일", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            
            SecureField("비밀번호", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("로그인") {
                // 로그인 로직 (간단한 데모용)
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                appFlowCoordinator.navigateTo(.mainTabs)
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
            
            Button("회원가입") {
                navigator(.fullScreen(.register))
            }
            
            Button("비밀번호 찾기") {
                navigator(.fullScreen(.passwordReset))
            }
            .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("로그인")
    }
}

#Preview {
    LoginView()
}
