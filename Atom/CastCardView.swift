//
//  CastCardView.swift
//  Atom
//
//  Created by Sam Quan on 1/17/21.
//

import SwiftUI

// Displays the cast information in "Card" form in Details section of MovieDetails screen
// Comprised of User Photo along with Name
struct CastCardView: View {
    var name: String
    
    var body: some View {
        VStack {
            // Placeholder Photo (Actors/Actress Photo Unavailable)
            Image(systemName: "photo")
                .resizable()
                .font(.system(size: 256))
            // Actor/Actress Name
            // GeometryReader - Helps with alignment of name relative to Photo
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
