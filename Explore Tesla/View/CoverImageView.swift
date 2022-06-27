//
//  CoverImageView.swift
//  Explore Tesla
//
//  Created by Mihael Ištvan on 12.05.2022..
//

import SwiftUI

struct CoverImageView: View {
    
    let coverImages: [CoverImage] =
        Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
