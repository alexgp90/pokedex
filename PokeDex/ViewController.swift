//
//  ViewController.swift
//  PokeDex
//
//  Created by X on 12/12/17.
//  Copyright © 2017 X. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate{

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var collection: UICollectionView!
    
    var pokemon = [Pokemon]();
    var filteredPokemon = [Pokemon]();
    var inSearchMode = false;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource =  self;
        collection.delegate = self;
        searchBar.delegate = self;
        searchBar.returnKeyType = UIReturnKeyType.done;
        
        
        parsePokemonCSV();
        
        
    }
    
    
    func parsePokemonCSV()
    {
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        do {
        
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows;
            print(rows);
            
            for row in rows {
                let pokeId = Int(row["id"]!)
                let name = row["identifier"]!
                
                let poke = Pokemon(name: name, pokedexId: pokeId!);
                pokemon.append(poke);
                
                
            }
            
            
        } catch let err as NSError
        {
            print(err.debugDescription)
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell
        {
            let poke : Pokemon!
            if inSearchMode
            {
                poke = filteredPokemon[indexPath.row]
                cell.configureCell(pokemon: poke);

            }
            else
            {
                poke = pokemon [indexPath.row]
                cell.configureCell(pokemon: poke);

            }
            
            
            return cell;
        }
        else
        {
        
            return UICollectionViewCell();
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var poke: Pokemon!
        if inSearchMode{
            poke =  filteredPokemon[indexPath.row]
        }
        else
        {
            poke = pokemon[indexPath.row]
        }
        performSegue(withIdentifier: "DetailViewSegue", sender: poke);
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode
        {
        
            return filteredPokemon.count
        }
        
        else
        {
            return pokemon.count;

        }
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110 , height: 110);
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true);
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""
        {
            inSearchMode = false
            collection.reloadData()
            view.endEditing(true)
            
        }
        else{
            inSearchMode = true;
           let lower = searchBar.text!.lowercased()
            filteredPokemon = pokemon.filter({$0.name.range(of: lower) != nil})
            collection.reloadData()
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailViewSegue"
        {
            if let detailsViewController = segue.destination as? DetailViewController{
                if let poke = sender as? Pokemon
                {
                    detailsViewController.pokemon = poke;
                }
            }
        
        }
    }
    
}

