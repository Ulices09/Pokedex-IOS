//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ulices Meléndez on 8/12/17.
//  Copyright © 2017 Ulices Meléndez Acosta. All rights reserved.
//

import Foundation

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
    }
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
}
