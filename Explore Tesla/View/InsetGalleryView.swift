//
//  InsetGalleryView.swift
//  Explore Tesla
//
//  Created by Mihael Ištvan on 12.05.2022..
//

import SwiftUI

struct InsetGalleryView: View {
    
    let car: Car
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 15) {
                ForEach(car.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }
            }
        }
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static let cars: [Car] =
        Bundle.main.decode("cars.json")
    
    static var previews: some View {
        InsetGalleryView(car: cars[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
