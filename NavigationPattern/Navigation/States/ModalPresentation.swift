//
//  ModalPresentation.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

// 모달 프레젠테이션 타입
enum ModalPresentation: Identifiable {
    case settings
    case newContent
    case notification(Message)
    case alert(title: String, message: String)
    
    var id: String {
        switch self {
        case .settings: return "settings"
        case .newContent: return "newContent"
        case .notification: return "notification"
        case .alert: return "alert"
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .settings:
            NavigationStack {
                SettingsView()
            }
        case .newContent:
            NavigationStack {
                CreateContentView()
            }
        case .notification(let message):
            NotificationView(message: message)
        case .alert(let title, let message):
            AlertView(title: title, message: message)
        }
    }
}
