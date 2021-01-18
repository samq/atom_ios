//
//  MovieDetails.swift
//  Atom
//
//  Created by Sam Quan on 1/13/21.
//

import SwiftUI

struct MovieDetails: View {
    // Initial Picker - 0 (Showtimes)
    @State private var selectedSection = 0
    
    var movie: Movie
    // Sections Constants
    private let sections = ["Showtimes", "Details", "Reviews"]
    
    // UIColor (RGBA) - Atom Tickets Theme
    private let ATOM_BLUE = UIColor(red: 52/255.0, green: 152/255.0, blue: 219/255.0, alpha: 1)
    
    init(movie: Movie) {
        self.movie = movie
        
        // NavigationBar - Background Color
        UINavigationBar.appearance().barTintColor = .black
        
        // Customizes Picker (SegmentedPickerStyle)
        // Background Color / Selected Color / Foreground (Normal and Selected)
        UISegmentedControl.appearance().backgroundColor = .black
        UISegmentedControl.appearance().selectedSegmentTintColor = .black
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: ATOM_BLUE], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
    }
    
    private var shareButton = Button(action:{}) {
        Image(systemName: "square.and.arrow.up")
    }
    
    private var bookmarkButton = Button(action:{}) {
        Image(systemName: "bookmark")
    }
    
    var body: some View {
        ScrollView {
            // Information about Movie Poster / Title / Runtime
            HStack {
                RemoteImage(url: movie.poster_full)
                    .frame(width: 146, height: 204)
                VStack(alignment: .leading) {
                    Text("\(movie.title)")
                    Text("\(movie.mpa_rating)")
                }
                Spacer()
            }
            .padding()
            
            // Picker - Showtimes / Details / Reviews
            Picker("", selection: $selectedSection) {
                ForEach(0 ..< sections.count) {
                    Text("\(sections[$0])")
                }
            }
            // SegmentedPickerStyle - "Tab"
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // Show section that corresponds to one chosen in Picker - Showtimes / Details / Reviews
            Group {
                switch(sections[selectedSection]) {
                    case "Showtimes": Showtimes()
                    case "Details": Details(movie: movie)
                    default: Reviews()
                }
            }
        }
        // Remove Navigation Bar Title
        .navigationBarTitleDisplayMode(.inline)
        // Add Share and Bookmark Button to NavigationBar
        .navigationBarItems(
            trailing: HStack{
                shareButton.padding()
                bookmarkButton
            }
            .foregroundColor(.gray)
        )
        // Black Background with White Fonts
        .background(Color.black)
        .foregroundColor(Color.white)
    }
}

struct MovieDetails_Previews: PreviewProvider {
    static var testMovie = Movie(
        title: "Shadow in The Cloud",
        directors: "Roseanne Liang",
        writers: "Max Landis, Roseanne Liang",
        producers: "Fred Berger, Tom Hern, Brian Kavanaugh-Jones",
        cast: ["Chloë Grace Moretz", "Nick Robinson", "Beulah Koale", "Taylor John Smith", "Callan Mulvey", "Benedict Wall", "Byron Coll", "Joe Witkowski", "Liam Legge"],
        release_date: "Jan 1, 2021",
        poster_full: "https://atom-tickets-res.cloudinary.com/image/upload/v1609267589/ingestion-images-archive-prod/archive/1609267588922_311877_cops_0.jpg",
        poster_small: "https://atom-tickets-res.cloudinary.com/image/upload/c_fill,f_auto,g_north,h_180,q_auto,w_180/v1609267589/ingestion-images-archive-prod/archive/1609267588922_311877_cops_0.jpg",
        synopsis: "In the throes of World War II, on a rainy morning in Auckland, a group of Allied soldiers prepare to take to the air in a B-17 Flying Fortress. The all-male crew is caught off guard by Captain Maude Garrett boarding their plane carrying a top-secret package. The presence of a woman on a military flight is unusual enough to arouse their suspicion. Just as Maude's quick wit and military knowledge is winning over the leery crew, strange happenings and holes in her backstory lead to paranoia surrounding her true mission. But this crew isn't alone in the sky... lurking in the shadows, something with sharp teeth and a taste for chaos is tearing at the heart of the vessel. Crushed between an oncoming Japanese ambush and an evil lurking within, Maude must push her limits to save the hapless crew and to protect her mysterious cargo.",
        runtime: "1hr 23m",
        mpa_rating: "Rated R",
        movie_rating: "",
        metacritic_rating: ""
    )
    
    static var previews: some View {
        MovieDetails(movie: testMovie)
    }
}
