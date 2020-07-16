//
//  CityRow.swift
//  German City Viewer
//
//  Created by Jaron Hoste on 13/04/2020.
//  Copyright © 2020 Jaron Hoste. All rights reserved.
//

import SwiftUI

struct CityRow: View {
//Define where the fetched data is coming from
@ObservedObject var fetcher = CityFetcher()
    //Creat a little card with image for each city
    var city: City
    var body: some View {
        
        HStack {
            city.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(city.name)
            Spacer()
        }
        
    }
}


