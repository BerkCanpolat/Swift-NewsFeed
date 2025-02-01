//
//  HomeProtocolInput.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 1.02.2025.
//

import Foundation

protocol HomeProtocolInput: AnyObject {
    func fetchTopHeadlines()
    func fetchBBCNews()
}
