//
//  ContentView.swift
//  Explore Tesla
//
//  Created by Mihael Ištvan on 12.05.2022..
//

import SwiftUI
import Alamofire

class ContentViewModel : ObservableObject {
    var cars: [Car] = []
    
    func setCars(_ newValue : [Car]) {
        self.cars = newValue
        self.objectWillChange.send()
    }
}


struct ContentView: View {
    
    @StateObject private var contentVM = ContentViewModel()
    
    func getCars(){
        let url = URL(string: "https://pastebin.com/raw/P9HtKkcS")!
        AF.request(url)
            .validate()
            .responseDecodable(of: [Car].self) { [self](response) in
                guard let data = response.data else {
                    return
                }
                do {
                    let cars = try JSONDecoder().decode([Car].self, from: data)
                    contentVM.setCars(cars)
                } catch let decoderError {
                    print("error: \(decoderError)")
                }
            }
    }
    
    var body: some View {
        
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(contentVM.cars) { car in
                    Section {
                        NavigationLink(destination: CarDetailView(car: car)) {
                            CarListItemView(car: car)
                        }
                    }
                }
            }
            .navigationBarTitle("Explore Tesla", displayMode: .large)
        }
        .onAppear() {
            if(contentVM.cars.count == 0){
                getCars()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
