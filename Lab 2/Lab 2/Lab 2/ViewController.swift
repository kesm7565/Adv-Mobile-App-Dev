//
//  ViewController.swift
//  Lab 2
//
//  Created by Kendal Alexander Smith on 2/2/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var countriesPicker: UIPickerView!
    
    @IBOutlet weak var choiceLabel: UILabel!
    
    var placesData = DataLoader()
    var countries = [String]()
    var letters = [String]()
    let countriesComponent = 0
    let lettersComponent = 1
    let filename = "alphabetcountries"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == countriesComponent{
            return countries.count
        } else {
            return letters.count
        }
    }
    
    func pickerView(_pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        
        if component == lettersComponent{
            return countries[row]
            
        }else{
            return letters[row]
        }
    }
    func pickerView(_pickerView: UIPickerView, didSelectRow row: Int, inComponent component:Int)
    {
        if component == countriesComponent{
            letters = placesData.getPlaces(index: row)
            
            countriesPicker.reloadComponent(lettersComponent)
            
            countriesPicker.selectRow(0, inComponent: lettersComponent, animated: true)
            
            
        }
        let countriesrow = countriesPicker.selectedRow(inComponent: countriesComponent)
        
        let letterrow = countriesPicker.selectedRow(inComponent: lettersComponent)
        
       
        
        choiceLabel.text = "Here is the country you want to go to: \(countries[countriesrow]) which starts with the letter \(letters[letterrow])"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placesData.loadData(filename: filename)
        letters = placesData.getLetters()
        countries = placesData.getPlaces(index:0)
        // Do any additional setup after loading the view.
    }


}

