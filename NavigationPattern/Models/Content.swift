//
//  Content.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import Foundation

// MARK: - 모델 정의
struct Content: Identifiable, Hashable {
    let id: UUID
    let title: String
    let description: String
    
    init(id: UUID = UUID(), title: String, description: String = "") {
        self.id = id
        self.title = title
        self.description = description
    }
    
    static func sample(index: Int) -> Content {
        Content(
            title: "콘텐츠 \(index)",
            description: "콘텐츠 \(index)에 대한 상세 설명입니다. 이것은 예제 데이터입니다."
        )
    }
    
    static var samples: [Content] {
        (1...10).map { Content.sample(index: $0) }
    }
}

