//
//  InsetFactViwe.swift
//  Explore Tesla
//
//  Created by Mihael Ištvan on 13.05.2022..
//

import SwiftUI

struct InsetFactView: View {
    
    let car: Car
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(car.fact, id: \.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(idealWidth: 168, minHeight: 148, maxHeight: 180)
        }
    }
}

struct InsetFactViwe_Previews: PreviewProvider {
    
    static let cars: [Car] = Bundle.main.decode("cars.json")
    
    static var previews: some View {
        InsetFactView(car: cars[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
