//
//  ContentView.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/05/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var state = StateValue()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink {
                        NextView(
                            presenter: DataPresenter(
                                state: state,
                                interactor: DataInteractorImpl(),
                                roter: Router()
                            )
                        )
                    } label: {
                        Text("次の画面を表示")
                    }
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Text("EmptyView")
                    }
                }
            }
            .navigationTitle("画面１")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
