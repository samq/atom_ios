//
//  Profile.swift
//  Atom
//
//  Created by Sam Quan on 12/30/20.
//

import SwiftUI

struct Profile: View {
    private let accounts = ["Google", "Facebook", "Amazon", "Snapchat"]
    
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
                    // TODO: Add help functionality
                    // TODO: Add settings functionality
                    Image(systemName: "gearshape")
                }
                .padding()
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
                    .padding()
                    
                    // My Tickets and Invites
                    VStack {
                        // Header
                        Text("My Tickets & Invites")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Divider()
                            .foregroundColor(.white)
                            .padding(4)
                        VStack {
                            Text("Make tongiht a movie night!")
                            Text("See what's playing")
                                .padding(.bottom)
                            // TODO: Add functionality for users to see new movie releases
                            Button(action: {}) {
                                Text("Browse New Releases")
                            }
                            .padding(8)
                            .background(Color.blue)
                            .cornerRadius(10)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .border(Color.gray)
                    }
                    .padding()
                    .border(Color.gray)
                    
                    
                    // My Watch List
                    // TODO: Add dynamic data to user's watch list
                    VStack(alignment: .leading) {
                        // Header
                        Text("My Watch List (8)")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Divider()
                        // Horizontal ScrollView
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 8) { _ in
                                    // Image Placeholder
                                    // TODO: Replace with movie poster
                                    Image(systemName: "photo")
                                        .resizable()
                                        .frame(width: 92, height: 100)
                                }
                            }
                        }
                    }
                    .padding()
                    .border(Color.gray)
                    
                    
                    // Movies I've Seen
                    // TODO: Add dynamic data to user's seen list
                    VStack(alignment: .leading) {
                        // Header
                        Text("Movies I've Seen (16)")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Divider()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 16) { _ in
                                    // Image Placeholder
                                    // TODO: Replace with movie poster
                                    Image(systemName: "photo")
                                        .resizable()
                                        .frame(width: 92, height: 100)
                                }
                            }
                        }
                    }
                    .padding()
                    .border(Color.gray)
                    
                    
                    // My Connected Accounts
                    // Google / Facebook / Amazon / Snapchat
                    VStack(alignment: .leading) {
                        // Header
                        Text("My Connected Accounts")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Divider()
                            .foregroundColor(.white)
                            .padding(4)
                        VStack {
                            ForEach(0 ..< accounts.count) {
                                // 3rd Party Account Link Buttons
                                AccountConnectButton(account: accounts[$0])
                            }
                        }
                        .padding()
                        
                    }
                    .padding()
                    .border(Color.gray)
                }
            }
            .navigationBarHidden(true)
            .background(Color.black)
            .foregroundColor(.white)
        }
    }
}

// Support View for creating a button for the user to link 3rd party accounts
// TODO: Add functionality for user to connect 3rd party accounts
struct AccountConnectButton: View {
    var account: String
    
    var body: some View {
        HStack {
            Image(systemName: "photo")
                .font(.system(size: 24))
            Text("Connect with \(account)")
                .frame(maxWidth: .infinity)
        }
        .padding()
        .border(Color.gray)
        .cornerRadius(2)
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
