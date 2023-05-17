//
//  ContentView.swift
//  SwaquAppli
//
//  Created by di pasquale paolo on 29/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Swaqua")
                .font(.largeTitle)
            Text("L'application qui vous aide à rester hydraté !")
                .frame(maxWidth: 300, alignment: .center)
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                                // Action à exécuter lorsque le bouton est pressé
                                // Vous pouvez ajouter votre propre code ici
                                print("Le bouton a été pressé")
                            }) {
                                Text("Se connecter")
                                    .font(.headline)
                                    .padding()
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.init(red:23/255,green: 54/255, blue: 99/255))
                                    .cornerRadius(10)
                            }
                    Spacer()
                }
                HStack {
                    Spacer()
                    Button(action: {
                                // Action à exécuter lorsque le bouton est pressé
                                // Vous pouvez ajouter votre propre code ici
                                print("Le bouton a été pressé")
                            }) {
                                Text("Créer un compte")
                                    .font(.headline)
                                    .padding()
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.init(red:23/255,green: 54/255, blue: 99/255))
                                    .cornerRadius(10)
                            }
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
