//
//  CreateAccountView.swift
//  SwaquAppli
//
//  Created by di pasquale paolo on 31/05/2023.
//

import SwiftUI

struct CreateAccountView: View {
    @State private var userName: String = ""
    @State private var userPassword: String = ""
    @State private var confirmationUserPassword: String = ""
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Swaqua")
                    .foregroundColor(Color.white)
                    .font(Font.largeTitle)
                    .padding(40)
                
                Text("Créez-vous un compte !")
                    .foregroundColor(Color.white)
                    .font(Font.title2)
                    .padding(.bottom, 80)
                
                TextField("Nom d'utilisateur", text: $userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .padding()
                SecureField("Mot de passe", text: $userPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .padding()
                SecureField("Confirmation de mot de passe", text: $confirmationUserPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                
                
                Button(action: createAccount){
                    Text("Créer le compte")
                        .frame(width: 300, height: 50)
                        .background(Color.init(red:23/255,green: 54/255, blue: 99/255))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.bottom, 60)
                }
                
                
                
            }
            .background(Color.init(red:27/255, green: 87/255, blue: 178/255))
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(alertTitle),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"))
                )
                
            }
        }
    }
    
    func createAccount() {
        guard !userName.isEmpty else {
            showAlert = true
            alertTitle = "Erreur"
            alertMessage = "Le nom d'utilisateur est requis."
            return
            
        }
        
        guard !userPassword.isEmpty else {
            showAlert = true
            alertTitle = "Erreur"
            alertMessage = "Le mot de passe est requis."
            return
            
        }
        
        let passwordCharacterSet = CharacterSet(charactersIn: "!@#$%^&*()_-+=[]{}|\\:;\"'<>,.?/~`")
        guard userPassword.rangeOfCharacter(from: passwordCharacterSet) != nil else {
            showAlert = true
            alertTitle = "Erreur"
            alertMessage = "Le mot de passe doit contenir au moins un caractère spécial."
            return
            
        }
        
        guard userPassword == confirmationUserPassword else {
            showAlert = true
            alertTitle = "Erreur"
            alertMessage = "Les mots de passe ne correspondent pas."
            return
            
        }
        
        showAlert = true
        alertTitle = "Succès"
        alertMessage = "Le compte utilisateur a été créé avec succès."
        
       }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
