//
//  CreateContentView.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct CreateContentView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            Section(header: Text("새 콘텐츠")) {
                TextField("제목", text: $title)
                
                TextField("설명", text: $description)
                    .frame(height: 100, alignment: .topLeading)
                    .multilineTextAlignment(.leading)
            }
            
            Section {
                Button("만들기") {
                    // 저장 로직
                    dismiss()
                }
            }
        }
        .navigationTitle("새 콘텐츠")
        .toolbar {
            Button("취소") {
                dismiss()
            }
        }
    }
}
