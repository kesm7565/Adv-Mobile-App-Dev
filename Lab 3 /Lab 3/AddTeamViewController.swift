//
//  AddTeamViewController.swift
//  Lab 3
//
//  Created by Kendal Alexander Smith on 2/15/21.
//

import UIKit

class AddTeamViewController: UIViewController {

    @IBOutlet weak var teamTextField: UITextField!
    
    var addedTeam = String()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "doneSegue"{
            if teamTextField.text?.isEmpty == false{
                addedTeam=teamTextField.text!
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
