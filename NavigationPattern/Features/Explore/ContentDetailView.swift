//
//  ContentDetailView.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct ContentDetailView: View {
    let content: Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(content.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(content.description)
                .font(.body)
            
            Spacer()
        }
        .padding()
        .navigationTitle(content.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
