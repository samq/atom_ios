//
//  MoviesList.swift
//  Atom
//
//  Created by Sam Quan on 1/11/21.
//

import SwiftUI

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

struct MoviesList_Previews: PreviewProvider {
    static var previews: some View {
        MoviesList()
    }
}
