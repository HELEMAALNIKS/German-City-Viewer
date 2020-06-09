//
//  CityRow.swift
//  German City Viewer
//
//  Created by Jaron Hoste on 13/04/2020.
//  Copyright © 2020 Jaron Hoste. All rights reserved.
//

import SwiftUI

struct CityRow: View {
    
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

struct CityRow_Previews:
    PreviewProvider {
    static var previews: some View {
        Group {
            CityRow(city: cityData[1])
            CityRow(city: cityData[0])
        }
        .previewLayout(.fixed(width: 300, height: 70))

    }
}
