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
		


        // Do any additional setup after loading the view.
    }

	@IBAction func backButtonPressed(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}

}
