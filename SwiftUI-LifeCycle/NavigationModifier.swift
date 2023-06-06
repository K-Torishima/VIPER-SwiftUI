//
//  NavigationModifier.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/06/05.
//

import SwiftUI

@MainActor
struct NavigationModifier: ViewModifier {
    @Binding var path: [Route]
    
    @ViewBuilder
    private func coordinator(_ route: Route) -> some View {
        switch route {
        case .todoList:
            TodoListView(
                dependency: .init(
                    presenter: TodoListPresenter(
                        interactor: MockTodoListInteractor()
                    )
                )
            )
        case .todoDetail(let todo):
            DetailView(todo: todo)
        case .view3:
            EmptyView()
        }
    }
    
    func body(content: Content) -> some View {
        NavigationStack(path: $path) {
            content
                .navigationDestination(for: Route.self) { route in
                    coordinator(route)
                }
        }
    }
}

extension View {
    func navigation(path: Binding<[Route]>) -> some View {
        self.modifier(NavigationModifier(path: path))
    }
}
