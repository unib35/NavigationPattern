//
//  ForgotPasswordView.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.navigator) private var navigator
    @Environment(AppFlowCoordinator.self) private var appFlowCoordinator
    @Environment(\.dismiss) private var dismiss
    
    @State private var email = ""
    @State private var isSent = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("비밀번호 재설정")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("이메일", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            
            Button(isSent ? "재전송" : "재설정 링크 전송") {
                // 비밀번호 재설정 이메일 전송 로직 (데모용)
                withAnimation {
                    isSent = true
                }
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
            
            if isSent {
                Text("재설정 링크가 이메일로 전송되었습니다.")
                    .foregroundColor(.green)
                    .padding()
            }
            
            Button("로그인으로 돌아가기") {
                navigator(.fullScreen(.login))
            }
        }
        .padding()
        .navigationTitle("비밀번호 찾기")
    }
}

#Preview {
    ForgotPasswordView()
}
