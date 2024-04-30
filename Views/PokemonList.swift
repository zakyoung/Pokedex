//
//  PokemonList.swift
//  pokedex
//
//  Created by Zak Young on 3/24/24.
//

import SwiftUI

struct PokemonList: View {
    @EnvironmentObject var pokeManager: PokeManager
    var body: some View {
            HStack{
                Spacer()
                Picker("Filter by", selection: $pokeManager.filterSelection){
                    ForEach(filterOptions.allCases){ filte in
                        Text(filte.rawValue).tag(filte)
                    }
                }.padding(.trailing, 10)
            }
            List{
                ForEach(pokeManager.filterValues(), id: \.self.id){ poke in
                    NavigationLink(destination: Info(pokemon: poke)
                        .navigationTitle(poke.name)) {
                        PokeListItem(pokemon: poke)
                    }
                }
            }
            .listStyle(.plain)
        }
}

#Preview {
    PokemonList()
        .environmentObject(PokeManager())
}
