//
//  RemoteImage.swift
//  Atom
//
//  Created by Sam Quan on 1/12/21.
//

import SwiftUI

// RemoteImage
// Displays an image stored on a network
struct RemoteImage: View {
    // ImageService - Provides the service for displaying network image
    @StateObject var imageService : ImageService
    // Required URL to Image
    private var url : String
    // Default Image to be displayed in case network resource unavailable
    private let defaultImage = UIImage(systemName: "photo")
    
    // Initializer
    init(url: String) {
        self.url = url
        _imageService = StateObject(wrappedValue: ImageService(url: url))
    }
    
    var body: some View {
        // Displays network image or default placeholder
        Image(uiImage: (imageService.image ?? defaultImage)!)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImage(
            url: "https://atom-tickets-res.cloudinary.com/image/upload/v1/ingestion-images-archive-prod/archive/fdc8c2026e41.jpg")
    }
}
