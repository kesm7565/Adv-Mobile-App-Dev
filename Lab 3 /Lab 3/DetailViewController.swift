//
//  DetailViewController.swift
//  Lab 3
//
//  Created by Kendal Alexander Smith on 2/15/21.
//

import UIKit

class DetailViewController: UITableViewController, UISearchBarDelegate {
    var teamsData = TeamsDataLoader()
    var selectedEastWest = 0
    var teamList = [String]()
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewWillAppear(_ animated: Bool){
        teamList = teamsData.getTeams(index: selectedEastWest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return teamList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)

        cell.textLabel?.text = teamList[indexPath.row]

        return cell
    }


    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            teamList.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            teamsData.deleteTeam(index: selectedEastWest, teamIndex: indexPath.row)
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let fromRow = fromIndexPath.row
        let toRow = to.row
        let moveTeam = teamList[fromRow]
        
        teamList.swapAt(fromRow, toRow)
        
        teamsData.deleteTeam(index: selectedEastWest, teamIndex: fromRow)
        teamsData.addTeam(index: selectedEastWest, newTeam: moveTeam, newIndex: toRow)
    }
    
    
    
    
    func searchBar(_ searchBar:UISearchBar, textDidChange searchText:String){
        if searchText == ""{
            teamList = teamsData.getTeams(index: selectedEastWest)
        }
        else{
            for teams in teamList{
                if teams.lowercased().contains(searchText.lowercased()){
                    teamList.append(teams)
                }
            }
            self.tableView.reloadData()
    }
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    }
