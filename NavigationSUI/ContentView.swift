//
//  ContentView.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 09.11.25.
//

import SwiftUI


enum Sports: String {
    case golf
    case cricket
    case soccer
}

 
struct Movies: Hashable {
    let name: String
}
struct ContentView: View {
    
    
    @State private var movie: Movies?
    
    var body: some View {
        VStack {
            NavigationLink("Go to Detail View") {
                Text("Detail View ")
            }.buttonStyle(.glassProminent)
            
            NavigationLink("Navigate for Int Value", value: 1)
            NavigationLink("Navigate for String Value", value: "1")
            NavigationLink("Navigate for Enum Value", value: Sports.cricket)
            
            Button("Set Favorite Movie") {
                movie = Movies(name: "Inception")
            }.buttonStyle(.borderedProminent)
        }
        .navigationDestination(for: Int.self, destination: { intValue in
            Text("\(intValue)")
        })
        .navigationDestination(for: String.self, destination: { stringValue in
            Text("\(stringValue)")
        })
        .navigationDestination(for: Sports.self, destination: { enumValue in
            Text("\(enumValue)")
        })
        .navigationDestination(item: $movie) { movie in
            Text(movie.name)
        }
        .padding()
    }
}

struct MovieDetailsScreen: View {
    let movie: String
    var body: some View {
        Text(movie)
            .navigationTitle(movie)
    }
}

struct MovieListScreen: View {
    
    let movie = ["Lord of Rings", "Inception", "The Matrix"]
    var body: some View {
        List(movie, id: \.self) { movie in
//            NavigationLink(movie) {
//                MovieDetailsScreen(movie: movie)
//            }
            NavigationLink {
                MovieDetailsScreen(movie: movie)
            } label: {
                HStack {
                    Image(systemName: "heart")
                    Text(movie)
                }
            }

        }
        
    }
}


#Preview("Movie List Screen") {
    
    NavigationStack {
        MovieListScreen()
    }
    
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
