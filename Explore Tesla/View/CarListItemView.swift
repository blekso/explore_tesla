//
//  AnimalListItemView.swift
//  Explore Tesla
//
//  Created by Mihael Ištvan on 12.05.2022..
//

import SwiftUI

struct CarListItemView: View {
    
    let car: Car
    
    var body: some View {
      HStack(alignment: .center, spacing: 16) {
        Image(car.image)
          .resizable()
          .scaledToFill()
          .frame(width: 90, height: 90)
          .clipShape(
            RoundedRectangle(cornerRadius: 12)
          )
        
        VStack(alignment: .leading, spacing: 8) {
          Text(car.name)
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundColor(.accentColor)
          
          Text(car.headline)
            .font(.footnote)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
            .padding(.trailing, 8)
        }
      }
    }
}

struct CarListItemView_Previews: PreviewProvider {
    static let cars: [Car] =
        Bundle.main.decode("cars.json")
    
    static var previews: some View {
        CarListItemView(car: cars[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
