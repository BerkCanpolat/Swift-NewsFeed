//
//  HomeProtocolOutPut.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 1.02.2025.
//

import Foundation

protocol HomeProtocolOutPut: AnyObject {
    func didFetchData(data: [PostModel])
    func didFetchErro(error: Error)
}
