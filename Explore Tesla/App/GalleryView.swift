//
//  GalleryView.swift
//  Explore Tesla
//
//  Created by Mihael Ištvan on 12.05.2022..
//

import SwiftUI
import Alamofire

class GalleryViewModel : ObservableObject {
    var cars: [Car] = []
    
    func setCars(_ newValue : [Car]) {
        self.cars = newValue
        self.objectWillChange.send()
    }
}


struct GalleryView: View {
    
    @State private var selectedCar: String = "models"
    
    @StateObject private var contentVM = ContentViewModel()
    
    func getCars(){
        let url = URL(string: "https://pastebin.com/raw/Ria7qywd")!
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
      
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 30) {
                
                Image(selectedCar)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 1))
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: {
                        value in gridSwitch()
                    })
                    
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                    ForEach(contentVM.cars) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedCar = item.image
                        }
                    }
                }
                .animation(.easeIn)
                .onAppear {
                    gridSwitch()
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear() {
            if(contentVM.cars.count == 0){
                getCars()
            }
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
