//
//  SecondView.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 09.11.25.
//

import SwiftUI

struct Movie: Hashable {
    let name: String
}

struct Review: Hashable {
    let subject: String
    let description: String
}

enum Route: Hashable {
    case detail(Movie)
    case create
    case login
    case register
    case reviews([Review])
}

struct ReviewListScreen: View {
    
    let reviews: [Review]
    
    var body: some View {
        VStack {
            ForEach(reviews, id: \.self) { review in
                Text(review.subject)
                Text(review.description)
            }
        }
    }
}

struct SecondView: View {
    
    @State private var routes: [Route] = []
    
    var body: some View {
        
        NavigationStack(path: $routes) {
            VStack {
                Button("Movie Details") {
                    routes.append(.detail(Movie(name: "Lord of the Rings")))
                }
                
            }.navigationDestination(for: Route.self) { route in
                switch route {
                case .create:
                    Text("Create")
                case .detail(let movie):
                    MovieDetailsView(movie: movie)
                case .login:
                    Text("Login")
                    // LoginScreen
                case .register:
                    Text("Register")
                    //RegisterScreen
                case .reviews(let reviews):
                    ReviewListScreen(reviews: reviews)
                    
                }
            }
        }
        
    }
}

#Preview {
    SecondView()
}
