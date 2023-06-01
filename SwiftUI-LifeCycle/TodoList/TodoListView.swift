//
//  TodoListView.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/05/24.
//

import SwiftUI

struct TodoListView: View {
    
    
    struct Dependency {
        let presenter: TodoListPresenterProtocol
    }
    @ObservedObject var state: TodoListStateValue
    
    var dependency: Dependency!
    
    init(dependency: Dependency) {
        self.dependency = dependency
        self.state = dependency.presenter.state
    }
    
    var body: some View {
        VStack {
            List {
                Section {
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Text("空の画面")
                    }
                }
                Section {
                    ForEach(state.todos) { todo in
                        NavigationLink {
                            DetailView(todo: todo)
                        } label: {
                            Text(todo.title)
                        };
                    }
                }
            }
        }
        .onAppear {
            dependency.presenter.onAppear()
        }
        .task {
            Task {
                do {
                    try await dependency.presenter.task()
                } catch {
                    print(error)
                }
            }
        }
        .onDisappear {
            dependency.presenter.onDisappear()
        }
        .overlay {
            ProgressView()
                .progressViewStyle(.circular)
                .padding()
                .tint(Color.white)
                .background(Color.gray)
                .cornerRadius(8)
                .scaleEffect(1.2)
                .isHidden(state.progressIsHidden)
        }
        .navigationTitle("Todos")
    }
}

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}

