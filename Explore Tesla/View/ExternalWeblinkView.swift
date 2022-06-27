//
//  ExternalWeblinkView.swift
//  Explore Tesla
//
//  Created by Mihael Ištvan on 13.05.2022..
//

import SwiftUI

struct ExternalWeblinkView: View {
    
    let car: Car
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Link(car.name, destination: (URL(string: car.link) ?? URL(string: "https://wikipedia.org"))!)
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundColor(.accentColor)
                
            }
        }
    }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
    static let cars: [Car] = Bundle.main.decode("cars.json")
    
    static var previews: some View {
        ExternalWeblinkView(car: cars[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
