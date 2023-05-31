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
    @AppStorage("jwt") var jwt: String = ""
    @State var connected = false
    
    var body: some View {
        if (connected) {
            GlouGlouView()
        } else {
            NavigationView {
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
                    
//                    NavigationLink(destination: GlouGlouView()){
//                        Text("Connexion")
//                            .frame(width: 300, height: 50)
//                            .background(Color.init(red:23/255,green: 54/255, blue: 99/255))
//                            .cornerRadius(10)
//                            .foregroundColor(.white)
//                            .padding(.bottom, 60)
//
//
//                    }
                    
                    Button(action: login) {
                        Text("Connexion")
                            .font(.headline)
                            .padding()
                            .background(Color.init(red:23/255,green: 54/255, blue: 99/255))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: CreateAccountView()) {
                        Text("Pas de compte ? Créez-en un !")
                            .foregroundColor(Color.white)
                            .underline()
                    }
                    
                }.background(Color.init(red:27/255, green: 87/255, blue: 178/255))
            }
        }
    }
    func login() {
        if userName.isEmpty || userPassword.isEmpty {
            // todo show alert
            return
        }
        guard let url = URL(string: "https://swaquapi.pfaisand.fr/auth/login?username=\(userName)&password=\(userPassword)") else {
            return
        }
        

        var request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
    //                    showAlert = true
    //                    alertTitle = "Une erreur s'est produite"
    //                    alertMessage = "Veuillez réessayer"
                print("error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
    //                    showAlert = true
    //                    alertTitle = "Erreur"
    //                    alertMessage = "Une erreur est survenue, veuillez réessayer 0"
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                let decoder = JSONDecoder()
                if httpResponse.statusCode == 200 {
                    do {
                        let response = try decoder.decode(SwallowerResponse.self, from: data)
                        jwt = response.token
                        
                        DispatchQueue.main.async {
                            connected = true
                        }
                        return
                        
                    } catch let error {
                        print(error.localizedDescription)
    //                            showAlert = true
    //                            alertTitle = "Erreur"
    //                            alertMessage = "Une erreur est survenue, veuillez réessayer 1"
                        return
                    }
                } else {
                    do {
                        let errorResponse = try decoder.decode(AuthError.self, from: data)
                        print("error: \(errorResponse.message)")
    //                            showAlert = true
    //                            alertTitle = "Erreur"
    //                            alertMessage = errorResponse.message
                        return
                    } catch {
    //                            showAlert = true
    //                            alertTitle = "Erreur"
    //                            alertMessage = "Une erreur est survenue, veuillez réessayer 2"
                    }
                    
                }
            }
        }.resume()

    }
}

struct ConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionView()
    }
}
