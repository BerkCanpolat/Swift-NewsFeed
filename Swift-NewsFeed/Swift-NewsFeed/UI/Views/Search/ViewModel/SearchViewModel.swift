//
//  SearchViewModel.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 3.02.2025.
//

import Foundation

protocol SearchViewModelInputProtocol {
    func fetchSearchNews(search:String)
}

protocol SearchViewModelOutPutProtocol: AnyObject {
    func didFetchSearchNews(searchNews: News, search: String)
    func didFetchSearchError(error: Error)
}

class SearchViewModel: SearchViewModelInputProtocol {
    weak var output: SearchViewModelOutPutProtocol?
    private let serviceManager: ServiceManagerProtocol
    
    init(serviceManager: ServiceManagerProtocol = ServiceManager.shared) {
        self.serviceManager = serviceManager
    }
    
    func fetchSearchNews(search:String) {
        serviceManager.getSearchNews(search: search) { result in
            switch result {
            case .success(let searchData):
                self.output?.didFetchSearchNews(searchNews: searchData, search: search)
            case .failure(let error):
                self.output?.didFetchSearchError(error: error)
            }
        }
    }
    
    
}
