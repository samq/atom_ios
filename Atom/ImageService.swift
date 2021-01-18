//
//  ImageService.swift
//  Atom
//
//  Created by Sam Quan on 1/12/21.
//

import Combine
import Foundation
import SwiftUI

// Provide Image Services
// Retrieve Image from the network
class ImageService: ObservableObject {
    // Image
    @Published var image: UIImage?
    // URL
    private let url: String
    // Subscription List
    private var subscription: AnyCancellable?
    // Cache - Singleton
    private var imageCache = ImageCache.getImageCache()
    
    init(url: String) {
        self.url = url
        load()
    }
    
    // Retrieve Image
    private func load() {
        // Check if an image already exists in cache
        if isImageCached() {
            return
        }
        // If image does not exist in cache, retrieve via URL
        loadImageFromURL()
    }
    
    // Retrieves Image from Network (via URL)
    private func loadImageFromURL() {
        // URLSession
        subscription = URLSession.shared
            // Fetch from URL
            .dataTaskPublisher(for: URL(string: url)!)
            // Resamples original image size to reduce resource usage (~10x)
            .map { self.downsampleImage(image: UIImage(data: $0.data)!, for: CGSize(width: 146, height: 204)) }
            .replaceError(with: nil)
            // Adds the result to the cache to reduce network usage during application usage
            .handleEvents( receiveOutput:{
                self.imageCache.set(forKey: self.url, image: $0!)
            })
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    // Checks if an image exists in cache
    private func isImageCached() -> Bool {
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
    
    // Downsample Images
    // Using the original poster sizes results in high memory usage
    // Process - Load > Decode - Uncompress > Render -
    private func downsampleImage(imageAt imageURL: URL, to pointSize: CGSize, scale: CGFloat) -> UIImage {
        let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
        let imageSource = CGImageSourceCreateWithURL(imageURL as CFURL, imageSourceOptions)!
        let maxDimentionInPixels = max(pointSize.width, pointSize.height) * scale
        let downsampledOptions = [kCGImageSourceCreateThumbnailFromImageAlways: true,
                                  kCGImageSourceShouldCacheImmediately: true,
                                  kCGImageSourceCreateThumbnailWithTransform: true,
                                  kCGImageSourceThumbnailMaxPixelSize: maxDimentionInPixels] as CFDictionary
        let downsampledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downsampledOptions)!
        return UIImage(cgImage: downsampledImage)
    }
    // Downsample Image
    private func downsampleImage(image: UIImage, for size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
