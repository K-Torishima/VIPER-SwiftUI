//
//  Router.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/05/25.
//

import SwiftUI
 
@MainActor
final class Router {
    
    func makeDetailView(todo: Todo) -> some View {
        let presenter = DetailPresener(interactor: MockDataInteractorImpl())
        let detail = DetailView(todo: todo, presenter: presenter)
        return detail
    }
    
    @ViewBuilder
    func makeHogeView() -> some View {
        VStack {
            Text("hello")
        }
    }
}
