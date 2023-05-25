//
//  Content.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/05/24.
//

import Foundation

enum Content {
    
    struct Context {
        let data: String
        init(data: String) {
            self.data = data
        }
    }
    
    struct State {
        static var initial: State {
            .init(stateValue: .init())
        }
        
        var stateValue: StateValue
        var error: Error?
    }
}
