//
//  PokeManager.swift
//  pokedex
//
//  Created by Zak Young on 3/14/24.
//


import Foundation
import SwiftUI
class PokeManager: ObservableObject {
    @Published var allPokemons: [Pokemon] = []
    @Published var pokemonByType: [PokemonType:[Pokemon]] = [:]
    @Published var currentMode : modes = .cardMode
    @Published var filterSelection: filterOptions = .all
    init() {
        loadPokemons()
        sortByType()
    }
    func loadPokemons(){
        if let url = Bundle.main.url(forResource: "pokedex", withExtension: "json"){
            do{
                let content = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                allPokemons = try decoder.decode([Pokemon].self, from: content)
            }
            catch{
                print("ERROR")
            }
        }
        else{
            print("ERROR")
        }
    }
    func sortByType(){
        var local: [PokemonType: [Pokemon]] = [:]
        for pokemon in allPokemons{
            for typ in pokemon.types{
                if local[typ] != nil{
                    local[typ]!.append(pokemon)
                }
                else{
                    local[typ] = [pokemon]
                }
            }
        }
        pokemonByType = local
    }
    func filterByType(poke: PokemonType) -> [Pokemon]{
        return pokemonByType[poke]!
    }
    func captured() -> [Pokemon]{
        return allPokemons.filter({ $0.captured})
    }
    func updateCapturePokemon(pokeName: String, boolVal: Bool){
        for pokeInd in allPokemons.indices{
            if allPokemons[pokeInd].name == pokeName{
                allPokemons[pokeInd].captured = boolVal
            }
        }
    }
    func getCapturedStatus(pokeName: String) -> Bool{
        for pokeInd in allPokemons.indices{
            if allPokemons[pokeInd].name == pokeName{
                if allPokemons[pokeInd].captured == true{
                    return true
                }
                return false
            }
        }
        return false
    }
    func getPokemonById(pokeId: Int) -> Pokemon{
        for pokeInd in allPokemons.indices{
            if allPokemons[pokeInd].id == pokeId{
                return allPokemons[pokeInd]
            }
        }
        return allPokemons[0]
    }
    func savePokemonStates(){
        if let url = Bundle.main.url(forResource: "pokedex", withExtension: "json"){
            do{
                let encoder = JSONEncoder()
                let data = try encoder.encode(allPokemons)
                try data.write(to: url, options: .atomicWrite)
            }
            catch{
                print("ERROR")
            }
        }
    }
    func filterValues() -> [Pokemon]{
        if filterSelection == .all{
            return allPokemons
        }
        else{
            return pokemonByType[PokemonType(rawValue: filterSelection.rawValue)!]!
        }
    }
}


