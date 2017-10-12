//
//  DoubleComponentPickerViewController.swift
//  MAPD714_Lesson6
//
//  Created by Student on 2017-10-11.
//  Copyright © 2017 Centennial. All rights reserved.
//

import UIKit

class DoubleComponentPickerViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var doublePicker: UIPickerView!
    private let fillingComponent = 0
    private let breadComponent = 1
    private let fillingTypes = ["Turkey", "Ham", "Steak", "Fish", "Veggie"]
    private let breadTypes = ["Brown", "White", "Whole Wheat", "Raisin"]
    override func viewDidLoad() {
        super.viewDidLoad()


    }


    @IBAction func onButtonPressed(_ sender: UIButton) {
        let fillingRow = doublePicker.selectedRow(inComponent: fillingComponent)
        let breadRow = doublePicker.selectedRow(inComponent: breadComponent)
        let filling = fillingTypes[fillingRow]
        let bread = breadTypes[breadRow]
        let message = "Your \(filling) on \(bread) bread will be right up!"
        
        let alert = UIAlertController(
            title: "Thank You for ordering",
            message: message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: "Great!",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

    
    }

    
    //Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 2
    }
    
    //Data Source
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (component == breadComponent) ? breadTypes.count : fillingTypes.count
    }
    
    //Data Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (component == breadComponent) ? breadTypes[row] : fillingTypes[row]
    }
    
}
