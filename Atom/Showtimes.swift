//
//  Showtimes.swift
//  Atom
//
//  Created by Sam Quan on 1/17/21.
//

import SwiftUI

// Showtimes
struct Showtimes: View {
    // State information about the "filters" for possible showtimes
    // Date / Location / Format (IE. IMAX, 3D, ATMOS, ETC.)
    @State private var date = "Today"
    @State private var location = "Los Angeles"
    @State private var format = "All Format"
    
    // Constants - SF Symbols
    private let CALENDAR_IMAGE_NAME = "calendar"
    private let LOCATION_IMAGE_NAME = "location"
    private let FILM_IMAGE_NAME = "film"
    
    // Color (RGB) - Atom Ticket "Blue"
    private let ATOM_BLUE = Color(red: 52/255.0, green: 152/255.0, blue: 219/255.0)
    
    var body: some View {
        VStack {
            HStack {
                // Button for selecting which date to filter showtimes
                ImageButton(text: date, imageName: CALENDAR_IMAGE_NAME)
                    .frame(maxWidth: .infinity)
                // TODO: - Add interactivity by displaying list of viewing dates
                
                // Button for selecting which location to filter showtimes
                ImageButton(text: location, imageName: LOCATION_IMAGE_NAME)
                    .frame(maxWidth: .infinity)
                // TODO: - Add interactivity by displaying list of location movie is available
            }
            // Button for selecting which movie format to filter showtimes
            ImageButton(text: format, imageName: FILM_IMAGE_NAME)
                .frame(maxWidth: .infinity)
            // TODO: - Add interactivity by displaying list of formats available
            
            // Button to add to the user's to watch list
            Button(action: {}) {
                Text("Add to My Watch List")
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            // TODO: - Add to user's movie watch list
            .frame(maxWidth: .infinity)
            .padding(8)
            .background(ATOM_BLUE)
            .cornerRadius(8)
        }
        .padding()
    }
}

struct Showtimes_Previews: PreviewProvider {
    static var previews: some View {
        Showtimes()
    }
}
