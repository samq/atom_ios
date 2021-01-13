//
//  MoviesListItem.swift
//  Atom
//
//  Created by Sam Quan on 1/11/21.
//

import SwiftUI

struct MoviesListItem: View {
    var movie: Movie
    
    var body: some View {
        // Align Title and Rating to the left (in LTR languages)
        VStack(alignment: .leading) {
            // Image
            Image("shadow_in_the_cloud.jpg")
                .resizable()
                .aspectRatio(contentMode: .fit)
            // Name
            Text(movie.title)
                .font(.system(size: 12))
                .lineLimit(1)
            // Movie Rating
            Text(movie.mpa_rating)
                .font(.system(size: 12))
        }
    }
}

struct MoviesListItem_Previews: PreviewProvider {
    static var testMovie = Movie(
        title: "Shadow in The Cloud",
        directors: "Roseanne Liang",
        writers: "Max Landis, Roseanne Liang",
        producers: "Fred Berger, Tom Hern, Brian Kavanaugh-Jones",
        cast: ["Chloë Grace Moretz", "Nick Robinson", "Beulah Koale", "Taylor John Smith", "Callan Mulvey", "Benedict Wall", "Byron Coll", "Joe Witkowski", "Liam Legge"],
        release_date: "Jan 1, 2021",
        poster_full: "https://atom-tickets-res.cloudinary.com/image/upload/v1609267589/ingestion-images-archive-prod/archive/1609267588922_311877_cops_0.jpg",
        poster_small: "https://atom-tickets-res.cloudinary.com/image/upload/c_fill,f_auto,g_north,h_180,q_auto,w_180/v1609267589/ingestion-images-archive-prod/archive/1609267588922_311877_cops_0.jpg",
        synopsis: "In the throes of World War II, on a rainy morning in Auckland, a group of Allied soldiers prepare to take to the air in a B-17 Flying Fortress. The all-male crew is caught off guard by Captain Maude Garrett boarding their plane carrying a top-secret package. The presence of a woman on a military flight is unusual enough to arouse their suspicion. Just as Maude's quick wit and military knowledge is winning over the leery crew, strange happenings and holes in her backstory lead to paranoia surrounding her true mission. But this crew isn't alone in the sky... lurking in the shadows, something with sharp teeth and a taste for chaos is tearing at the heart of the vessel. Crushed between an oncoming Japanese ambush and an evil lurking within, Maude must push her limits to save the hapless crew and to protect her mysterious cargo.",
        runtime: "1hr 23m",
        mpa_rating: "Rated R",
        movie_rating: "",
        metacritic_rating: ""
    )
    
    static var previews: some View {
        MoviesListItem(movie: testMovie)
    }
}
