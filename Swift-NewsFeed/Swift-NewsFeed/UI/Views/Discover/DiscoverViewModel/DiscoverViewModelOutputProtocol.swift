//
//  DiscoverViewModelOutputProtocol.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 3.02.2025.
//

import Foundation

protocol DiscoverViewModelOutputProtocol: AnyObject {
    func didFetchBusinessCategory(business: CategoryNews)
    func didFetchHealthCategory(healtH: CategoryNews)
    func didFetchScienceCategory(science: CategoryNews)
    func didFetchSportsCategory(sports: CategoryNews)
    func didFetchGeneralCategory(general: CategoryNews)
    func didFetchCategoryError(error: Error)
}
