//
//  ThirdViewController.swift
//  Lab 2
//
//  Created by Kendal Alexander Smith on 2/4/21.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBAction func goToMaps(_ sender: Any) {
        if(UIApplication.shared.canOpenURL(URL(string: "comgooglemaps://")!)){
            UIApplication.shared.open(URL(string: "comgooglemaps://")!, options: [:], completionHandler: nil)
        } else {
            if(UIApplication.shared.canOpenURL(URL(string: "http://maps.apple.com")!)){
                UIApplication.shared.open(URL(string: "http://maps.apple.com")!, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.open(URL(string: "https://www.apple.com/maps/")!, options: [:], completionHandler: nil)
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
