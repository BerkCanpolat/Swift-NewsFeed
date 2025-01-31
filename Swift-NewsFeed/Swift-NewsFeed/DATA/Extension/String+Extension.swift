//
//  String+Extension.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 31.01.2025.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
