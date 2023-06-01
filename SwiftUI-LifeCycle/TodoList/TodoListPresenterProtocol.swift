//
//  PresenterProtocol.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/06/01.
//

import SwiftUI

@MainActor
protocol TodoListPresenterProtocol {
    var state: TodoListStateValue { get }
    func onAppear()
    func task() async throws
    func onDisappear()
}
