//
//  Pokemon.swift
//  Lab 5
//
//  Created by Kendal Smith on 3/10/21.
//

import Foundation

struct Pokemon: Decodable{
    let pokemon_name: String
    let base_attack: Int
}

struct PokemonData: Decodable{
    var body = [Pokemon]()
}


