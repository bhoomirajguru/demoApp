//
//  Posts.swift
//  DemoApp
//
//  Created by Apple on 28/05/24.
//

import Foundation

struct Post: Identifiable, Codable {
    let id: Int
    let title: String
    let body: String
}
