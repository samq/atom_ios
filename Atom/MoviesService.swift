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
    @Published var release_dates: [String] = []
    @Published var movies_by_dates: [String: [Movie]] = [String: [Movie]]()
    
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
                print("COMPLETE - \(completion)")
            } receiveValue: { movies in
                // Store Results
                // Movies List
                self.movies = movies
                // Release Dates
                self.release_dates = movies.compactMap{ $0.release_date }
                // Movies by Release Dates
                for (index, release_date) in self.release_dates.enumerated() {
                    // Create Dictionary
                    // Release Dates corresponds to a List of Movies
                    if self.movies_by_dates[release_date] != nil {
                        self.movies_by_dates[release_date]!.append(self.movies[index])
                    }
                    else {
                        self.movies_by_dates[release_date] = [self.movies[index]]
                    }
                }
            }
            // Adds to Subscriber List
            .store(in: &cancellableSet)
    }
    
    // Returns Date object from String with the format in "MMM d, yyyy" - IE. Jan 1, 2021
    // HTTPS://NSDATEFORMATTER.COM
    private func createDate(from string: String, withFormat format: String) -> Date? {
        // DateFormatter - TimeZone and Locale
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        // MMM d, yyyy
        // Example - Jan 1, 2021
        formatter.dateFormat = format
        return formatter.date(from: string)
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
