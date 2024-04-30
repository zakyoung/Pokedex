//
//  HomeView.swift
//  pokedex
//
//  Created by Zak Young on 3/24/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var pokeManager: PokeManager
    let columns = [GridItem(.flexible())]
    var body: some View {
            ScrollView{
                LazyVGrid(columns: columns){
                    if !pokeManager.captured().isEmpty{
                        HStack{
                            Text("Captured")
                                .fontWeight(.bold)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            Spacer()
                        }
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(pokeManager.captured(), id: \.id){ poke in
                                    NavigationLink(destination: Info(pokemon: poke)
                                        .navigationTitle(poke.name)) {
                                            CardView(pokemon: poke)
                                        }
                                }
                            }
                        }
                    }
                    ForEach(Array(pokeManager.pokemonByType.keys.sorted(by: {$0.rawValue < $1.rawValue})), id: \.self.id){ pokeKey in
                        HStack{
                            Text(pokeKey.rawValue)
                                .fontWeight(.bold)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            Spacer()
                        }
                        ScrollableCard(pokeType: pokeKey)
                    }
                }.padding()
            }
    }
}

#Preview {
    HomeView()
        .environmentObject(PokeManager())
}
