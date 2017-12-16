//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Ulices Meléndez on 9/12/17.
//  Copyright © 2017 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    
    var pokemon: Pokemon!
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexIdLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var evolutionLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setExistingValues()
        
        pokemon.fetchPokemonDetail {
            self.updateUI()
        }
    }
    
    func updateUI() {
        weightLabel.text = pokemon.weight
        heightLabel.text = pokemon.height
        pokedexIdLabel.text = "\(pokemon.pokedexId)"
        defenseLabel.text = pokemon.defense
        attackLabel.text = pokemon.attack
        typeLabel.text = pokemon.type
    }
    
    func setExistingValues() {
        
        nameLabel.text = pokemon.name.capitalized
        
        let currentImage = UIImage(named: "\(pokemon.pokedexId)")
        mainImage.image = currentImage
        currentEvoImage.image = currentImage
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
