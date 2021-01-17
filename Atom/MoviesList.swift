//
//  MoviesList.swift
//  Atom
//
//  Created by Sam Quan on 1/11/21.
//

import SwiftUI

struct MoviesList: View {
    @ObservedObject var moviesService = MoviesService()
    
    private var columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(moviesService.movies, id: \.title) { movie in
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
