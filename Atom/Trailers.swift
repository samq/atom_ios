//
//  Trailers.swift
//  Atom
//
//  Created by Sam Quan on 12/30/20.
//

import SwiftUI

struct Trailers: View {
    // Initial Picker - 0 (Trending)
    @State private var selectedSection = 0
    // Sections Constants
    private let sections = ["Trending", "Now Playing", "Coming Soon"]
    
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
                HStack {
                    Text("Trailers")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                
                // Picker - Trending, Now Playing, Coming Soon
                Picker("", selection: $selectedSection) {
                    ForEach(0 ..< sections.count) {
                        Text("\(sections[$0])")
                    }
                }
                // SegmentedPickerStyle - "Tab"
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                ScrollView {
                    switch(sections[selectedSection]) {
                        case "Trending": Trending()
                        case "Now Playing": NowPlaying()
                        default: ComingSoon()
                    }
                }
            }
            .navigationBarHidden(true)
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
        }
    }
}

// TODO: Dynamic Data for Movies
struct Trending: View {
    var body: some View {
        ForEach(0 ..< 4) { _ in
            TrailerCard(title: "LOREM IPSUM (O)", mpa_rating: "Rated PG", release_date: "October 31, 2021")
                .padding()
        }
    }
}

struct NowPlaying: View {
    var body: some View {
        ForEach(0 ..< 8) { _ in
            TrailerCard(title: "LOREM IPSUM (N)", mpa_rating: "Rated PG-13", release_date: "November 31, 2021")
                .padding()
        }
    }
}

struct ComingSoon: View {
    var body: some View {
        ForEach(0 ..< 12) { _ in
            TrailerCard(title: "LOREM IPSUM (D)", mpa_rating: "Rated R", release_date: "December 31, 2021")
                .padding()
        }
    }
}

struct TrailerCard: View {
    var title: String
    var mpa_rating: String
    var release_date: String
    
    var body: some View {
        VStack {
            // Trailer
            ZStack {
                // Video Placeholder
                Image(systemName: "squareshape")
                    .resizable()
                    .frame(width: .infinity, height: 256)
                // Play Button Placeholder
                Image(systemName: "play.circle")
                    .font(.system(size: 96))
                // TODO: Volume Icon
                // TODO: Bookmark Icon
            }
            HStack {
                VStack(alignment: .leading) {
                    // Movie Name
                    Text("\(title)")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    // MPA Rating, Release Date
                    Text("\(mpa_rating) - \(release_date)")
                        .font(.system(size: 14))
                }
                Spacer()
                // More Info - Button
                // TODO: Add More Information View
                Button(action: {}) {
                    Text("More Info")
                }
                .padding(8)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
    }
}

struct Trailers_Previews: PreviewProvider {
    static var previews: some View {
        Trailers()
    }
}
