//
//  LoginScreen.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 11.11.25.
//

import SwiftUI

struct LoginScreen: View {
    @Environment(\.navigate) private var navigate
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Login Screen")
                .font(.largeTitle)
                .bold()
            
            Button("Go to Register") {
                navigate(.push(.register))
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button("Go to Movie Details") {
                navigate(.push(.detail(Movie(name: "Inception"))))
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .navigationTitle("Login")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LoginScreen()
    }
}