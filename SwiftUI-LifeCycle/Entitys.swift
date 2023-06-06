//
//  Entity.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/05/23.
//

import Foundation

struct Todo: Hashable, Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

struct Park: Hashable, Identifiable {
    let id: UUID
    let name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}

struct Fruits: Hashable, Identifiable {
    let id: UUID
    let name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}
