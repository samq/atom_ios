//
//  ImageCache.swift
//  Atom
//
//  Created by Sam Quan on 1/12/21.
//

import Foundation
import SwiftUI

// Caches the Network Image
class ImageCache {
    // NSCache - Temporary storage of Key (NSString), Value (UIImage)
    var cache = NSCache<NSString, UIImage>()
    
    // Retrieves a value from the NSCache with provided key
    func get(forKey: String) -> UIImage? {
        cache.object(forKey: NSString(string: forKey))
    }
    
    // Stores a value to the NSCache with provided key
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}

// Extension Function to ImageCache
extension ImageCache {
    // Singleton
    private static var imageCache = ImageCache()
    // Returns Singleton created
    static func getImageCache() -> ImageCache {
        imageCache
    }
}
