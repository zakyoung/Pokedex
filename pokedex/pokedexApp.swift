//
//  pokedexApp.swift
//  pokedex
//
//  Created by Zak Young on 3/14/24.
//

import SwiftUI

@main
struct pokedexApp: App {
    @StateObject var pokeManager: PokeManager = PokeManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pokeManager)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification)){ _ in
                    pokeManager.savePokemonStates()
                }
        }
    }
}
