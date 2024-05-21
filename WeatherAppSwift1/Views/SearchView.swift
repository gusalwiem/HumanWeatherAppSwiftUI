//
//  SearchView.swift
//  WeatherAppSwift1
//
//  Created by Emy Alwin on 2024-02-19.
//

import SwiftUI

struct SearchView: View {
    @State private var lat: String = ""
    @State private var lon: String = ""
        
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                Image(systemName: "sun.max.fill")
                    .symbolRenderingMode(.multicolor)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                Spacer()
                Text("Latitude:")
                TextField("XX.XXXX", text: $lat).textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Longitude:")
                TextField("XX.XXXX", text: $lon).textFieldStyle(RoundedBorderTextFieldStyle())
                NavigationLink(destination: WeatherView(lat: lat, lon: lon)){
                    Text("Update")
                }.padding(10)
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("Set input")
        }
    }
}
