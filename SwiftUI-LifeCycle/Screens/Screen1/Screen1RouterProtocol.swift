//
//  Screen1RouterProtocol.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/06/06.
//

import SwiftUI

@MainActor
protocol Screen1RouterProtocol: AnyObject {
    func goToTodoList() -> AnyView
    func goTohogeView() -> AnyView
    
    @ViewBuilder
    func sampleView() -> AnyView
}
