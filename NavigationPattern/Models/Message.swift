//
//  Message.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import Foundation

struct Message: Identifiable, Hashable {
    let id: UUID = UUID()
    let title: String
    let body: String
}
