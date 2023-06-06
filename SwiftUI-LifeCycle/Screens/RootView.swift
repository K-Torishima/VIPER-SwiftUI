//
//  ContentView.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/05/23.
//

import SwiftUI

struct RootView: View {
    
    @State var selectedTab: Tabs = .screen1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Screen1()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("screen1")
                }
                .tag(Tabs.screen1)
            Screen2()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("screen2")
                }
                .tag(Tabs.screen2)
            Screen3()
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("screen3")
                }
                .tag(Tabs.screen3)
            Screen4()
                .tabItem {
                    Image(systemName: "4.circle")
                    Text("screen4")
                }
                .tag(Tabs.screen4)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
