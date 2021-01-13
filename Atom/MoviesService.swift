//
//  MoviesViewModel.swift
//  Atom
//
//  Created by Sam Quan on 1/12/21.
//

import Combine
import Foundation

class MoviesService: ObservableObject {
    @Published var movies: [Movie] = []
    
    private var cancellableSet: Set<AnyCancellable> = []
    // Date Updated - January 12, 2020
    private let upcoming_movies_url = URL(string: "https://raw.githubusercontent.com/samq/samq.github.io/master/data/upcoming_movies.json")!
    
    init() {
        load()
    }
    
    private func load() {
        URLSession.shared
            .dataTaskPublisher(for: upcoming_movies_url)
            .map(\.data)
            .decode(type: [Movie].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { completion in
                print(completion)
            } receiveValue: {
                print($0)
                self.movies = $0
            }
            .store(in: &cancellableSet)
    }
}
