//
//  MainVC.swift
//  Pokedex
//
//  Created by Christopher Harrington Pollak on 10/9/16.
//  Copyright © 2016 Christopher Harrington Pollak. All rights reserved.
//

import UIKit
import AVFoundation


class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
	
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var searchBar: UISearchBar!
	
	var pokemons = [Pokemon]()
	var filteredPokemons = [Pokemon]()
	var musicPlayer: AVAudioPlayer!
	var inSearchMode = false

	override func viewDidLoad() {
		super.viewDidLoad()

		collectionView.delegate = self
		collectionView.dataSource = self
		searchBar.delegate = self
		
		searchBar.returnKeyType = UIReturnKeyType.done
		
		parsePokemonCSV()
		initAudio()
	}
	
	func initAudio() {
		
		let path = Bundle.main.path(forResource: "music", ofType: "mp3")!
		
		do {
			
			musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path)!)
			musicPlayer.prepareToPlay()
			musicPlayer.numberOfLoops = -1
			musicPlayer.play()
			musicPlayer.pause()
			
		} catch let error as NSError {
			print(error)
		}
	}
	
	func parsePokemonCSV() {
		
		let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")
		
		do {
			
			let csv = try CSV(contentsOfURL: path!)
			let rows = csv.rows
			
			for row in rows {
				let pokeID = Int(row["id"]!)!
				let name = row["identifier"]!
				
				let poke = Pokemon(name: name, pokedexID: pokeID)
				pokemons.append(poke)
			}
			
		} catch let error as NSError {
			
			print(error)
		}
		
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
			
			let pokemon: Pokemon!
			
			if inSearchMode {
				pokemon = filteredPokemons[indexPath.row]
			} else {
				pokemon = pokemons[indexPath.row]
			}
			
			cell.configPokemon(pokemon)
			return cell
			
		} else {
			
			return UICollectionViewCell()
		}
	}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		var pokemon: Pokemon!
		
		if inSearchMode {
			pokemon = filteredPokemons[indexPath.row]
		} else {
			pokemon = pokemons[indexPath.row]
		}
		
		performSegue(withIdentifier: "PokemonDetailsVC", sender: pokemon)
		
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		if inSearchMode {
			return filteredPokemons.count
		}
		
		return pokemons.count
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 105, height: 105)
	}

	@IBAction func musicButtonPressed(_ sender: UIButton) {
		
		if musicPlayer.isPlaying {
			musicPlayer.pause()
			sender.alpha = 0.2
			
		} else {
			musicPlayer.play()
			sender.alpha = 1.0
		}
	}
	
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		
		if searchBar.text == nil || searchBar.text == "" {
			
			inSearchMode = false
			collectionView.reloadData()
			view.endEditing(true)
			
		} else {
			
			inSearchMode = true
			
			let lower = searchBar.text!.lowercased()
			
			filteredPokemons = pokemons.filter({$0.name.range(of: lower) != nil})
			collectionView.reloadData()
		}
	}
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		view.endEditing(true)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		if segue.identifier == "PokemonDetailsVC" {
			if let pokemonDetailsVC = segue.destination as? PokemonDetailsVC {
				if let pokemon = sender as? Pokemon {
					pokemonDetailsVC.pokemon = pokemon
				}
			}
		}
	}
}

