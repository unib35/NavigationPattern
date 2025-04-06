//
//  OnboardingStepView.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct OnboardingStepView: View {
    let step: Int
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: imageForStep)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .foregroundColor(.blue)
            
            Text(titleForStep)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(descriptionForStep)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var imageForStep: String {
        switch step {
        case 0: return "rectangle.stack.fill"
        case 1: return "magnifyingglass"
        case 2: return "person.fill"
        default: return "star.fill"
        }
    }
    
    private var titleForStep: String {
        switch step {
        case 0: return "콘텐츠 관리"
        case 1: return "쉬운 검색"
        case 2: return "개인화된 경험"
        default: return "환영합니다"
        }
    }
    
    private var descriptionForStep: String {
        switch step {
        case 0: return "다양한 콘텐츠를 쉽게 정리하고 관리하세요. 편리한 인터페이스로 콘텐츠를 체계적으로 분류할 수 있습니다."
        case 1: return "강력한 검색 기능을 통해 원하는 콘텐츠를 빠르게 찾아보세요. 다양한 필터 옵션을 제공합니다."
        case 2: return "개인화된 추천과 설정으로 나만의 경험을 만들어보세요. 맞춤형 콘텐츠를 제공받을 수 있습니다."
        default: return "지금 시작해보세요!"
        }
    }
}
