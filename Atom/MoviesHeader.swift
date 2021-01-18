//
//  MoviesHeader.swift
//  Atom
//
//  Created by Sam Quan on 1/11/21.
//

import SwiftUI

// Header for the Movie screen
// Burger ~ Hamburger Menu - Additional User Options
// Movie Search Button
// Location Search Button
struct MoviesHeader: View {
    // State
    // Movie and Location selected by user
    // Initial Value - Defaults
    @State private var movie = "Now Playing"
    @State private var location = "Location"
    
    // SF Symbol Constants
    private let SEARCH_IMAGE_NAME : String = "magnifyingglass"
    private let LOCATION_IMAGE_NAME = "location"
    
    var body : some View {
        HStack {
            Image(systemName: "list.bullet")
            // TODO: Add interactivity by providing additional options
            ImageButton(text: movie, imageName: SEARCH_IMAGE_NAME)
                .frame(maxWidth: .infinity)
            // TODO: Add interactivity by providing a list of movie matching input
            ImageButton(text: location, imageName: LOCATION_IMAGE_NAME)
                .frame(maxWidth: .infinity)
            // TODO: Add interactivity by providing a list of location matching input
        }
    }
}

struct MoviesHeader_Previews: PreviewProvider {
    static var previews: some View {
        MoviesHeader()
    }
}
