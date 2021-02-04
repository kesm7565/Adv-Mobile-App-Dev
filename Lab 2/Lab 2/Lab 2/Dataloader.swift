//
//  Dataloader.swift
//  Lab 2
//
//  Created by Kendal Alexander Smith on 2/3/21.
//

import Foundation

class DataLoader {
    var allData = [countriesABC]()
    
    func loadData(filename: String){
        if let pathURL = Bundle.main.url(forResource:
            filename, withExtension: "plist"){
            let plistdecoder = PropertyListDecoder()
            do{
                let data = try Data(contentsOf: pathURL)
                allData = try
                    plistdecoder.decode([countriesABC].self, from: data)
            } catch {
                print("Cannot load data")
            }
        }
    }
    func getLetters() -> [String]{
        var k = [String]()
        for i in allData{
            k.append(i.letter)
        }
        return k
    }
    func getPlaces(index: Int) -> [String] {
        return ["1"]//allData[index].countries
    }
    
}
