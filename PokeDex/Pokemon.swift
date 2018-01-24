//
//  Pokemon.swift
//  PokeDex
//
//  Created by X on 12/12/17.
//  Copyright © 2017 X. All rights reserved.
//

import Foundation

class Pokemon{

    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defence: String!
    private var _weight: String!
    private var _height: String!
    private var _attack: String!
    private var _nextEvo: String!
    
    
    var name: String{
        return _name;
    }
    
    var pokedexId: Int{
        return _pokedexId;
    }

    init(name: String, pokedexId: Int)
    {
        self._name = name;
        self._pokedexId = pokedexId;
    }
}
