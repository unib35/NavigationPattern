//
//  PasswordResetView.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct PasswordResetView: View {
    @Environment(\.navigator) private var navigator
    @Environment(AppFlowCoordinator.self) private var appFlowCoordinator
    
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("비밀번호 재설정")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            SecureField("새 비밀번호", text: $newPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("비밀번호 확인", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("비밀번호 변경") {
                // 비밀번호 변경 로직 (데모용)
                navigator(.fullScreen(.login))
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
            
            Button("로그인으로 돌아가기") {
                navigator(.fullScreen(.login))
            }
            .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("비밀번호 재설정")
    }
}
#Preview {
    PasswordResetView()
}
