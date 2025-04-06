//
//  AppFlowState.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

enum AppFlowState: Hashable {
    case authentication  // 로그인/회원가입 화면
    case onboarding      // 온보딩 화면
    case mainTabs        // 메인 탭 인터페이스
    case fullScreen(FullScreenRoute)  // 탭 외부의 전체 화면 흐름
}
