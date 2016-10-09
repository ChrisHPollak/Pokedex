//
//  Pokemon.swift
//  Pokedex
//
//  Created by Christopher Harrington Pollak on 10/9/16.
//  Copyright © 2016 Christopher Harrington Pollak. All rights reserved.
//

import Foundation

class Pokemon {
	
	fileprivate var _name: String!
	fileprivate var _pokedexID: Int!
	
	var name: String {
		return _name
	}
	
	var pokedexID: Int {
		return _pokedexID
	}
	
	init(name: String, pokedexID: Int) {
		self._name = name
		self._pokedexID = pokedexID
	}
}
