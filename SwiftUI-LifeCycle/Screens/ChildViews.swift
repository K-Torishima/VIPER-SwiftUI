//
//  ChildView.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/06/06.
//

import SwiftUI

// 適当にテキストを表示させるだけのView
struct ChildView: View {

    var text: String

    var body: some View {
        VStack {
            Text(text)
        }
    }
}

struct Screen4ChaildView: View {
    
    @EnvironmentObject var screen4path: Screen4NavigationPath

    var text: String
    
    var body: some View {
        VStack {
            Text(text)
            
            Button("戻る") {
                screen4path.path.removeLast()
            }
        }
        .onAppear {
            print("path", screen4path.path)
        }
    }
}
