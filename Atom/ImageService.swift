//
//  ImageService.swift
//  Atom
//
//  Created by Sam Quan on 1/12/21.
//

import Combine
import Foundation
import SwiftUI

// Fetches an image from the network
class ImageService: ObservableObject {
    @Published var image: UIImage?
    
    private let url: String
    private var subscription: AnyCancellable?
    private var imageCache = ImageCache.getImageCache()
    
    init(url: String) {
        self.url = url
        load()
    }
    
    func load() {
        // Check if an image exists in cache
        if isImageCached() {
            return
        }
        // If image does not exist in cache, retrieve via URL
        loadImageFromURL()
    }
    
    //
    func loadImageFromURL() {
        subscription = URLSession.shared
            .dataTaskPublisher(for: URL(string: url)!)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .handleEvents( receiveOutput:{
                self.imageCache.set(forKey: self.url, image: $0!)
            })
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    // Checks if an image exists in cache
    func isImageCached() -> Bool {
        guard let cacheImage = imageCache.get(forKey: url) else {
            // Image not found in ImageCache
            return false
        }
        // Use cached image
        image = cacheImage
        return true
    }
    
    // Cancels Subscription
    func cancel() {
        subscription?.cancel()
    }
}
