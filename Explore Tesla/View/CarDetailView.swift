//
//  CarDetailView.swift
//  Explore Tesla
//
//  Created by Mihael Ištvan on 12.05.2022..
//

import SwiftUI

struct CarDetailView: View {
    
    var car: Car
    @State var isFavourite: Bool
    let persistance = Database()
    
    init(car: Car) {
        let results = persistance.fetchFavorites().filter({ $0.id == car.id })
        if results.isEmpty {
            self.car = car
        }
        else {
            self.car = results[0]
        }
        isFavourite = self.car.isFavourite
    }
    
    var columns: [GridItem] = [
        GridItem(.fixed(30), spacing: 10),
        GridItem(.fixed(160), spacing: 10)
    ]
    
    func favouriteToggle() {
        car.isFavourite.toggle()
        isFavourite.toggle()
        persistance.removeByID(id: car.id)
        print(car)
        if isFavourite {
            persistance.store(car: car)
            print("favorite clicked, favorite? \(car.isFavourite)), id=\(car.id)")
        }
        
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                Image(car.image)
                    .resizable()
                    .scaledToFit()
                
                Text(car.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                Text(car.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                LazyVGrid(
                    columns: columns
                ) {
                    Button(action: {
                        favouriteToggle()
                    }, label: {
                        if(!isFavourite){
                            Image(systemName: "star")
                        } else {
                            Image(systemName: "star.fill")
                        }
                        
                    })
                    
                    Text("Favorite")
                        .font(.largeTitle)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.accentColor)
                        .padding(.horizontal)
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Photo gallery")
                    
                    InsetGalleryView(car: car)
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Main features")
                    InsetFactView(car: car)
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(car.name)")
                    
                    Text(car.carDescription)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }.padding(.horizontal)
                
                Group {
                    HeadingView(headingImage: "map", headingText: "Car dealers")
                    InsetMapView()
                }
                .padding(.horizontal)
                
                Group{
                    HeadingView (headingImage: "books.vertical", headingText:
                                    "Learn More")
                    ExternalWeblinkView(car: car)
                }
                .padding (.horizontal)
                
                
            }
            .navigationBarTitle("Learn about \(car.name)",
                                displayMode: .inline)
        }
    }
}

struct CarDetailView_Previews: PreviewProvider {
    static let cars: [Car] = Bundle.main.decode("cars.json")
    
    
    static var previews: some View {
        NavigationView {
            CarDetailView(car: cars[0])
        }
    }
}
