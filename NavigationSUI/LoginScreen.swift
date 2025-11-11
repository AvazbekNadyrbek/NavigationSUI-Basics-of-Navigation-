//
//  LoginScreen.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 11.11.25.
//

import SwiftUI

struct LoginScreen: View {
    
    @Environment(Router.self) private var router
    
    var body: some View {
        VStack {
            Text("LoginScreen")
            Button("Go to register") {
                router.addRoute(.register)
            }
        }
        
    }
}

#Preview {
    LoginScreen()
}
