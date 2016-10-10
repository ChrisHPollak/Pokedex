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
	private var _description: String!
	private var _type: String!
	private var _defense: String!
	private var _attack: String!
	private var _height: String!
	private var _width: String!
	private var _nextEvolution: String!
	
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
