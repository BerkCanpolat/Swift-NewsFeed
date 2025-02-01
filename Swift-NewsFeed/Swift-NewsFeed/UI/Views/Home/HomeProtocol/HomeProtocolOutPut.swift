//
//  HomeProtocolOutPut.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 1.02.2025.
//

import Foundation

protocol HomeProtocolOutPut: AnyObject {
    func didFetchData(data: News)
    func didFetchBbcData(data: News)
    func didFetchErro(error: Error)
}
