//
//  Screen2.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/06/06.
//

import SwiftUI

// MARK: - 2
struct Screen2: View {
    
    private let mockData: [Todo] = [
        Todo(userId: 1, id: 1, title: "MockTodo1", completed: false),
        Todo(userId: 2, id: 2, title: "MockTodo1", completed: false)]
    
    @EnvironmentObject var routeEnvironment: RouteEnvironment
    
    var body: some View {
        VStack {
            List {
                // 画面は表示されるんだがデータ更新に対して画面が更新されない
                NavigationLink(value: Route.todoList) {
                    Text("todo List")
                }
                
                NavigationLink(value: Route.todoDetail(mockData[0])) {
                    Text("mock detail")
                }
                NavigationLink(value: Route.view3) {
                    Text("ただのからのView")
                }
            }
            .navigationTitle("Screen2")
            .navigation(path: $routeEnvironment.screen2Path)
            
        }
    }
}

