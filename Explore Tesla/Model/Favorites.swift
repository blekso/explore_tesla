//
//  Favorites.swift
//  Explore Tesla
//
//  Created by Mihael Ištvan on 04.06.2022..
//

import Foundation

class Favorites: ObservableObject {
    private var cars: Set<String>
    private let saveKey = "Favorites"
    
    init() {
        // load data
        cars = []
    }
    
    func contains(_ car: Car) -> Bool {
        cars.contains(car.id)
    }
    
    func add(_ car: Car){
        objectWillChange.send()
        cars.insert(car.id)
        save()
    }
    
    func remove(_ car: Car){
        objectWillChange.send()
        cars.remove(car.id)
        save()
    }
    
    func save() {
        // save data
    }
}
