//
//  ApiResponse.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 1.02.2025.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: String
    let totalResults: Int
    let articles: [T]?
}
