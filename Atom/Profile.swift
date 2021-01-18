//
//  Profile.swift
//  Atom
//
//  Created by Sam Quan on 12/30/20.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HStack {
                    Text("My Profile")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text("Help")
                        .font(.system(size: 14))
                        .foregroundColor(.blue)
                    Image(systemName: "gearshape")
                }
                .padding(.vertical, 4)
                // Content
                ScrollView {
                    // User Information
                    HStack {
                        // Profile Image - Placeholder
                        Image(systemName: "person.circle")
                            .font(.system(size: 48))
                        // Name, Phone Number, Email
                        VStack(alignment: .leading) {
                            Text("John Doe")
                                .foregroundColor(.white)
                            Text("+1 234-567-8910")
                            Text("johndoe@gmail.com")
                        }
                        .foregroundColor(.gray)
                        .padding(.horizontal, 4)
                        Spacer()
                        // Edit Option
                        // TODO: Add option to edit current user information
                        Text("Edit Info")
                            .font(.system(size: 14))
                            .foregroundColor(.blue)
                    }
                    .padding(.vertical)
                    
                    // My Tickets and Invites
                    
                    
                    // My Watch List
                    
                    
                    // Movies I've Seen
                    
                    
                    // My Connected Accounts
                    // Google / Facebook / Amazon / Snapchat
                }
            }
            .navigationBarHidden(true)
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
