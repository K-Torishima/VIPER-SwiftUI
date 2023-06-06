//
//  Screen1Presenter.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/06/06.
//

import SwiftUI

enum Views {
    case todoList
    case hoge
    case huga
}

@MainActor
final class Screen1Presenter: Screen1PresenterProtocol {
    
    let state: Screen1StateValue = .init()
    
    var router: Screen1RouterProtocol
    
    init(router: Screen1RouterProtocol) {
        self.router = router
    }
    
    func onAppear() {}
    
    func task() async throws {}
    
    func onDisappear() {}

    func routing(view: Views) -> AnyView {
        switch view {
        case .todoList:
            return router.goToTodoList()
        case .hoge:
            return router.goTohogeView()
        case .huga:
            return router.sampleView()
        }
    }
}
