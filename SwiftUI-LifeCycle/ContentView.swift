//
//  ContentView.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/05/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    var body: some View {
        NavigationView {
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
                                    interactor: TodoListInteractor()
                                )
                            )
                        )
                    } label: {
                        Text("モックデータ")
                    }
                }
            }
            .navigationTitle("画面1")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
