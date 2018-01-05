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
    
    @IBOutlet weak var selectedPokemon: UILabel!

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
