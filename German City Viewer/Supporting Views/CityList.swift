//
//  CityList.swift
//  German City Viewer
//
//  Created by Jaron Hoste on 13/04/2020.
//  Copyright © 2020 Jaron Hoste. All rights reserved.
//

import SwiftUI

struct CityList: View {
    var body: some View {
        NavigationView {
            List(cityData) { city in
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
