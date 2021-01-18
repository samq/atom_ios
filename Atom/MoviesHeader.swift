//
//  MoviesHeader.swift
//  Atom
//
//  Created by Sam Quan on 1/11/21.
//

import SwiftUI

struct MoviesHeader: View {
    @State private var movie = "Now Playing"
    @State private var location = "Location"
    
    private let SEARCH_IMAGE_NAME : String = "magnifyingglass"
    private let LOCATION_IMAGE_NAME = "location"
    
    var body : some View {
        HStack {
            Image(systemName: "list.bullet")
            ImageButton(text: movie, imageName: SEARCH_IMAGE_NAME)
                .frame(maxWidth: .infinity)
            ImageButton(text: location, imageName: LOCATION_IMAGE_NAME)
                .frame(maxWidth: .infinity)
        }
    }
}

struct MoviesHeader_Previews: PreviewProvider {
    static var previews: some View {
        MoviesHeader()
    }
}
