//
//  CityPin.swift
//  German City Viewer
//
//  Created by Jaron Hoste on 15/04/2020.
//  Copyright © 2020 Jaron Hoste. All rights reserved.
//

import SwiftUI
import MapKit

struct CityPin: View {
    var city: City
    
    
    func fetchCityLocations(_ city: [City]) {
      for city in cityData {
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        let annotations = MKPointAnnotation()
        annotations.title = city.name
        annotations.coordinate = CLLocationCoordinate2D(latitude:
            city.locationCoordinate.latitude, longitude: city.locationCoordinate.longitude)
        mapView.addAnnotation(annotations)
      }
    }
    
    var body: some View {
        
        HStack {
            city.image
//                .resizable()
//                .frame(width: 50, height: 50)
            Text(city.population)
            Spacer()
        }
        
    }
}

struct CityPin_Previews:
    PreviewProvider {
    static var previews: some View {
        Group {
            CityRow(city: cityData[1])
            CityRow(city: cityData[0])
        }
        .previewLayout(.fixed(width: 300, height: 70))

    }
}
