//
//  StateValue.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/05/24.
//

import Foundation

enum LoadActionState: String {
    case initial
    case loading
    case complete
    
    var message: String {
        switch self {
        case .initial:
            return ""
        case .loading:
            return "loding....."
        case .complete:
            return "complete!!!!!"
        }
    }
}

class StateValue: ObservableObject {
    @Published var loadingState: LoadActionState = .initial
    @Published var todos: [Todo] = []
    
    init() {}
}
