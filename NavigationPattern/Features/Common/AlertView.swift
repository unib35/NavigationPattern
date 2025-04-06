//
//  AlertView.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct AlertView: View {
    let title: String
    let message: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
            
            Text(message)
                .multilineTextAlignment(.center)
            
            Button("확인") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
        }
        .padding()
        .frame(width: 300)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(radius: 5)
        )
    }
}
