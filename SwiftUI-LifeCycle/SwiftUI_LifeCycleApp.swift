//
//  SwiftUI_LifeCycleApp.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/05/23.
//

import SwiftUI

class RouteEnvironment: ObservableObject {
    // 全体のパスではなくタブごとにパスを作る
    @Published var screen1Path: [Route] = []
    @Published var screen2Path: [Route] = []
}

@main
struct SwiftUI_LifeCycleApp: App {
    
    @ObservedObject var routeEnvironment: RouteEnvironment = .init()
    @ObservedObject var screen4NavigationPath: Screen4NavigationPath = .init()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(routeEnvironment)
                .environmentObject(screen4NavigationPath)
        }
    }
}
