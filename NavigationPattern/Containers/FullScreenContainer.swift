//
//  FullScreenContainer.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

// 전체 화면 컨테이너
struct FullScreenContainer: View {
    let route: FullScreenRoute
    @Environment(AppFlowCoordinator.self) private var appFlowCoordinator
    
    var body: some View {
        NavigationStack {
            route.view
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("닫기") {
                            appFlowCoordinator.navigateBack()
                        }
                    }
                }
        }
    }
}
