//
//  Screen4.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/06/06.
//

import SwiftUI

fileprivate let parkList: [Park] = [.init(name: "メリケンパーク"),
                                    .init(name: "万博記念公園"),
                                    .init(name: "奈良公園")]

fileprivate let fruitsList: [Fruits] =  [.init(name: "スイカ"),
                                         .init(name: "みかん"),
                                         .init(name: "りんご")]

final class Screen4NavigationPath: ObservableObject {
    @Published var path = NavigationPath()
}

struct Screen4: View {
    
    @EnvironmentObject var screen4path: Screen4NavigationPath
    
    var body: some View {
        NavigationStack(path: $screen4path.path) {
            List {
                Section("Fruits List") {
                    ForEach(fruitsList) { fruits in
                        NavigationLink(value: Screen4Router.fruits(fruits)) {
                            Text(fruits.name)
                        }
                    }
                }
                
                Section("Park List") {
                    ForEach(parkList) { park in
                        NavigationLink(value: Screen4Router.park(park)) {
                            Text(park.name)
                        }
                    }
                }
                Section {
                    NavigationLink(value: Screen4Router.none) {
                        Text("Todo List View")
                    }
                }
            }
            .navigationTitle("Fruits Park")
            .navigationDestination(for: Screen4Router.self) { route in
                switch route {
                case let .fruits(fruits):
                    Screen4ChaildView(text: fruits.name)
                case let .park(park):
                    Screen4ChaildView(text: park.name)
                case .none:
                    EmptyView()
                }
            }
        }
        .environmentObject(screen4path)
    }
}
