//
//  ViewController.swift
//  Lab 3
//
//  Created by Kendal Alexander Smith on 2/13/21.
//

import UIKit

class ViewController: UITableViewController {
    
    
    
    var teamList = [String]()
var teamsData = TeamsDataLoader()
let dataFile = "nbaTeams"
    var selectedEastWest = 0
    
    @IBAction func unwindSegue (_ segue: UIStoryboardSegue){
        if segue.identifier == "doneSegue"{
            if let source = segue.source as? AddTeamViewController{
                if source.addedTeam.isEmpty == false{
                    teamsData.addTeam(index: selectedEastWest, newTeam: source.addedTeam, newIndex: teamList.count)
                    teamList.append(source.addedTeam)
                    tableView.reloadData()
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamsData.loadData(filename: dataFile)
        teamList = teamsData.getEastVsWest()
        // Do any additional setup after loading the view.
   }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return teamList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as UITableViewCell
        cell.textLabel?.text = teamList[indexPath.row]
        return cell


}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "teamSegue" {
            if let detailVC = segue.destination as? DetailViewController {
                if let indexPath = tableView.indexPath(for: (sender as? UITableViewCell)!){
                    detailVC.title = teamList[indexPath.row]
                    detailVC.teamsData = teamsData
                    detailVC.selectedEastWest = indexPath.row
                }
            }
        }
    }

}
