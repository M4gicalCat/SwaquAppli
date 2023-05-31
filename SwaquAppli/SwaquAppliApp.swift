//
//  SwaquAppliApp.swift
//  SwaquAppli
//
//  Created by di pasquale paolo on 29/03/2023.
//

import SwiftUI

@main
struct SwaquAppliApp: App {
    @AppStorage("jwt") var jwt: String = "nothing"
    @State private var navigateToHomeView = false
    var body: some Scene {
        WindowGroup {
            if navigateToHomeView {
                GlouGlouView()
            } else {
                ContentView()
                    .onAppear {
                        reloadToken()
                    }
            }
        }
    }
    
    func reloadToken() {
        print("https://swaquapi.pfaisand.fr/auth/refresh?token=\(jwt)")
        guard let url = URL(string: "https://swaquapi.pfaisand.fr/auth/refresh?token=\(jwt)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("ayaaaa \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data ?")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if (httpResponse.statusCode == 200) {
                    do {
                        let decoder = JSONDecoder()
                        let me = try decoder.decode(Swallower.self, from: data)
                        print("me \(me.username), \(me.id), \(me.token)")
                        jwt = me.token
                        DispatchQueue.main.async {
                            navigateToHomeView = true
                        }
                    } catch {
                        print("bruh \(error.localizedDescription)")
                    }
                } else {
                    do {
                        let decoder = JSONDecoder()
                        let errorResponse = try decoder.decode(AuthError.self, from: data)
                        print("Oopsy daisy, \(errorResponse.message)")
                    } catch {
                        print("ERREUR DANS UNE ERREUR: \(error.localizedDescription)")
                    }
                }
            }
        }.resume()
    }
}
