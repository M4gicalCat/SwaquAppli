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
    @AppStorage("jwt") var jwt: String = "nothing"
    @State private var connected = false
    
    var body: some View {
        if connected {
            GlouGlouView()
        } else {
            NavigationView {
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
                    
                    
                    Button(action: checkAccount){
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
    }
    
    func checkAccount() {
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
        
        createAccount()
        
        
    }
    
    func createAccount() {
        guard let url = URL(string: "https://swaquapi.pfaisand.fr/auth/register") else {
            return
        }
        
        let body: [String: Any] = [
            "name": userName,
            "password": userPassword
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: body)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    showAlert = true
                    alertTitle = "Une erreur s'est produite"
                    alertMessage = "Veuillez réessayer"
                    print("error: \(error.localizedDescription)")
                    return
                }

                guard let data = data else {
                    showAlert = true
                    alertTitle = "Erreur"
                    alertMessage = "Une erreur est survenue, veuillez réessayer 0"
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    let decoder = JSONDecoder()
                    if httpResponse.statusCode == 200 {
                        print("youpi 200")
                        do {
                            let response = try decoder.decode(SwallowerResponse.self, from: data)
                            print("youpi hha")
                            jwt = response.token
                            
                            DispatchQueue.main.async {
                                connected = true
                            }
                            return
                            
                        } catch let error {
                            print(error.localizedDescription)
                            showAlert = true
                            alertTitle = "Erreur"
                            alertMessage = "Une erreur est survenue, veuillez réessayer 1"
                            return
                        }
                    } else {
                        do {
                            let errorResponse = try decoder.decode(AuthError.self, from: data)
                            
                            showAlert = true
                            alertTitle = "Erreur"
                            alertMessage = errorResponse.message
                            return
                        } catch {
                            showAlert = true
                            alertTitle = "Erreur"
                            alertMessage = "Une erreur est survenue, veuillez réessayer 2"
                        }
                        
                    }
                }
            }.resume()
        }
        catch {
            showAlert = true
            alertTitle = "Erreur"
            alertMessage = "Une erreur est survenue, veuillez réessayer 3"
            return
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
