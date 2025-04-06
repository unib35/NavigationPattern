//
//  NavigationController.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

// MARK: - 네비게이션 컨트롤러
struct NavigationController {
    typealias Action = (AppRoute) -> Void
    let action: Action
    
    func callAsFunction(_ route: AppRoute) {
        action(route)
    }
}

struct NavigationControllerKey: EnvironmentKey {
    static var defaultValue: NavigationController = NavigationController(action: { _ in })
}

extension EnvironmentValues {
    var navigator: NavigationController {
        get { self[NavigationControllerKey.self] }
        set { self[NavigationControllerKey.self] = newValue }
    }
}
