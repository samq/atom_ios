//
//  Details.swift
//  Atom
//
//  Created by Sam Quan on 1/17/21.
//

import SwiftUI

// Details
struct Details: View {
    var movie: Movie
    
    // List of Tuples containing movie detail information
    private let movieInfoDetails : [(name: String, value: String)]
    
    // Initializer
    init(movie: Movie) {
        self.movie = movie
        movieInfoDetails = [
            ("Release Date:", movie.release_date),
            ("Director(s):", movie.directors),
            ("Producer(s)", movie.producers),
            ("Writer(s)", movie.writers),
            ("Runtime:", movie.runtime)
        ]
    }
        
    var body: some View {
        VStack {
            // Synopsis/Summary Section
            Group {
                // Header
                HStack {
                    Text("Synopsis")
                    Spacer()
                }
                Divider()
                // Synopsis/Summary Data
                Text("\(movie.synopsis)")
            }
            
            // Cast Section
            Group {
                // Header
                HStack {
                    Text("Cast")
                    Spacer()
                    Text("View All")
                }
                .padding(.top)
                Divider()
                // Cast Members Data
                // Displays the first four cast members on list
                // Some movies do not have a cast members' list. Check to see if possible to display four cast member information
                // TODO: Make the check to include display cast member information if on 1-3 is available
                if(movie.cast.count > 4) {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(0 ..< 4) { index in
                            CastCardView(name: movie.cast[index])
                        }
                    }
                }
            }
            
            // Details Section
            Group {
                // Header
                HStack {
                    Text("Details")
                    Spacer()
                }
                Divider()
                // Release Date / Directors / Producers / Writers / Runtime Data
                ForEach(0 ..< movieInfoDetails.count) { index in
                    MovieInfoDetails(name: movieInfoDetails[index].name, value: movieInfoDetails[index].value)
                }
            }
            
        }
        .padding()
    }
}

// MovieInfoDetails
// Displays single line of movie details information
// Release Date, Directors, Producers, Writers, Runtime
struct MovieInfoDetails: View {
    var name: String
    var value: String
    
    var body: some View {
        HStack {
            Text("\(name)")
            Text("\(value)").lineLimit(1)
            Spacer()
        }
    }
}
