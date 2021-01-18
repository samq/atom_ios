//
//  MovieDetails.swift
//  Atom
//
//  Created by Sam Quan on 1/13/21.
//

import SwiftUI

struct MovieDetails: View {
    @State private var selectedSection = 1
    
    var movie: Movie
    var sections = ["Showtimes", "Details", "Reviews"]
    
    private let ATOM_BLUE = UIColor(red: 52/255.0, green: 152/255.0, blue: 219/255.0, alpha: 1)
    
    init(movie: Movie) {
        self.movie = movie
        UISegmentedControl.appearance().backgroundColor = .black
        UISegmentedControl.appearance().selectedSegmentTintColor = .black
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: ATOM_BLUE], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
    }
    
    var body: some View {
        ScrollView {
            // NavigationView
            // Back Arrow
            // Movie Poster / Movie Title
            // Share
            // Bookmark
            
            // Trailer - Video
            // Scrolling Effect
            
            // Movie Poster
            // Movie Title, Rating, Runtime
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
            
            // Tabs - Showtimes / Details / Reviews
            Picker("", selection: $selectedSection) {
                ForEach(0 ..< sections.count) {
                    Text("\(sections[$0])")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // Show section that corresponds to one chosen in Picker
            Group {
                switch(sections[selectedSection]) {
                    case "Showtimes": Showtimes()
                    case "Details": Details(movie: movie)
                    default: Reviews()
                }
            }
        }
        .background(Color.black)
        .foregroundColor(Color.white)
    }
}

// Showtimes
// Date and Location
// Format
// Movie Theater Name / Favorite
// Distance (Miles) / Theater Details - Name / Favorite / Distance / Address / Listings
// Add to Watch List
struct Showtimes: View {
    @State private var date = "Today"
    @State private var location = "Los Angeles"
    @State private var format = "All Format"
    
    private let CALENDAR_IMAGE_NAME = "calendar"
    private let LOCATION_IMAGE_NAME = "location"
    private let FILM_IMAGE_NAME = "film"
    
    private let ATOM_BLUE = Color(red: 52/255.0, green: 152/255.0, blue: 219/255.0)
    
    var body: some View {
        VStack {
            HStack {
                //
                ImageButton(text: date, imageName: CALENDAR_IMAGE_NAME)
                    .frame(maxWidth: .infinity)
                //
                ImageButton(text: location, imageName: LOCATION_IMAGE_NAME)
                    .frame(maxWidth: .infinity)
            }
            //
            ImageButton(text: format, imageName: FILM_IMAGE_NAME)
                .frame(maxWidth: .infinity)
            
            Button(action: {}) {
                Text("Add to My Watch List")
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .frame(maxWidth: .infinity)
            .padding(8)
            .background(ATOM_BLUE)
            .cornerRadius(8)
        }
        .padding()
    }
}

// Details
// Synopsis
// Cast - Photo (Placeholder) and Name
// View All (List)
// Videos and Photos
// Details - Release Date / Director / Producers / Writer / Runtime
struct Details: View {
    var movie: Movie
    
    var body: some View {
        VStack {
            // Synopsis
            HStack {
                Text("Synopsis")
                Spacer()
            }
            Divider()
            Text("\(movie.synopsis)")
            
            // Cast
            HStack {
                Text("Cast")
                Spacer()
                Text("View All")
            }
            .padding(.top)
            Divider()
            // Cast Members - 4
            if(movie.cast.count > 4) {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(0 ..< 4) { index in
                        CastCardView(name: movie.cast[index])
                    }
                }
            }
            
            // Details
            Group {
                HStack {
                    Text("Details")
                    Spacer()
                }
                Divider()
                // Release Date / Director / Producers / Writers / Runtime
                HStack {
                    Text("Release Date:")
                    Text("\(movie.release_date)").lineLimit(1)
                    Spacer()
                }
                HStack {
                    Text("Director(s):")
                    Text("\(movie.directors)").lineLimit(1)
                    Spacer()
                }
                HStack {
                    Text("Producer(s):")
                    Text("\(movie.producers)").lineLimit(1)
                    Spacer()
                }
                HStack {
                    Text("Writer(s):")
                    Text("\(movie.writers)").lineLimit(1)
                    Spacer()
                }
                HStack {
                    Text("Runtime:")
                    Text("\(movie.runtime)")
                    Spacer()
                }
            }
            
        }
        .padding()
    }
}

struct CastCardView: View {
    var name: String
    
    var body: some View {
        VStack {
            Image(systemName: "photo")
                .resizable()
                .font(.system(size: 256))
            GeometryReader { geometry in
                Text("\(name)")
                    .frame(width: geometry.size.width, height: geometry.size.height / 3)
                    .font(.subheadline)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
            }
        }
    }
}


// Reviews
// Critic Reviews
// User Reviews
// 5 / 4 / 3 / 2 / 1 Stars
// Add Your Own Review - Button
// List - Icon / Name / Rating / Comment / Verified Review Mark`
struct Reviews: View {
    var body: some View {
        Text("Reviews")
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
