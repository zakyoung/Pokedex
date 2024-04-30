//
//  PokeListItem.swift
//  pokedex
//
//  Created by Zak Young on 3/14/24.
//

import SwiftUI

struct PokeListItem: View {
    var pokemon: Pokemon
    @EnvironmentObject var pokeManager: PokeManager
    var body: some View {
        HStack{
            Text(String(pokemon.id))
                .foregroundColor(Color("ListItemTextColor"))
                .opacity(0.5)
                .font(.system(size: 14))
                .italic()
                .padding(.leading, 5)
            Text(pokemon.name)
                .foregroundColor(Color("ListItemTextColor"))
                .font(.system(size: 18))
            if pokeManager.getCapturedStatus(pokeName: pokemon.name){
                Image("pokeClosed")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
            }
            Spacer()
            ZStack{
                LinearGradient(pokemon: pokemon)
                    .frame(width: 110, height: 110)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                Image(String(format: "%03d", pokemon.id))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 90, height: 90)
                    .background(LinearGradient(pokemon: pokemon))
            }.padding(.trailing, 25)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
