//
//  Pokemon.swift
//  pokedex
//
//  Created by Zak Young on 3/14/24.
//

import Foundation

struct Pokemon{
    var id: Int
    var name: String
    var types: [PokemonType]
    var height: Double
    var weight: Double
    var weaknesses: [PokemonType]
    var next_evolution: [Double]?
    var  prev_evolution: [Double]?
    var captured: Bool
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
        case types = "types"
        case height = "height"
        case weight = "weight"
        case weaknesses = "weaknesses"
        case prev_evolution = "prev_evolution"
        case next_evolution = "next_evolution"
        case captured = "captured"
        
    }
}
extension Pokemon: Decodable{
    init(from decoder: Decoder) throws {
        let baseValues = try decoder.container(keyedBy: CodingKeys.self)
        id = try baseValues.decode(Int.self, forKey: .id)
        name = try baseValues.decode(String.self, forKey: .name)
        types = try baseValues.decodeIfPresent([PokemonType].self, forKey: .types) ?? []
        weaknesses = try baseValues.decodeIfPresent([PokemonType].self, forKey: .weaknesses) ?? []
        next_evolution = try baseValues.decodeIfPresent([Double].self, forKey: .next_evolution) ?? []
        prev_evolution = try baseValues.decodeIfPresent([Double].self, forKey: .prev_evolution) ?? []
        height = try baseValues.decode(Double.self, forKey: .height)
        weight = try baseValues.decode(Double.self, forKey: .weight)
        captured = try baseValues.decodeIfPresent(Bool.self, forKey: .captured) ?? false
    }
}
extension Pokemon: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(types, forKey: .types)
        try container.encodeIfPresent(weaknesses, forKey: .weaknesses)
        try container.encodeIfPresent(next_evolution, forKey: .next_evolution)
        try container.encodeIfPresent(prev_evolution, forKey: .prev_evolution)
        try container.encode(height, forKey: .height)
        try container.encode(weight, forKey: .weight)
        try container.encodeIfPresent(captured, forKey: .captured)
    }
}
