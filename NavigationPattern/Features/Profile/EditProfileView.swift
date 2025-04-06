//
//  EditProfileView.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct EditProfileView: View {
    @State private var username: String = "사용자 이름"
    @State private var email: String = "user@example.com"
    
    var body: some View {
        Form {
            Section(header: Text("개인 정보")) {
                TextField("이름", text: $username)
                TextField("이메일", text: $email)
            }
            
            Section {
                Button("변경사항 저장") {
                    // 저장 로직
                }
            }
        }
        .navigationTitle("프로필 편집")
    }
}
