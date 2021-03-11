//
//  ViewController.swift
//  Lab 5
//
//  Created by Kendal Smith on 3/10/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var pokemons = [Pokemon]()
    var pokemonDataHandler = PokemonDataHandler()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemons.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let alert = UIAlertController(title: pokemons[indexPath.row].pokemon_name, message: pokemons[indexPath.row].pokemon_name, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonIdentifier", for: indexPath)
        let pokemon = pokemons[indexPath.row]
        cell.textLabel!.text = pokemon.pokemon_name
        return cell
    }
    
    func loadTestData(){
        
        let Pokemon1 = Pokemon(pokemon_name: "Pikachu", base_attack: 118)
        let Pokemon2 = Pokemon(pokemon_name: "Dido", base_attack: 123)
        
        pokemons.append(Pokemon1)
        pokemons.append(Pokemon2)
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //loadTestData()
        
        pokemonDataHandler.onDataUpdate = {[weak self] (data:[Pokemon])in self?.render()}
        
        pokemonDataHandler.loadjson()
        //pokemons = pokemonDataHandler.getPokemon()
    }
    
    func render(){
        pokemons = pokemonDataHandler.getPokemon()
        tableView.reloadData()
    }

}

