//
//  Route.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 31.01.2025.
//

import Foundation

enum Route {
    static let baseUrl = "https://jsonplaceholder.typicode.com"
    
    case post
    
    var description: String {
        switch self {
        case .post: return "/posts"
        }
    }
}
