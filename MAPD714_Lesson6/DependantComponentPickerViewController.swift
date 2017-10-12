//
//  DependantComponentPickerViewController.swift
//  MAPD714_Lesson6
//
//  Created by Student on 2017-10-11.
//  Copyright © 2017 Centennial. All rights reserved.
//

import UIKit

class DependantComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {

    @IBOutlet weak var dependatPicker: UIPickerView!
    
    let stateComponent = 0
    let zipComponent = 1
    
    var stateZips:[String:[String]]!
    var states:[String]!
    var zips:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //create a refrence to the dictionary inside the plist file
        let bundle = Bundle.main
        let plistURL = bundle.url(forResource: "statedDictionary", withExtension: "pList")

        //read in the dictionary data from the plist file
        stateZips = NSDictionary.init(contentsOf: (plistURL)!) as! [String: [String]]
        
        let allStates = stateZips.keys
        states = allStates.sorted()
        let selectedState = states[0]
        zips = stateZips[selectedState]
    }

    @IBAction func onButtonPressed(_ sender: UIButton) {
        
        let stateRow = dependatPicker.selectedRow(inComponent: stateComponent)
        let zipRow = dependatPicker.selectedRow(inComponent: zipComponent)
        
        let state = states[stateRow]
        let zip = zips[zipRow]
        
        let title = "You selected zip code \(zip)"
        
        let message = "\(zip) is in \(state)"
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

        
    }
    
    
    //Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Data Source
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (component == stateComponent) ? states.count : zips.count
    }

    
    //Data Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (component == stateComponent) ? states[row] : zips[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == stateComponent {
            
            let selectedState = states[row]
            zips = stateZips[selectedState]
            dependatPicker.reloadComponent(zipComponent)
            dependatPicker.selectRow(0, inComponent: zipComponent, animated: true)
        }
    }
}
