//
//  MoviesList.swift
//  Atom
//
//  Created by Sam Quan on 1/11/21.
//

import SwiftUI

// Creates a list of movie listings along with navigation to additional information about movie
struct MoviesList: View {
    // MovieService Object - Provides information about movies
    @ObservedObject var moviesService = MoviesService.getMoviesService()
    
    // Grid Information
    private var columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        // Scrollable
        ScrollView {
            // Lazy - Load when views are in view
            LazyVGrid(columns: columns) {
                ForEach(moviesService.movies, id: \.title) { movie in
                    // Navigation to additional detail information of movie
                    NavigationLink(destination: MovieDetails(movie: movie)) {
                        MoviesListItem(movie: movie)
                    }
                }
            }
        }
    }
}

struct MoviesList_Previews: PreviewProvider {
    static var previews: some View {
        MoviesList()
    }
}
