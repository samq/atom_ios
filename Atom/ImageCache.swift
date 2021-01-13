//
//  ImageCache.swift
//  Atom
//
//  Created by Sam Quan on 1/12/21.
//

import Foundation
import SwiftUI

class ImageCache {
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}

extension ImageCache {
    // Singleton
    private static var imageCache = ImageCache()
    static func getImageCache() -> ImageCache {
        imageCache
    }
}
