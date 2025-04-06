//
//  NotificationView.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct NotificationView: View {
    let message: Message
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text(message.title)
                .font(.title)
                .fontWeight(.bold)
            
            Text(message.body)
                .multilineTextAlignment(.center)
            
            Button("확인") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}
