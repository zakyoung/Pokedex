//
//  PokeGradient.swift
//  pokedex
//
//  Created by Zak Young on 3/15/24.
//

import Foundation
import SwiftUI
extension LinearGradient {
    init(pokemon: Pokemon) {
        let allColors = pokemon.types.map { type in
            Color(pokemonType: type)
        }
        self = LinearGradient(gradient: Gradient(colors: allColors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
