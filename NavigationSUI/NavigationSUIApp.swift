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
                        case .register:
                            RegisterScreen()
                        case .reviews(let reviews):
                            ReviewListScreen(reviews: reviews)
                        }
                    }
            }
            .environment(\.navigate, NavigateAction(action: performNavigate))
            .environment(router)
        }
    }
    
    func performNavigate(_ navigationType: NavigationType) {
        switch navigationType {
        case .push(let route):
            router.routes.append(route)
        case .unwind(let route):
            guard let index = router.routes.firstIndex(where: { $0 == route }) else { return }
            router.routes = Array(router.routes.prefix(upTo: index + 1))
        }
    }
}