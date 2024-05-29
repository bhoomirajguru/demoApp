//
//  APIService.swift
//  DemoApp
//
//  Created by Apple on 28/05/24.
//

import Foundation

import Combine

class ApiService {
    private var cancellables = Set<AnyCancellable>()
    private let baseURL = "https://jsonplaceholder.typicode.com/posts"

    func fetchPosts(page: Int, limit: Int = 20) -> AnyPublisher<[Post], Error> {
        let url = URL(string: "\(baseURL)?_page=\(page)&_limit=\(limit)")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
