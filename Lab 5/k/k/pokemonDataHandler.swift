//
//  pokemonDataHandler.swift
//  Lab 5
//
//  Created by Kendal Smith on 3/11/21.
//

import Foundation

class PokemonDataHandler{
    var pokemonData = PokemonData()
    
    var onDataUpdate: ((_ data: [Pokemon]) -> Void)?
    
    func loadjson(){
        //https://rapidapi.com/Chewett/api/pokemon-go1?endpoint=apiendpoint_0476b153-d8da-411c-9d22-e3647049e929
        let headers = [
            "x-rapidapi-key": "cc6113d43amshff43e54f9430dfcp1fe24djsndb2b4c6c7b04",
            "x-rapidapi-host": "pokemon-go1.p.rapidapi.com"
        ]
        
        let urlPath = "https://pokemon-go1.p.rapidapi.com/pokemon_stats.json"
        guard let url = URL(string: urlPath)
        else{
            print("url error")
            return
        }
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
                                                
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error)
            in
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            print(statusCode)
            guard statusCode == 200
            else{
                print("file download error")
                return
            }
        
            print("download complete")
            
            DispatchQueue.main.async {self.parsejson(data!)}
        })
        session.resume()
    }
    
    func parsejson(_ data:Data){
        do
        {
            let apiData = try JSONDecoder().decode(PokemonData.self, from:data)
            for pokemon in apiData.body
            {
                pokemonData.body.append(pokemon)
                print(pokemon)
            }
            print(pokemonData.body.count)
        }
        catch let jsonErr{
            print("json error")
            print(jsonErr.localizedDescription)
            return
        }
        print("parsejson done")
        onDataUpdate?(pokemonData.body)
    }
    
    func getPokemon() -> [Pokemon]{
        return pokemonData.body
    }
}
