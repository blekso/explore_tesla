//
//  Database+Extension.swift
//  Explore Tesla
//
//  Created by Mihael Ištvan on 22.06.2022..
//

import Foundation

extension UserDefaults {
    @objc var cars: [Car] {
        get {
            let decoder = JSONDecoder()
            var currentResponse = [Car]()
            
            do {
                guard let decoded = data(forKey: "cars")
                else {
                    return currentResponse
                }
                currentResponse = try decoder.decode([Car].self, from: decoded)
                
            }
            catch {
                return currentResponse
            }
            return currentResponse
        }
    }
}
