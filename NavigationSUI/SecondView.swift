//
//  SecondView.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 09.11.25.
//

import SwiftUI
import Observation

struct Movie: Hashable {
    let name: String
}

struct Review: Hashable {
    let subject: String
    let description: String
}

@Observable
class Router {
    var routes: [Route] = []
    
    func addRoute(_ route: Route) {
        routes.append(route)
    }
    
    func unwind(_ route: Route) {
        guard let index = routes.firstIndex(where: { $0 == route }) else { return }
        routes = Array (routes.prefix(upTo: index + 1))
    }
    
    func popToRoot() {
        routes.removeAll()
    }
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
    
    @Environment(Router.self) private var router
    
    var body: some View {
        
        
        VStack {
            Button("Movie Details") {
                router.addRoute(.detail(Movie(name: "Batman")))
            }
            
        }
        
    }
}

struct ContentViewContainer: View {
    
    @State private var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.routes) {
            SecondView()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .create:
                        Text("Create")
                    case .detail(let movie):
                        MovieDetailsView(movie: movie)
                    case .login:
                        LoginScreen() 
                        // LoginScreen
                    case .register:
                        RegisterScreen()
                        //RegisterScreen
                    case .reviews(let reviews):
                        ReviewListScreen(reviews: reviews)
                        
                    }
                }
        }.environment(router)
        
    }
}

#Preview {
    ContentViewContainer()
}
