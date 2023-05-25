//
//  NextView.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/05/24.
//

import SwiftUI

struct NextView: View {
    
    @ObservedObject var state: StateValue
    let presenter: DataPresenter
    
    init(state: StateValue,
         presenter: DataPresenter) {
        self.state = state
        self.presenter = presenter
    }
    
    var body: some View {
        VStack {
            Text(presenter.state.loadingState.message)
            Text("todoの数: \(presenter.state.todos.count)")
            Spacer()
            List {
                ForEach(presenter.state.todos) { todo in
                    NavigationLink {
                        DetailView(todo: todo)
                        //presenter.router.makeDetailView(todo: todo)
                    } label: {
                        Text(todo.title)
                    }
                }
            }
        }
        .onAppear {
            presenter.onAppear()
        }
        .task {
            Task {
                do {
                    try await presenter.task()
                } catch {
                    print(error)
                }
            }
        }
        .onDisappear {
            presenter.onDisappear()
        }
    }
}
