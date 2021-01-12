//
//  Movies.swift
//  Atom
//
//  Created by Sam Quan on 12/30/20.
//

import SwiftUI

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
