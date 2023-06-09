//
//  DetailView.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/05/25.
//

import SwiftUI

struct DetailView: View {
    
    let todo: Todo
    
    init(todo: Todo) {
        self.todo = todo
    }
    
    var body: some View {
        VStack {
            Text("\(todo.userId)")
            Text("\(todo.id)")
            Text(todo.title)
            Text(String(todo.completed))
            
            NavigationLink {
            } label: {
                Text("hogeView")
            }
            
        }
    }
}
