//
//  Route.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

// MARK: - 라우트 정의
// 통합 라우트 타입 (각 네비게이션 컨테이너에서 사용)
enum AppRoute: Hashable {
    case tab(TabRoute)
    case fullScreen(FullScreenRoute)
}
