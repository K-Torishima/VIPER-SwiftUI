//
//  Screen3.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/06/06.
//

import SwiftUI

struct Screen3: View {
    
    @State private var fruitsPath: [Fruits] = []
    
    let datas: [Fruits] = [Fruits(name: "りんご"),
                           Fruits(name: "みかん"),
                           Fruits(name: "パイナップル")]
    
    var body: some View {
        NavigationStack(path: $fruitsPath) {
            List(datas) { data in
                NavigationLink(data.name, value: data)
            }
            .navigationTitle("Screen3")
            .navigationDestination(for: Fruits.self) { value in
                ChildView(text: value.name)
            }
            
            Button {
                fruitsPath = [Fruits(name: "なし")]
            } label: {
                Text("Next")
            }
        }
        .onChange(of: fruitsPath) { newValue in
            print(fruitsPath)
        }
        .onAppear {
            showFruits()
        }
    }
    
    func showFruits() {
        fruitsPath = [.init(name: "なし"), .init(name: "スイカ")]
    }
}

