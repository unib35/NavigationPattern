//
//  TabRoute.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import Foundation

// 탭 라우트 통합
enum TabRoute: Hashable {
    case explore(ExploreRoute)
    case library(LibraryRoute)
    case profile(ProfileRoute)
}
