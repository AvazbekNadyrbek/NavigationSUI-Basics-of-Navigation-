//
//  RegisterScreen.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 11.11.25.
//

import SwiftUI

struct RegisterScreen: View {
    @Environment(\.navigate) private var navigate
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Register Screen")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Button("Go to Movie Details Screen") {
                navigate(.push(.detail(Movie(name: "Lord of the Rings"))))
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button("Go to Login") {
                navigate(.push(.login))
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .navigationTitle("Register")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        RegisterScreen()
    }
}