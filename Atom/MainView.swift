//
//  ContentView.swift
//  Atom
//
//  Created by Sam Quan on 12/28/20.
//

import SwiftUI

struct MainView: View {
    
    init() {
        UITabBar.appearance().barTintColor = .black
    }
    
    var body: some View {
        TabView {
            Movies().tabItem {
                Image(systemName: "film.fill")
                Text("Movies")
            }
            Theaters().tabItem {
                Image(systemName: "mappin.circle.fill")
                Text("Theaters")
            }
            News().tabItem {
                Image(systemName: "newspaper.fill")
                Text("News")
            }
            Trailers().tabItem {
                Image(systemName: "play.circle.fill")
                Text("Trailers")
            }
            Profile().tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("Profile")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
