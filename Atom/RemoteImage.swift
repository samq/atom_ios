//
//  RemoteImage.swift
//  Atom
//
//  Created by Sam Quan on 1/12/21.
//

import SwiftUI

struct RemoteImage: View {
    @StateObject var imageService : ImageService
    
    var url : String
    
    private let defaultImage = UIImage(systemName: "photo")
    
    init(url: String) {
        self.url = url
        _imageService = StateObject(wrappedValue: ImageService(url: url))
    }
    
    var body: some View {
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
