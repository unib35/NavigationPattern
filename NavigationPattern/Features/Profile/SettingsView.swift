//
//  SettingsView.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.navigator) private var navigator
    
    var body: some View {
        List {
            Section(header: Text("계정")) {
                Button("알림 설정") {
                    // 알림 설정
                }
                
                Button("개인정보 설정") {
                    // 개인정보 설정
                }
                
                Button("이용약관 보기") {
                    navigator(.fullScreen(.termsAndConditions))
                }
                
                Button("개인정보 처리방침") {
                    navigator(.fullScreen(.privacyPolicy))
                }
            }
            
            Section {
                Button("로그아웃") {
                    // 로그아웃 로직
                }
                .foregroundColor(.red)
            }
        }
        .navigationTitle("설정")
        .toolbar {
            Button("닫기") {
                dismiss()
            }
        }
    }
}
