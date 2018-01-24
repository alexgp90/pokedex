//
//  DetailViewController.swift
//  PokeDex
//
//  Created by X on 1/5/18.
//  Copyright © 2018 X. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var pokemon: Pokemon!
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var baseattackLabel: UILabel!
    
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var evoLabel: UILabel!
    
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var selectedPokemon: UILabel!

    @IBAction func backButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil);
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        selectedPokemon.text = pokemon.name;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
