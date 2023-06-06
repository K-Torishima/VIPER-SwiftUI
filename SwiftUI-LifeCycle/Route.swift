//
//  Route.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/06/06.
//

import Foundation

enum Route: Hashable {
    case todoList
    case todoDetail(Todo)
    case view3
}

enum Screen4Router: Hashable {
    case park(Park)
    case fruits(Fruits)
    case none
}

enum Tabs {
    case screen1
    case screen2
    case screen3
    case screen4
}
