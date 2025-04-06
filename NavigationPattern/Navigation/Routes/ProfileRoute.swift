//
//  ProfileRoute.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

// 프로필 탭 라우트
enum ProfileRoute: Hashable {
    case overview
    case settings
    case editProfile
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .overview:
            ProfileOverviewView()
        case .settings:
            SettingsView()
        case .editProfile:
            EditProfileView()
        }
    }
}
