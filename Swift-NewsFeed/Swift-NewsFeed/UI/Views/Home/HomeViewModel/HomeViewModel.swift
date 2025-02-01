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
    
    func testGetUser() {
        networkService.testRequest { [weak self] result in
            switch result {
            case .success(let data):
                self?.output?.didFetchData(data: data)
            case .failure(let error):
                self?.output?.didFetchErro(error: error)
            }
        }
    }
    
    
}
