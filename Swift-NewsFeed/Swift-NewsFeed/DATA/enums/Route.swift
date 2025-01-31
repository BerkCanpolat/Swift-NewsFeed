//
//  Route.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 31.01.2025.
//

import Foundation

enum Route {
    static let baseUrl = ""
    
    case test
    
    var description: String {
        switch self {
        case .test: return ""
        }
    }
}
