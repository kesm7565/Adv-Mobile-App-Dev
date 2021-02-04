//
//  SecondViewController.swift
//  Lab 2
//
//  Created by Kendal Alexander Smith on 2/2/21.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var datePicker: UIDatePicker?
    
    
    @IBOutlet weak var dateLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(SecondViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        dateLabel.inputView = datePicker

        // Do any additional setup after loading the view.
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let k = dateFormatter.string(from: datePicker.date)
        dateLabel.text = "Your departure date is \(k)"
        
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
