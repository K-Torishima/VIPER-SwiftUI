//
//  SampleScreens.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/06/05.
//

import SwiftUI

struct Screen1View: View {
    
    struct Dependency {
        let presenter: Screen1PresenterProtocol
    }
    
    let dependency: Dependency!
    
    init(dependency: Dependency) {
        self.dependency = dependency
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    NavigationLink {
                        dependency.presenter.routing(view: .todoList)
                    } label: {
                        Text("TodoListを表示")
                    }
                    NavigationLink {
                        dependency.presenter.routing(view: .hoge)
                    } label: {
                        Text("空のViewを表示")
                    }
                    NavigationLink {
                        dependency.presenter.routing(view: .huga)
                    } label: {
                        Text("Fuga")
                    }
                }
            }
            .navigationTitle("Screen1")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
