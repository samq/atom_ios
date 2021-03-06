//
//  News.swift
//  Atom
//
//  Created by Sam Quan on 12/30/20.
//

import SwiftUI

struct News: View {
    @State private var selectedSection = 0
    
    // Sections Constants
    private let sections = ["Features", "Calendar"]
    // UIColor (RGBA) - Atom Tickets Theme
    private let ATOM_BLUE = UIColor(red: 52/255.0, green: 152/255.0, blue: 219/255.0, alpha: 1)
    
    init() {
        // Customizes Picker (SegmentedPickerStyle)
        // Background Color / Selected Color / Foreground (Normal and Selected)
        UISegmentedControl.appearance().backgroundColor = .black
        UISegmentedControl.appearance().selectedSegmentTintColor = .black
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: ATOM_BLUE], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HStack {
                    Text("News")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                .padding()
                
                // Picker - Features / Calendar
                Picker("", selection: $selectedSection) {
                    ForEach(0 ..< sections.count) {
                        Text("\(sections[$0])")
                    }
                }
                // SegmentedPickerStyle - "Tab"
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                // Show section that corresponds to one chosen in Picker - Features / Calendar
                ScrollView {
                    switch(sections[selectedSection]) {
                        case "Features": Features()
                        default: Calendar()
                    }
                }
           }
            .navigationBarHidden(true)
            .background(Color.black)
            .foregroundColor(.white)
        }
    }
}

struct Features: View {
    var body: some View {
        ForEach(0 ..< 8) { _ in
            FeaturesCard()
        }
    }
}

struct FeaturesCard: View {
    var body: some View {
        VStack {
            // Picture
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            // Title
            Text("Lorem ipsum dolor sit amet")
                .font(.system(size: 24))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                .padding(.vertical, 8)
            // Summary
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
            // Read More
            Text("Read More")
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .padding(.vertical, 8)
        }
        .padding()
        .border(Color.gray)
    }
}

struct Calendar: View {
    // MovieService Object - Provides information about movies
    @ObservedObject var moviesService = MoviesService.getMoviesService()
    
    private var columns = [GridItem(.flexible())]
    
    var body: some View {
        // Lazy Loading
        LazyVGrid(columns: columns) {
            // TODO: Sort by Date
            ForEach(Array(moviesService.movies_by_dates.keys), id: \.self) { key in
                // TODO: Formatting Dates
                CalendarRow(
                    date: key,
                    movies: moviesService.movies_by_dates[key]!
                )
            }
        }
        .padding()
    }
}

// Displays the rows in Calendar view
// Comprise of the Release Date followed by Movie Poster(s)
struct CalendarRow: View {
    private var date: String
    private var movies: [Movie]
    
    init(date: String, movies: [Movie]) {
        self.date = date
        self.movies = movies
    }
    
    var body: some View {
        HStack {
            // Date
            Text("\(date)")
            // Movies List
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(movies, id: \.title) { movie in
                        RemoteImage(url: movie.poster_full)
                    }
                }
            }
        }
    }
}

struct News_Previews: PreviewProvider {
    static var previews: some View {
        News()
    }
}
