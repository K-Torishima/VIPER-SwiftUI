//
//  TodoListInteractorProtocol.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/06/01.
//

import Foundation

protocol TodoListInteractorProtocol {
    func getdata() async throws -> [Todo]
}
