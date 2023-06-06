//
//  Screen1Router.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/06/06.
//

import SwiftUI

@MainActor
final class Screen1Router: Screen1RouterProtocol {
    func goToTodoList() -> AnyView {
        let interactor = MockTodoListInteractor()
        let presenter = TodoListPresenter(interactor: interactor)
        let view = TodoListView(dependency: .init(presenter: presenter))
        return AnyView(view)
    }
    
    func goTohogeView() -> AnyView {
        let view = EmptyView()
        return AnyView(view)
    }
    
    // こんなのできるのか
    @ViewBuilder
    func sampleView() -> AnyView {
        let view = VStack {
            Text("hello")
        }
        
        AnyView(view)
    }
}
