//
//  ProfileOverviewView.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct ProfileOverviewView: View {
    @Environment(\.navigator) private var navigator
    @Environment(ModalCoordinator.self) private var modalCoordinator
    @Environment(AppFlowCoordinator.self) private var appFlowCoordinator
    
    var body: some View {
        List {
            Section {
                HStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading) {
                        Text("사용자 이름")
                            .font(.headline)
                        Text("user@example.com")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 8)
                }
                .padding(.vertical, 8)
            }
            
            Section {
                Button("프로필 편집") {
                    navigator(.tab(.profile(.editProfile)))
                }
                
                Button("설정") {
                    navigator(.tab(.profile(.settings)))
                }
                
                Button("설정(모달)") {
                    modalCoordinator.presentModal(.settings)
                }
                
                Button("로그아웃") {
                    UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
                    appFlowCoordinator.navigateTo(.authentication)
                }
                .foregroundColor(.red)
            }
        }
        .navigationTitle("프로필")
    }
    
    
}
