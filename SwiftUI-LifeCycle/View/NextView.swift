//
//  NextView.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/05/24.
//

import SwiftUI

struct NextView: View {
    
    let presenter: DataPresenter
    
    init(presenter: DataPresenter) {
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
                        presenter.gotoDetail(todo: todo)
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
