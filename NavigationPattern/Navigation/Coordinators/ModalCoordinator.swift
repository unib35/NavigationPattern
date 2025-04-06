//
//  ModalCoordinator.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import Foundation

/// 모달 표시 관리 코디네이터
@Observable
class ModalCoordinator {
    // 현재 활성화된 모달
    var activeModal: ModalPresentation?
    
    // 모달 표시
    func presentModal(_ modal: ModalPresentation) {
        activeModal = modal
    }
    
    // 현재 모달 닫기
    func dismissModal() {
        activeModal = nil
    }
}
