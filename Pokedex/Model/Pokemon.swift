//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ulices Meléndez on 8/12/17.
//  Copyright © 2017 Ulices Meléndez Acosta. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionName: String!
    private var _pokemonURL: String!
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(_pokedexId!)/"
    }
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var weight: String {
        return _weight != nil ? _weight : ""
    }
    
    var height: String {
        return _height != nil ? _height : ""
    }
    
    var defense: String {
        return _defense != nil ? _defense : ""
    }
    
    var attack: String {
        return _attack != nil ? _attack : ""
    }
    
    var type: String {
        return _type != nil ? _type : ""
    }
    
    func fetchPokemonDetail(completed: @escaping fetchComplete) {
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            
            if let json = response.result.value as? Dictionary<String, Any> {
                
                if let weight = json["weight"] as? Int {
                    self._weight = "\(weight)"
                }
                
                if let height = json["height"] as? Int {
                    self._height = "\(height)"
                }
                
                if let stats = json["stats"] as? [Dictionary<String, Any>] , stats.count > 0 {
                    for item in stats {
                        if let stat = item["stat"] as? Dictionary<String, Any> {
                            if stat["name"] as? String == "defense" {
                                self._defense = "\(item["base_stat"]!)"
                            }
                            
                            if stat["name"] as? String == "attack" {
                                self._attack = "\(item["base_stat"]!)"
                            }
                        }
                    }
                }
                
                if let types = json["types"] as? [Dictionary<String, Any>] , types.count > 0 {
                    
                    if let firstType = types[0]["type"] as? Dictionary<String, String> {
                        self._type = firstType["name"]!.capitalized
                    }
                    
                    if types.count > 1 {
                        for index in 1..<types.count {
                            if let type = types[index]["type"] as? Dictionary<String, String> {
                                self._type! += "/\(type["name"]!.capitalized)"
                            }
                        }
                    }
                }
            }
            completed()
        }
    }
}
