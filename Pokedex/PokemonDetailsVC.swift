//
//  PokemonDetailsVC.swift
//  Pokedex
//
//  Created by Christopher Harrington Pollak on 10/9/16.
//  Copyright © 2016 Christopher Harrington Pollak. All rights reserved.
//

import UIKit

class PokemonDetailsVC: UIViewController {
	
	@IBOutlet weak var mainImageView: UIImageView!
	@IBOutlet weak var currenteEvoImageView: UIImageView!
	@IBOutlet weak var nextEvoImageView: UIImageView!
	
	@IBOutlet weak var pokemonNameLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var typeLabel: UILabel!
	@IBOutlet weak var defenseLabel: UILabel!
	@IBOutlet weak var heightLabel: UILabel!
	@IBOutlet weak var widthLabel: UILabel!
	@IBOutlet weak var pokedexIDLabel: UILabel!
	@IBOutlet weak var attackLabel: UILabel!
	@IBOutlet weak var evolutionLabel: UILabel!
	
	var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		pokemonNameLabel.text = pokemon.name.capitalized
		mainImageView.image = UIImage(named: "\(pokemon.pokedexID)")
		currenteEvoImageView.image = UIImage(named: "\(pokemon.pokedexID)")
		pokedexIDLabel.text = "\(pokemon.pokedexID)"
		
		pokemon.downloadPokemonDetails {
			
			//will only be called after the network call is complete
			self.updateUI()
		}

    }

	@IBAction func backButtonPressed(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	func updateUI() {
		
		attackLabel.text = pokemon.attack
		defenseLabel.text = pokemon.defense
		heightLabel.text = pokemon.height
		widthLabel.text = pokemon.weight
		typeLabel.text = pokemon.type
		descriptionLabel.text = pokemon.description
		
		if pokemon.nextEvolutionID == "" {
			evolutionLabel.text = "No mo evolutions"
			nextEvoImageView.isHidden = true
			
		} else {
			
			nextEvoImageView.isHidden = false
			nextEvoImageView.image = UIImage(named: "\(pokemon.nextEvolutionID)")
			let evoString = "Next Evolution: \(pokemon.nextEvolutionName.capitalized) LVL \(pokemon.nextEvolutionLevel)"
			evolutionLabel.text = evoString
			
		}
		
	}

}
