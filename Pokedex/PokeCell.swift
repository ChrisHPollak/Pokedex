//
//  PokeCell.swift
//  Pokedex
//
//  Created by Christopher Harrington Pollak on 10/9/16.
//  Copyright © 2016 Christopher Harrington Pollak. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
	
	@IBOutlet weak var thumbImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	
	var pokemon: Pokemon!
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		layer.cornerRadius = 5.0
	}
	
	func configPokemon(_ pokemon: Pokemon) {
		
		self.pokemon = pokemon
		self.nameLabel.text = self.pokemon.name.capitalized
		self.thumbImage.image = UIImage(named: "\(self.pokemon.pokedexID)")
	}
    
}
