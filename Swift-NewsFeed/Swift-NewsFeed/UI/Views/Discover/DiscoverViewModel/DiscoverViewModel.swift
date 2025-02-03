//
//  DiscoverViewModel.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 3.02.2025.
//

import Foundation

class DiscoverViewModel: DiscoverViewModelInputProtocol {
    
    var businessCategory: [Article] = []
    var healthCategory: [Article] = []
    var scienceCategory: [Article] = []
    var sportsCategory: [Article] = []
    var generalCategory: [Article] = []
    
    weak var output: DiscoverViewModelOutputProtocol?
    private let serviceManager: ServiceManagerProtocol
    
    init(serviceManager: ServiceManagerProtocol = ServiceManager.shared) {
        self.serviceManager = serviceManager
    }
    
    func fetchCategoryBusiness() {
        serviceManager.getCategoriesBusiness { result in
            switch result {
            case .success(let category):
                self.businessCategory = category.articles ?? []
                self.output?.didFetchBusinessCategory(business: category)
            case .failure(let error):
                self.output?.didFetchCategoryError(error: error)
            }
        }
    }
    
    func fetchCategoryHealth() {
        serviceManager.getCategoriesHealth { result in
            switch result {
            case .success(let healt):
                self.healthCategory = healt.articles ?? []
                self.output?.didFetchHealthCategory(healtH: healt)
            case .failure(let error):
                self.output?.didFetchCategoryError(error: error)
            }
        }
    }
    
    func fetchCategoryScience() {
        serviceManager.getCategoriesSciense { result in
            switch result {
            case .success(let science):
                self.scienceCategory = science.articles ?? []
                self.output?.didFetchScienceCategory(science: science)
            case .failure(let error):
                self.output?.didFetchCategoryError(error: error)
            }
        }
    }
    
    func fetchCategorySports() {
        serviceManager.getCategoriesSports { result in
            switch result {
            case .success(let sports):
                self.sportsCategory = sports.articles ?? []
                self.output?.didFetchSportsCategory(sports: sports)
            case .failure(let error):
                self.output?.didFetchCategoryError(error: error)
            }
        }
    }
    
    func fetchCategoryGeneral() {
        serviceManager.getCategoriesGeneral { result in
            switch result {
            case .success(let general):
                self.generalCategory = general.articles ?? []
                self.output?.didFetchGeneralCategory(general: general)
            case .failure(let error):
                self.output?.didFetchCategoryError(error: error)
            }
        }
    }
    
    
}
