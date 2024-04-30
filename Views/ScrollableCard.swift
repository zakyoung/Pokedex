//
//  ScrollableCard.swift
//  pokedex
//
//  Created by Zak Young on 3/24/24.
//

import SwiftUI

struct ScrollableCard: View {
    @EnvironmentObject var pokeManager: PokeManager
    var pokeType: PokemonType
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(Array(pokeManager.filterByType(poke: pokeType)), id: \.self.id){ poke in
                    NavigationLink(destination: Info(pokemon: poke)
                        .navigationTitle(poke.name)) {
                        CardView(pokemon: poke)
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollableCard(pokeType: PokemonType.bug)
        .environmentObject(PokeManager())
}
