//
//  AnimalModel.swift
//  Explore Tesla
//
//  Created by Mihael Ištvan on 12.05.2022..
//

import SwiftUI

class Car: NSObject, Codable, Identifiable, ObservableObject {
    
    let id: String
    let name: String
    let headline: String
    let carDescription: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
    var isFavourite: Bool
    
    init(id: String, name: String, headline: String, carDescription: String, link: String, image: String, gallery: [String], fact: [String], isFavourite: Bool) {
        self.id = id
        self.name = name
        self.headline = headline
        self.carDescription = carDescription
        self.link = link
        self.image = image
        self.gallery = gallery
        self.fact = fact
        self.isFavourite = isFavourite
    }
    
    enum CodingKeys: String, CodingKey {
            case carDescription = "description"
        case id, name,headline, link, image, gallery, fact, isFavourite
        }
    
}

