//
//  ConnectionView.swift
//  SwaquAppli
//
//  Created by di pasquale paolo on 29/03/2023.
//

import SwiftUI

struct ConnectionView: View {
    @State private var userName: String = ""
    @State private var userPassword: String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Swaqua")
                    .foregroundColor(Color.white)
                    .font(Font.largeTitle)
                    .padding()
                
                Text("Connectez-vous !")
                    .foregroundColor(Color.white)
                    .font(Font.title2)
                
                TextField("Nom d'utilisateur", text: $userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .padding()
                SecureField("Mot de passe", text: $userPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                NavigationLink(destination: GlouGlouView()){
                    Text("Connexion")
                        .frame(width: 300, height: 50)
                        .background(Color.init(red:23/255,green: 54/255, blue: 99/255))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.bottom, 60)
                }
                
                Button(action: qlqchose) {
                    Text("Pas de compte ? Créez-en un !")
                        .foregroundColor(Color.white)
                        .underline()
                }
                
            }.background(Color.init(red:27/255, green: 87/255, blue: 178/255))
        }
    }
}

func qlqchose(){
    
}

struct ConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionView()
    }
}
