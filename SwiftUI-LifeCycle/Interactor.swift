//
//  Interactor.swift
//  SwiftUI-LifeCycle
//
//  Created by 鳥嶋 晃次 on 2023/05/23.
//

import Foundation

enum APIError {
    case error1
    case error2
    case noResponse
}


protocol DataInteractorProtocol {
    func getdata() async throws -> [Todo]
}

final class DataInteractorImpl: DataInteractorProtocol {
    
    let url: URL
    
    init(url: URL = URL(string: "https://jsonplaceholder.typicode.com/todos")!) {
        self.url = url
    }
    
    func getdata() async throws -> [Todo] {
        do {
            let (data, _ ) = try await URLSession.shared.data(from: url)
            let decodeData = try JSONDecoder().decode([Todo].self, from: data)
            return decodeData
            
        } catch {
            throw error
        }
    }
}

final class MockDataInteractorImpl: DataInteractorProtocol {
    
    func getdata() async throws -> [Todo] {
        do {
            let mock = try await mockData()
            return mock
        } catch {
            throw error
        }
    }

    private func mockData() async throws -> [Todo] {
        [Todo(userId: 1, id: 1, title: "one", completed: false),
         Todo(userId: 1, id: 1, title: "one", completed: false)]
    }
}
