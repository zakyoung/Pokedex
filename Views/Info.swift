//
//  Info.swift
//  pokedex
//
//  Created by Zak Young on 3/14/24.
//

import SwiftUI

struct Info: View {
    var pokemon: Pokemon
    @EnvironmentObject var pokeManager: PokeManager
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .center){
                HStack{
                    Spacer()
                    ZStack{
                        LinearGradient(pokemon: pokemon)
                            .frame(width: 350, height: 350)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                        Image(String(format: "%03d", pokemon.id))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 275, height: 275)
                        Image(pokeManager.getCapturedStatus(pokeName: pokemon.name) ? "pokeClosed" : "pokeOpen")
                            .resizable()
                            .onTapGesture {
                                pokeManager.updateCapturePokemon(pokeName: pokemon.name, boolVal: !pokeManager.getCapturedStatus(pokeName: pokemon.name))
                            }
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .offset(CGSize(width: 140, height: -140))
                    }
                    Spacer()
                }
                HStack{
                    Spacer()
                    Text("Height")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 20))
                    Spacer()
                    Text("Weight")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 20))
                    Spacer()
                }
                HStack{
                    Spacer()
                    HStack(spacing: 0){
                        Text("\(String(format: "%.2f", pokemon.height))")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 32))
                        Text(" m")
                    }
                    Spacer()
                    HStack(spacing: 0){
                        Text("\(String(format: "%.2f", pokemon.weight))")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 32))
                        Text(" kg")
                    }
                    Spacer()
                }
                HStack{
                    Text("Types")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 20))
                        .padding(.leading, 15)
                        .padding(.top, 10)
                    Spacer()
                }
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(pokemon.types, id: \.self.id){ type in
                            Text("\(type)".capitalized)
                                .padding(15)
                                .background(Color(pokemonType: type))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .foregroundStyle(Color.white)
                        }
                    }
                }
                .padding(.leading, 15)
                HStack{
                    Text("Weaknesses")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 20))
                        .padding(.leading, 15)
                    Spacer()
                }
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(pokemon.weaknesses, id: \.self.id){ weakness in
                            Text("\(weakness)".capitalized)
                                .padding(14)
                                .background(Color(pokemonType: weakness))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .foregroundStyle(Color.white)
                        }
                    }
                    .padding(.leading, 15)
                }
                
                if let prev = pokemon.prev_evolution {
                    if !pokemon.prev_evolution!.isEmpty{
                        HStack{
                            Text("Previous Evolutions")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 20))
                                .padding(.leading, 15)
                            Spacer()
                        }
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(prev, id: \.self) { pokeId in
                                    let poke = pokeManager.getPokemonById(pokeId: Int(pokeId))
                                    NavigationLink(destination: Info(pokemon: poke)
                                        .navigationTitle(poke.name)) {
                                            CardView(pokemon: poke)
                                        }
                                }
                            }
                        }
                    }
                }
                if let prev = pokemon.next_evolution {
                    if !pokemon.next_evolution!.isEmpty{
                        HStack{
                            Text("Next Evolutions")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 20))
                                .padding(.leading, 15)
                            Spacer()
                        }
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(prev, id: \.self) { pokeId in
                                    let poke = pokeManager.getPokemonById(pokeId: Int(pokeId))
                                    NavigationLink(destination: Info(pokemon: poke)
                                        .navigationTitle(poke.name)) {
                                            CardView(pokemon: poke)
                                        }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

