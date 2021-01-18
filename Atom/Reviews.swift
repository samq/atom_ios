//
//  Reviews.swift
//  Atom
//
//  Created by Sam Quan on 1/17/21.
//

import SwiftUI

// Reviews
// Users and Critic Reviews
// TODO: Placeholder for Reviews Section. Need data to make dynamic
struct Reviews: View {
    // Color (RGB) - Atom Tickets "Blue"
    private let ATOM_BLUE = Color(red: 52/255.0, green: 152/255.0, blue: 219/255.0)
    
    var body: some View {
        VStack {
            // Header
            HStack {
                Text("User Reviews")
                Spacer()
            }
            Divider()
            // Information Block - No reviews for movie
            Text("Looks like no one has reviewed this yet.")
                .frame(maxWidth: .infinity)
                .padding(.vertical, 64)
                .border(Color.gray)
            // Button for user to add own review
            Button(action: {}) {
                Text("Be the First to Leave a Review")
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            // TODO: Add interactivity by allowing user to write his/her own review
            .padding(8)
            .background(ATOM_BLUE)
            .cornerRadius(8)
        }
        .padding()
    }
}

struct Reviews_Previews: PreviewProvider {
    static var previews: some View {
        Reviews()
    }
}
