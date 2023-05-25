//
//  Presenter.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/05/23.
//

import Foundation
import SwiftUI
import Combine

// ViewでStateを監視しているけど、View以外のClassでViewを起点にStateを更新した場合、Stateを更新するとそのViewも更新されるのでViewに戻る
// onDisappearでStateを操作しない、そのStateを見ているViewに戻ってしまう
@MainActor
class DataPresenter {
    
    var state: StateValue
    var interactor: DataInteractorImpl
    var router: Router
    
    init(state: StateValue,
         interactor: DataInteractorImpl,
         roter: Router) {
        self.state = state
        self.interactor = interactor
        self.router = roter
    }
    
    func onAppear() {
        print("presenter onAppear")
    }
    
    func task() async throws {
        print("presenter task")
        try await load()
    }
    
    func onDisappear() {
        print("presenter onDisappear")
    }
    
    func gotoDetail(todo: Todo) -> some View {
        router.makeDetailView(todo: todo)
    }
    
    private func load() async throws {
        state.todos = []
        state.loadingState = .loading
        do {
            try await Task.sleep(nanoseconds: 1 * NSEC_PER_SEC)
            let datas = try await interactor.getdata()
            state.todos = datas
            state.loadingState = .complete
        } catch {
            print(error)
        }
    }
}
