//
//  Router.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/05/25.
//

import SwiftUI
 
final class Router {
    
    func makeDetailView(todo: Todo) -> some View {
        let detail = DetailView(todo: todo)
        return detail
    }
    
    @ViewBuilder
    func makeHogeView() -> some View {
        VStack {
            Text("hello")
        }
    }
}
