//
//  MovieDetailsScreen.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 09.11.25.
//

import SwiftUI

struct MovieDetailsView: View {
    
    @Environment(Router.self) private var router
    
    let movie: Movie
    
    var body: some View {
        VStack {
            Text(movie.name)
            Button("Go to Login") {
                router.addRoute(.login)
            }.buttonStyle(.borderedProminent)
        }
       
    }
}

