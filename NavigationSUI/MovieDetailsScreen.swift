//
//  MovieDetailsScreen.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 09.11.25.
//

import SwiftUI

struct MovieDetailsView: View {
    
    let movie: Movie
    
    var body: some View {
        Text(movie.name)
    }
}

