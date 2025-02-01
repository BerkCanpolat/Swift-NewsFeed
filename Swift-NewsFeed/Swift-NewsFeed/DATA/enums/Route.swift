//
//  Route.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 31.01.2025.
//

import Foundation

enum Route {
    static let baseUrl = "https://newsapi.org/v2"
    static let apiKey = "984763387f2844a7b48bccad0f7fabe0"
    case topHeadlines(country:String)
//https://newsapi.org/v2/top-headlines?country=us&apiKey=984763387f2844a7b48bccad0f7fabe0
    var description: String {
        switch self {
        case .topHeadlines(country: let country):
            return "/top-headlines?country=\(country)&apiKey=\(Route.apiKey)"
        }
    }
}
