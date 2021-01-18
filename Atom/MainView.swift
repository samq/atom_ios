//
//  ContentView.swift
//  Atom
//
//  Created by Sam Quan on 12/28/20.
//

import SwiftUI

enum Tab {
    case movies, theaters, news, trailers, profile
}

// MainView for Atom Application
struct MainView: View {
    @State private var currentTab: Tab = Tab.movies
    
    init() {
        // Adjust TabView color
        UITabBar.appearance().barTintColor = .black
    }
    
    var body: some View {
        // TabView - Tab Navigation across multiple views
        // Application comprise of five tabs - Movies, Theaters, News, Trailers, and User Profile
        TabView(selection: $currentTab) {
            Movies().tabItem {
                Image(systemName: "film.fill")
                Text("Movies")
            }
            .tag(Tab.movies)
            Theaters().tabItem {
                Image(systemName: "mappin.circle.fill")
                Text("Theaters")
            }
            .tag(Tab.theaters)
            News().tabItem {
                Image(systemName: "newspaper.fill")
                Text("News")
            }
            .tag(Tab.news)
            Trailers().tabItem {
                Image(systemName: "play.circle.fill")
                Text("Trailers")
            }
            .tag(Tab.trailers)
            Profile().tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("Profile")
            }
            .tag(Tab.profile)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
