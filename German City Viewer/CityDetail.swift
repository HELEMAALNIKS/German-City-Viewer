//
//  ContentView.swift
//  German City Viewer
//
//  Created by Jaron Hoste on 13/04/2020.
//  Copyright © 2020 Jaron Hoste. All rights reserved.
//

import SwiftUI

struct CityDetail: View {
    var city: City

    var body: some View {
        ScrollView() {
            VStack {
                //Load MapView function
                MapView(coordinate: city.locationCoordinate)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 300)
                //Load CircleImage function
                CircleImage(image: city.image)
                    .offset(x: 0, y: -130)
                    .padding(.bottom, -130)
                VStack(alignment: .leading) {
                    Text(city.name)
                        .font(.title)
                    HStack(alignment: .top) {
                        Text("Aantal inwoners:")
                            .font(.subheadline)
                        Text(city.population)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                    Text(city.state)
                    .font(.subheadline)
                    //Load About function
                    About()
                    .frame(height: 300)
                }
                .padding()
                List{
                    MapView(coordinate: city.locationCoordinate)
                }
                Spacer()
            }
        }
        .navigationBarTitle(Text(city.name), displayMode: .inline)
    }
}
//
//struct CityDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        CityDetail(city: cityData[0])
//    }
//}
