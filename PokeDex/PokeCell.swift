//
//  PokeCell.swift
//  PokeDex
//
//  Created by X on 12/29/17.
//  Copyright © 2017 X. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    required init? (coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configureCell (pokemon: Pokemon)
    {
        self.pokemon = pokemon;
        nameLabel.text = self.pokemon.name.capitalized;
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)");
        
    }
    
}
