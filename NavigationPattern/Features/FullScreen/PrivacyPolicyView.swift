//
//  PrivacyPolicyView.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct PrivacyPolicyView: View {
    @Environment(AppFlowCoordinator.self) private var appFlowCoordinator
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Group {
                    Text("1. 개인정보의 수집 및 이용 목적")
                        .font(.headline)
                    
                    Text("회사는 서비스 제공, 사용자 식별, 서비스 개선 등의 목적으로 개인정보를 수집 및 이용합니다.")
                        .padding(.bottom)
                    
                    Text("2. 수집하는 개인정보 항목")
                        .font(.headline)
                    
                    Text("이메일, 이름, 프로필 정보 등을 수집할 수 있습니다.")
                        .padding(.bottom)
                    
                    Text("3. 개인정보의 보유 및 이용 기간")
                        .font(.headline)
                    
                    Text("개인정보는 서비스 탈퇴 시까지 보관되며, 법령에 따라 보존이 필요한 경우 해당 기간 동안 보존됩니다.")
                        .padding(.bottom)
                }
                
                Group {
                    Text("4. 개인정보의 제3자 제공")
                        .font(.headline)
                    
                    Text("회사는 사용자의 동의 없이 개인정보를 제3자에게 제공하지 않습니다. 다만, 법령에 의해 요구되는 경우는 예외로 합니다.")
                        .padding(.bottom)
                    
                    Text("5. 사용자의 권리")
                        .font(.headline)
                    
                    Text("사용자는 언제든지 개인정보의 조회, 수정, 삭제를 요청할 수 있습니다.")
                        .padding(.bottom)
                }
            }
            .padding()
        }
        .navigationTitle("개인정보 처리방침")
    }
}


#Preview {
    PrivacyPolicyView()
}
