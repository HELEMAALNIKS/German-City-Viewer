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
    //Define where the fetched data is coming from
    @ObservedObject var fetcher = CityFetcher()
    var city: City
    
    
    func fetchCityLocations(_ city: [City]) {
        //Loop trough all the cities in the JSON file and place the coordinates with pins on the map
        for city in fetcher.cities {
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        let annotations = MKPointAnnotation()
        //Define annotations
        annotations.title = city.name
        annotations.coordinate = CLLocationCoordinate2D(latitude:
            city.locationCoordinate.latitude, longitude: city.locationCoordinate.longitude)
        mapView.addAnnotation(annotations)
      }
    }
    
    var body: some View {
        
        HStack {
            city.image
            Text(city.population)
            Spacer()
        }
        
    }
}
