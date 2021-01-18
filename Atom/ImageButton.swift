//
//  SeaerchButton.swift
//  Atom
//
//  Created by Sam Quan on 1/11/21.
//

import SwiftUI

struct ImageButton: View {
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
