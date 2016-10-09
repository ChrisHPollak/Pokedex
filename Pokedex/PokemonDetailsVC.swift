//
//  PokemonDetailsVC.swift
//  Pokedex
//
//  Created by Christopher Harrington Pollak on 10/9/16.
//  Copyright © 2016 Christopher Harrington Pollak. All rights reserved.
//

import UIKit

class PokemonDetailsVC: UIViewController {
	
	@IBOutlet weak var name: UILabel!
	
	var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		name.text = pokemon.name

        // Do any additional setup after loading the view.
    }


}
