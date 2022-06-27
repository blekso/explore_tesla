//
//  Database.swift
//  MovieApp
//
//  Created by Mihael Ištvan on 22.06.2022..
//

import Foundation
import Combine

class Database {
    
    let defaults = UserDefaults.standard
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    func fetchAll() -> [Car] {
        var unarchivedCars : [Car] = []
        do {
            guard let decodedCars = defaults.data(forKey: "cars")
            else {
                return unarchivedCars
            }
            unarchivedCars = try decoder.decode([Car].self, from: decodedCars)
        }
        catch {}
        return unarchivedCars
    }
    
    func fetchFavoritesObservable() -> AnyPublisher<[Car], Never> {
        return defaults.publisher(for: \.cars).eraseToAnyPublisher()
    }
    
    func fetchFavoritesIds() -> [String] {
        return fetchFavorites().map({ return $0.id })
    }
    
    func fetchFavorites() -> [Car] {
        return fetchAll().filter({ $0.isFavourite == true })
    }
    
    func store(car : Car) {
        var unarchivedCars = fetchAll()
        
        unarchivedCars.append(car)
        do {
            let data = try encoder.encode(unarchivedCars)
            defaults.set(data, forKey: "cars")
        }
        catch{}
    }
    
    func storeAll(cars : [Car]) {
        do {
            let data = try encoder.encode(cars)
            defaults.set(data, forKey: "cars")
        }
        catch{}
    }
    
    func remove(car : Car) {
        storeAll(cars: fetchAll().filter({ $0.id != car.id }))
    }
    
    func removeByID(id : String) {
        storeAll(cars: fetchAll().filter({ $0.id != id }))
    }
    
}
