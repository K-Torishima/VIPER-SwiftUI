//
//  DetailView.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/05/25.
//

import SwiftUI

struct DetailView: View {
    
    let todo: Todo
    let presenter: DetailPresener
    
    init(todo: Todo,
         presenter: DetailPresener) {
        self.todo = todo
        self.presenter = presenter
    }
    
    var body: some View {
        VStack {
            Text("\(todo.userId)")
            Text("\(todo.id)")
            Text(todo.title)
            Text(String(todo.completed))
            
            NavigationLink {
                presenter.onhoge()
            } label: {
                Text("hogeView")
            }
        }
        .onAppear {
            presenter.onAppear()
        }
        .task {
            do {
                try await presenter.task()
            } catch {
                let _ = error
            }
        }
    }
}


@MainActor
class DetailPresener {
    
    var interactor: DataInteractorProtocol
    var router: Router = Router()
    
    init(interactor: DataInteractorProtocol) {
        self.interactor = interactor
    }
    
    func onAppear() {
        print("DetailPresener onAppear")
    }
    
    func task() async throws {
        let data = try await interactor.getdata()
        
        print(data.map { $0.title })
    }
    
    func onhoge() -> some View {
        router.makeHogeView()
    }
}
