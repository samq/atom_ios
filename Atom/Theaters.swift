//
//  Theaters.swift
//  Atom
//
//  Created by Sam Quan on 12/30/20.
//

import SwiftUI

// Displays the theaters based on location provided as well as movies available on date provided
struct Theaters: View {
    @State private var date: String = "Today"
    @State private var location: String = "Los Angeles"
    
    private var SEARCH_IMAGE_NAME = "magnifyingglass"
    private var DATE_IMAGE_NAME = "calendar"
    private var LOCATION_IMAGE_NAME = "location"
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HStack {
                    Text("THEATERS")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    // Search
                    // TODO: Add search feature to find user specified theater
                    Image(systemName: SEARCH_IMAGE_NAME)
                }
                .padding(.vertical, 4)
                // Date and Location Search
                HStack {
                    // TODO: Add functionality to display list of available dates
                    ImageButton(text: date, imageName: DATE_IMAGE_NAME)
                        .frame(maxWidth: .infinity)
                        .border(Color.gray)
                    // TODO: Add functionality to display list of search locations
                    ImageButton(text: location, imageName: LOCATION_IMAGE_NAME)
                        .frame(maxWidth: .infinity)
                        .border(Color.gray)
                }
                // Theaters - Results
                ScrollView {
                    // TODO: Display dynamic results based on search query
                    // No Availability Placeholder View
                    VStack {
                        Text("NOT AVAILABLE")
                            .padding(.top)
                        Divider()
                            .background(Color.white)
                            .padding()
                        Text("There are no theaters near you. Please choose another date or location")
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                    }
                    .padding()
                    .border(Color.gray)
                    
                    Spacer()
                    
                }
            }
            .navigationBarHidden(true)
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
        }
    }
}

struct Theaters_Previews: PreviewProvider {
    static var previews: some View {
        Theaters()
    }
}
