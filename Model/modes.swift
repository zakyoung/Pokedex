//
//  modes.swift
//  pokedex
//
//  Created by Zak Young on 3/24/24.
//

import Foundation

enum modes: String, CaseIterable, Identifiable{
    case cardMode = "Cards by type"
    case listMode = "View all"
    var id: Self {
        return self
    }
}
