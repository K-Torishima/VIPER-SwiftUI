//
//  SampleScreens.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/06/05.
//

import SwiftUI

struct Screen1: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    NavigationLink {
                        TodoListView(
                            dependency: .init(
                                presenter: TodoListPresenter(
                                    interactor: TodoListInteractor()
                                )
                            )
                        )
                    } label: {
                        Text("TodoListへ")
                    }
                    NavigationLink {
                        TodoListView(
                            dependency: .init(
                                presenter: TodoListPresenter(
                                    interactor: MockTodoListInteractor()
                                )
                            )
                        )
                    } label: {
                        Text("モックデータ")
                    }
                }
            }
            .navigationTitle("Screen1")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
