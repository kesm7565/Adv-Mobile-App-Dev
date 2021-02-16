//
//  File.swift
//  Lab 3
//
//  Created by Kendal Alexander Smith on 2/13/21.
//

import Foundation
class TeamsDataLoader{
    var allData = [teamData]()
    
    func loadData(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist"){
            let plistdecoder = PropertyListDecoder()
            do{
                let data = try Data(contentsOf: pathURL)
                allData = try plistdecoder.decode([teamData].self, from: data)
            }
            catch{
                print(error)
            }
        }
    }
    
    func getEastVsWest() -> [String]{
        var eastvswest = [String]()
        for item in allData{
            eastvswest.append(item.eastOrWest)
        }
        return eastvswest
    }
    
    func getTeams(index:Int) -> [String]{
        return allData[index].Teams
    }
    func addTeam(index:Int, newTeam:String, newIndex:Int){
        allData[index].Teams.insert(newTeam, at: newIndex)
    }
    func deleteTeam(index:Int, teamIndex: Int){
        allData[index].Teams.remove(at: teamIndex)
    }
    
}
