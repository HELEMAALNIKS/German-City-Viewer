//
//  ContentView.swift
//  German City Viewer
//
//  Created by Jaron Hoste on 13/04/2020.
//  Copyright © 2020 Jaron Hoste. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        //This defines all the buttons on the bottom screen
        TabView(selection: $selection){
            //Show CityList with name and icon
            CityList()
                .tabItem {
                    VStack {
                        Image(systemName:"list.bullet")
                        Text("List")
                    }
                }
                .tag(0)
            //Show CityMap with name and icon
            CityMap()
                .edgesIgnoringSafeArea(.all)
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName:"map.fill")
                        Text("Map")
                    }
                }
                .tag(1)
            //Show About with name and icon
            About()
                .tabItem {
                    VStack {
                        Image(systemName:"info.circle.fill")
                        Text("About")
                    }
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
