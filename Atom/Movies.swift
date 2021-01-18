//
//  Movies.swift
//  Atom
//
//  Created by Sam Quan on 12/30/20.
//

import SwiftUI

// Displays the Movie section view
// Comprised of a header and list
struct Movies: View {
    var body: some View {
        NavigationView {
            VStack {
                // Header
                MoviesHeader()
                // List
                MoviesList()
                    .padding(.vertical)
            }
            .navigationBarHidden(true)
            .padding()
            .background(Color.black)
            .foregroundColor(Color.white)
        }
        .accentColor(.gray)
    }
}

struct Movies_Previews: PreviewProvider {
    static var previews: some View {
        Movies()
            
    }
}
