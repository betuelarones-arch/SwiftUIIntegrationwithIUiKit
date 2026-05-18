//
//  ContentView.swift
//  semana09
//
//  Created by Tecsup on 18/05/26.
//

//Ejercicio 1 descomentar
import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Text("Vista SwiftUI arriba")
//                .font(.title2)
//                .padding()
//            MiViewControllerRepresentable()
//                .frame(height: 300)
//            Text("Vista SwiftUI abajo")
//                .font(.title2)
//                .padding()
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}
import MapKit

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Mapa desde UIKit")
                .font(.title2)
                .padding()

            MiMapaRepresentable()
                .frame(height: 600)
                .cornerRadius(12)
                .shadow(radius: 5)

            Text("Ubicación: Lima, Perú")
                .font(.subheadline)
                .foregroundStyle(Color.green)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

