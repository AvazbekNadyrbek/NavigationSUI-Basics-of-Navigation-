//
//  RegisterScreen.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 11.11.25.
//

import SwiftUI

struct RegisterScreen: View {
    @Environment(Router.self) private var router
    
    var body: some View {

        VStack {
            Text("Register Screen")
                .font(.largeTitle)
                .padding()
            
            Button("Go to Movie Detai ls Screen") {
                router.addRoute(.detail(Movie(name:"Lord of Screen")))
            }
            
            Button("Pop to Root") {
                router.popToRoot()
            }
        }
    }
}

#Preview {
    RegisterScreen()
}
