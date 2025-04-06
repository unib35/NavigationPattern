//
//  TermsAndConditionsView.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct TermsAndConditionsView: View {
    @Environment(AppFlowCoordinator.self) private var appFlowCoordinator
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Group {
                    Text("1. 서비스 이용 약관")
                        .font(.headline)
                    
                    Text("이 약관은 사용자가 애플리케이션을 이용함에 있어 필요한 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.")
                        .padding(.bottom)
                    
                    Text("2. 개인정보 처리방침")
                        .font(.headline)
                    
                    Text("개인정보의 수집, 이용, 제공, 위탁 등에 관한 사항을 규정합니다. 회사는 사용자의 개인정보를 보호하고 보안을 유지하기 위해 최선을 다합니다.")
                        .padding(.bottom)
                    
                    Text("3. 서비스 이용 제한")
                        .font(.headline)
                    
                    Text("서비스 이용에 관한 제한사항과 위반 시 조치에 대해 규정합니다.")
                        .padding(.bottom)
                }
                
                Group {
                    Text("4. 지적재산권")
                        .font(.headline)
                    
                    Text("서비스에 포함된 모든 콘텐츠에 대한 저작권, 상표권 등 지적재산권은 회사 또는 원저작자에게 있습니다.")
                        .padding(.bottom)
                    
                    Text("5. 책임 제한")
                        .font(.headline)
                    
                    Text("서비스 이용에 따른 책임에 관한 사항을 규정합니다.")
                        .padding(.bottom)
                }
            }
            .padding()
        }
        .navigationTitle("이용약관")
    }
}

#Preview {
    TermsAndConditionsView()
}
