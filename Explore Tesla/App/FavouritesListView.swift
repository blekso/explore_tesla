//
//  VideoListView.swift
//  Explore Tesla
//
//  Created by Mihael Ištvan on 12.05.2022..
//

import SwiftUI
import Combine

struct FavouritesListView: View {
    
    let persistance = Database()
    @State var favouriteCars: [Car] = []
    @State var disposebag = Set<AnyCancellable>()

    var body: some View {
        NavigationView {
            if favouriteCars.isEmpty {
                Text("You have no favorite Tesla")
            } else {
                List {
                    ForEach(favouriteCars) { car in
                        NavigationLink(destination: CarDetailView(car: car)) {
                            CarListItemView(car: car)
                        }
                    }
                }
                .navigationBarTitle("Favorite cars", displayMode: .large)
                
            }
        }.onAppear {
            setupObservable()
        }
        .onDisappear() {
            disposebag.removeAll()
        }
    }
    
    func setupObservable() {
        persistance.fetchFavoritesObservable()
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: RunLoop.main)
            .sink { cars in
                print("observed: \(cars)")
                favouriteCars = cars
            }
            .store(in: &disposebag)
    }
    
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesListView()
    }
}
