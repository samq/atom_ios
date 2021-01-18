//
//  Movie.swift
//  Atom
//
//  Created by Sam Quan on 1/12/21.
//

import Foundation

// Movie Model
// Modeled after JSON data to be retrieved in network
struct Movie : Decodable {
    var title: String
    var directors: String
    var writers: String
    var producers: String
    var cast: [String]
    var release_date: String
    var poster_full: String
    var poster_small: String
    var synopsis: String
    var runtime: String
    var mpa_rating: String
    var movie_rating: String
    var metacritic_rating: String
}
