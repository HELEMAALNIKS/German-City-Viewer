//
//  CityMap.swift
//  German City Viewer
//
//  Created by Jaron Hoste on 13/04/2020.
//  Copyright © 2020 Jaron Hoste. All rights reserved.
//

import SwiftUI
import MapKit

struct CityMap: UIViewRepresentable {
    var mapView: MKMapView!
    
  var locationManager = CLLocationManager()
  func setupManager() {
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.requestAlwaysAuthorization()
  }
    
    
  
  func makeUIView(context: Context) -> MKMapView {
    setupManager()
    let mapView = MKMapView(frame: UIScreen.main.bounds)
    mapView.showsUserLocation = true
    mapView.userTrackingMode = .follow
    
    for city in cityData {
        let annotations = MKPointAnnotation()
        annotations.title = city.name
        annotations.coordinate = CLLocationCoordinate2D(latitude:
            city.locationCoordinate.latitude, longitude: city.locationCoordinate.longitude)
            mapView.addAnnotation(annotations)
        }
    return mapView
  }
    
  func updateUIView(_ uiView: MKMapView, context: Context) {
    let location = CLLocationCoordinate2D(latitude: 51.2836, longitude: 10.2456)
      let span = MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
      let region = MKCoordinateRegion(center: location, span: span)
      uiView.setRegion(region, animated: true)
  }
}


struct CityMap_Previews: PreviewProvider {
  static var previews: some View {
    CityMap()
  }
}
