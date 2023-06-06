//
//  Screen1PresenterProtocol.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/06/06.
//

import SwiftUI

@MainActor
protocol Screen1PresenterProtocol {
    var state: Screen1StateValue { get }
    func onAppear()
    func task() async throws
    func onDisappear()
    
    func routing(view: Views) -> AnyView
}



