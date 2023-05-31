//
//  GlouGlouView.swift
//  SwaquAppli
//
//  Created by di pasquale paolo on 29/03/2023.
//

import SwiftUI

struct GlouGlouView: View {
    var body: some View {
        
        ZStack{
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack{
                Text("Tu as bu...")
                    .padding()
                    .font(Font.custom("Extra Light" ,size: 40))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text("2 litres aujourd'hui !")
                    .padding()
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text("C'est pas assez... BOIS de l'H2O dans :")
                
                Button(action: {
                            // Action à exécuter lorsque le bouton est pressé
                            // Vous pouvez ajouter votre propre code ici
                            print("Le bouton a été pressé")
                        }) {
                            Text("Un pot de moutarde amora")
                                .font(.headline)
                                .padding()
                                .background(Color.init(red:23/255,green: 54/255, blue: 99/255))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }.frame(maxWidth: .infinity)
                
                Button(action: {
                            // Action à exécuter lorsque le bouton est pressé
                            // Vous pouvez ajouter votre propre code ici
                            print("Le bouton a été pressé")
                        }) {
                            Text("Verre classique")
                                .font(.headline)
                                .padding()
                                .background(Color.init(red:23/255,green: 54/255, blue: 99/255))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }.frame(maxWidth: .infinity)
                Button(action: {
                            // Action à exécuter lorsque le bouton est pressé
                            // Vous pouvez ajouter votre propre code ici
                            print("Le bouton a été pressé")
                        }) {
                            Text("Simple gorgée")
                                .font(.headline)
                                .padding()
                                .background(Color.init(red:23/255,green: 54/255, blue: 99/255))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }.frame(maxWidth: .infinity)
                Button(action: {
                            // Action à exécuter lorsque le bouton est pressé
                            // Vous pouvez ajouter votre propre code ici
                            print("Le bouton a été pressé")
                        }) {
                            Text("Bouteille 50cl")
                                .font(.headline)
                                .padding()
                                .background(Color.init(red:23/255,green: 54/255, blue: 99/255))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .frame(maxWidth: .infinity)
                Button(action: {
                            // Action à exécuter lorsque le bouton est pressé
                            // Vous pouvez ajouter votre propre code ici
                            print("Le bouton a été pressé")
                        }) {
                            Text("Bouteille 1,5L")
                                .font(.headline)
                                .padding()
                                .background(Color.init(red:23/255,green: 54/255, blue: 99/255))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        
    }
        
    
}

struct GlouGlouView_Previews: PreviewProvider {
    static var previews: some View {
        GlouGlouView()
    }
}
