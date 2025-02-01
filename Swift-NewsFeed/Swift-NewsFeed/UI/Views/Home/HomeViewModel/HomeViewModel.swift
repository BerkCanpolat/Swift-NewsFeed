//
//  HomeViewModel.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 1.02.2025.
//

import Foundation

class HomeViewModel: HomeProtocolInput {
    
    
    
    weak var output: HomeProtocolOutPut?
    private let networkService: ServiceManagerProtocol
    
    init(networkService: ServiceManagerProtocol = ServiceManager.shared) {
        self.networkService = networkService
    }
    
    func fetchTopHeadlines() {
        networkService.getTopHeadlines { [weak self] result in
            switch result {
            case .success(let data):
                self?.output?.didFetchData(data: data)
            case .failure(let error):
                self?.output?.didFetchErro(error: error)
            }
        }
    }
    
    func fetchBBCNews() {
        networkService.fetBBCNews { [weak self] result in
            switch result {
            case .success(let data):
                self?.output?.didFetchBbcData(data: data)
            case .failure(let error):
                print("BBC News verisi alınırken hata: \(error)")
                self?.output?.didFetchErro(error: error)
            }
        }
    }
    
    
}
