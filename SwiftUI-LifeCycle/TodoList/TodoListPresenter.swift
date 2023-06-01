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
class TodoListPresenter: TodoListPresenterProtocol {
    
    let state: TodoListStateValue = TodoListStateValue()
    private let interactor: TodoListInteractorProtocol

    init(interactor: TodoListInteractorProtocol) {
        self.interactor = interactor
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
