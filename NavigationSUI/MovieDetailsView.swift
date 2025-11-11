//
//  MovieDetailsView.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 11.11.25.
//

import SwiftUI

struct MovieDetailsView: View {
    let movie: Movie
    @Environment(\.navigate) private var navigate
    
    var body: some View {
        VStack(spacing: 20) {
            Text(movie.name)
                .font(.largeTitle)
                .bold()
            
            Text("Movie Details Screen")
                .font(.title2)
            
            Button("Go to Login") {
                navigate(.push(.login))
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button("Show Reviews") {
                let sampleReviews = [
                    Review(subject: "Great Movie!", description: "Amazing cinematography and story."),
                    Review(subject: "Good Acting", description: "The cast delivered excellent performances."),
                    Review(subject: "Visual Effects", description: "Stunning visual effects throughout.")
                ]
                navigate(.push(.reviews(sampleReviews)))
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .navigationTitle("Movie Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        MovieDetailsView(movie: Movie(name: "Batman"))
    }
}