//
//  MoviesViewModel.swift
//  Atom
//
//  Created by Sam Quan on 1/12/21.
//

import Combine
import Foundation

// Provides MovieService - Loading of movies' information
class MoviesService: ObservableObject {
    // Initializes the movie list to be empty on start
    @Published var movies: [Movie] = []
    
    // Subscriptions to the Publisher (MovieService)
    private var cancellableSet: Set<AnyCancellable> = []
    // Date Updated - January 12, 2020
    private let upcoming_movies_url = URL(string: "https://raw.githubusercontent.com/samq/samq.github.io/master/data/upcoming_movies.json")!
    
    init() {
        load()
    }
    
    // Retrieves movies from network resource
    private func load() {
        // URLSession - Provides API for retrieving information via URL endpoints
        URLSession.shared
            .dataTaskPublisher(for: upcoming_movies_url)
            .map(\.data)
            // Uses Movie Model for creation of object list
            .decode(type: [Movie].self, decoder: JSONDecoder())
            // Updates UI so needs to run on main thread
            .receive(on: RunLoop.main)
            // sink - Attaches Subscriber
            // receiveCompletion - Called when task is completed
            // receiveValue - Called when a value is received
            .sink { completion in
                print(completion)
            } receiveValue: {
                self.movies = $0
            }
            // Adds to Subscriber List
            .store(in: &cancellableSet)
    }
}

// Extension Function to MovieService
extension MoviesService {
    // Singleton
    private static var moviesService = MoviesService()
    // Return Singleton created
    static func getMoviesService() -> MoviesService {
        return moviesService
    }
}
