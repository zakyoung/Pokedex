//
//  filterOptions.swift
//  pokedex
//
//  Created by Zak Young on 3/24/24.
//

import Foundation

enum filterOptions: String, Codable, Identifiable, CaseIterable {
    var id: String { self.rawValue }
    case all = "All"
    case bug = "Bug"
    case dragon = "Dragon"
    case electric = "Electric"
    case fighting = "Fighting"
    case fire = "Fire"
    case flying = "Flying"
    case ghost = "Ghost"
    case grass = "Grass"
    case ground = "Ground"
    case ice = "Ice"
    case normal = "Normal"
    case poison = "Poison"
    case psychic = "Psychic"
    case rock = "Rock"
    case water = "Water"
}
