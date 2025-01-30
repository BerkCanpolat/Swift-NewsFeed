//
//  MockData.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 30.01.2025.
//

import Foundation

struct MockData {
    let image:String
    let description:String
    let secondImage:String
    let secondImageTitle:String
}

let oneMoc = [
    MockData(image: "one", description: "lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsum", secondImage: "two", secondImageTitle: "CNN News"),
    MockData(image: "two", description: "lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsum", secondImage: "three", secondImageTitle: "USA Today"),
    MockData(image: "three", description: "lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsum", secondImage: "four", secondImageTitle: "NBC News"),
    MockData(image: "four", description: "lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsum", secondImage: "one", secondImageTitle: "Brooklyn Simmons"),
]

let twoMoc = [
    MockData(image: "four", description: "lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsum", secondImage: "four", secondImageTitle: "USA Today"),
    MockData(image: "three", description: "lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsum", secondImage: "one", secondImageTitle: "NBC News"),
    MockData(image: "two", description: "lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsum", secondImage: "three", secondImageTitle: "CNN News"),
    MockData(image: "one", description: "lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsum", secondImage: "two", secondImageTitle: "Brooklyn Simmons"),
]
