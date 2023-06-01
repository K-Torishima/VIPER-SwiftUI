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
                        Text("次の画面を表示")
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
                        Text("モックデータを差し込む")
                    }
                }
            }
            .navigationTitle("画面１")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
