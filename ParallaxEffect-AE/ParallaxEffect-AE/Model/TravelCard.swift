//
//  TravelCard.swift
//  ParallaxEffect-AE
//
//  Created by Abdalla El Najjar on 2023-09-14.
//

import Foundation

// Define a protocol with required properties
protocol CardItem: Identifiable {
    var image: String { get }
    var title: String { get }
    var subTitle: String { get }
}
struct TravelCard: CardItem {
    let id = UUID()
    let image: String
    let title: String
    let subTitle: String
}


var travelCards: [TravelCard] = [
    .init(image: "Pic1", title: "Toronto", subTitle: "Ontario"),
    .init(image: "Pic2", title: "Hamilton", subTitle: "Ontario"),
    .init(image: "Pic3", title: "London", subTitle: "Ontario"),
]
