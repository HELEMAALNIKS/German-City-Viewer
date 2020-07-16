//
//  CityList.swift
//  German City Viewer
//
//  Created by Jaron Hoste on 13/04/2020.
//  Copyright © 2020 Jaron Hoste. All rights reserved.
//

import SwiftUI

import Foundation
import Combine


struct CityList: View {
    //Define where the fetched data is coming from
    @ObservedObject var fetcher = CityFetcher()
    var body: some View {
        NavigationView {
            //Loop trough cities and display them in a list
            List(fetcher.cities) { city in
                NavigationLink(destination: CityDetail(city: city)) {
                    CityRow(city: city)
                }
            }
        .navigationBarTitle(Text("German City Viewer"))
        }
    }
}

struct CityList_Previews: PreviewProvider {
    static var previews: some View {
        CityList()
    }
}
