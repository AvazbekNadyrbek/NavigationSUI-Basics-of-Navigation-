//
//  NavigationSUIApp.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 09.11.25.
//

import SwiftUI

@main
struct NavigationSUIApp: App {
    
    @State private var router = Router()
    
    var body: some Scene {
        WindowGroup {
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
}
