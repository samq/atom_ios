//
//  ContentView.swift
//  Atom
//
//  Created by Sam Quan on 12/28/20.
//

import SwiftUI

// MainView for Atom Application
struct MainView: View {
    
    init() {
        // Adjust TabView color
        UITabBar.appearance().barTintColor = .black
    }
    
    var body: some View {
        // Main NavigationView - Handles user navigation across multiple views
        NavigationView {
            // TabView - Tab Navigation across multiple views
            // Application comprise of five tabs - Movies, Theaters, News, Trailers, and User Profile
            TabView {
                Movies().tabItem {
                    Image(systemName: "film.fill")
                    Text("Movies")
                }
                .navigationBarHidden(true)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
