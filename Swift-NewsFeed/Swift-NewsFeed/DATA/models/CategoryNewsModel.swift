//
//  CategoryNewsModel.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 3.02.2025.

import Foundation

// MARK: - CategoryNews
struct CategoryNews: Codable {
    let status: String
    let sources: [SourceCategory]?
}

// MARK: - Source
struct SourceCategory: Codable {
    let id, name, description: String?
    let url: String?
    let category: String?
    let language, country: String?
}
