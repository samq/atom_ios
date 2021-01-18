//
//  SeaerchButton.swift
//  Atom
//
//  Created by Sam Quan on 1/11/21.
//

import SwiftUI

// Displays an Image (SF Symbol) along with a Text
// Acts like a button with an image attached in front
struct ImageButton: View {
    // Text and Image to be displayed (passed by user)
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
