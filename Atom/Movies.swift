//
//  Movies.swift
//  Atom
//
//  Created by Sam Quan on 12/30/20.
//

import SwiftUI

struct Search: View {
    var text: String
    var imageName: String
    
    var body: some View {
        HStack {
            Image(systemName: "\(imageName)")
            Text("\(text)")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            Spacer()
        }
        .padding(4)
    }
}

struct MoviesHeader: View {
    @State private var movie = "Now Playing"
    @State private var location = "Location"
    
    private let SEARCH_ICON_NAME : String = "magnifyingglass"
    private let LOCATION_ICON_NAME = "location"
    
    var body : some View {
        HStack {
            Image(systemName: "list.bullet")
            Search(text: movie, imageName: SEARCH_ICON_NAME)
                .frame(maxWidth: .infinity)
            Search(text: location, imageName: LOCATION_ICON_NAME)
                .frame(maxWidth: .infinity)
        }
    }
}

struct MoviesList: View {
    var columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach((1...100), id: \.self) {
                    Text("\($0)")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .border(Color.white)
                }
            }
        }
    }
}

struct Movies: View {
    var body: some View {
        VStack {
            MoviesHeader()
            MoviesList()
                .padding(.vertical)
        }
        .padding()
        .background(Color.black)
        .foregroundColor(Color.white)
    }
}

struct Movies_Previews: PreviewProvider {
    static var previews: some View {
        Movies()
            
    }
}
