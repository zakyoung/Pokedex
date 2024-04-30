//
//  CardView.swift
//  pokedex
//
//  Created by Zak Young on 3/24/24.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var pokeManager: PokeManager
    var pokemon: Pokemon
    var body: some View {
                HStack{
                    Spacer()
                    ZStack{
                        LinearGradient(pokemon: pokemon)
                            .frame(width: 175, height: 225)
                            .border(Color.black, width: 3)
                        VStack{
                            Spacer().frame(height: 20)
                            HStack{
                                Spacer()
                                Text(pokemon.name)
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .foregroundStyle(.black)
                                if pokeManager.getCapturedStatus(pokeName: pokemon.name){
                                    Image("pokeClosed")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 35)
                                }
                                Spacer()
                            }.padding(.bottom, 0)
                            Image(String(format: "%03d", pokemon.id))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 175)
                        }
                    }
                    Spacer()
                }
        }
}

#Preview {
    CardView(pokemon: PokeManager().allPokemons[0])
        .environmentObject(PokeManager())
}
