//
//  ContentView.swift
//  pokedex
//
//  Created by Zak Young on 3/14/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var pokeManager: PokeManager
    var body: some View {
        NavigationStack{
            Picker("Select Sort mode", selection: $pokeManager.currentMode){
                ForEach(modes.allCases){ mode in
                    Text(mode.rawValue)
                }
            }
            .pickerStyle(.segmented)
            if pokeManager.currentMode == .cardMode{
                HomeView()
                    .navigationTitle("Pokédex")
                    .navigationBarTitleDisplayMode(.inline)
            }
            else{
                PokemonList()
                    .navigationTitle("Pokédex")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(PokeManager())
}
