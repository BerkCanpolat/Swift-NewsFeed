//
//  DiscoverViewModelOutputProtocol.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 3.02.2025.
//

import Foundation

protocol DiscoverViewModelOutputProtocol: AnyObject {
    func didFetchBusinessCategory(business: News)
    func didFetchHealthCategory(healtH: News)
    func didFetchScienceCategory(science: News)
    func didFetchSportsCategory(sports: News)
    func didFetchGeneralCategory(general: News)
    func didFetchCategoryError(error: Error)
}
