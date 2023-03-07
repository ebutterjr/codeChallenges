//
//  ViewController.swift
//  Api code challenge
//
//  Created by Easton Butterfield on 3/1/23.
//

import UIKit

class ViewController: UIViewController {
    var amountOfPeople: String = ""
    var inclusionParameters: String = ""
    @IBOutlet weak var amountOfPeopleLabel: UILabel!
    
    @IBOutlet weak var amountOfPeopleSlider: UISlider!
    
    
    @IBOutlet weak var locationSwitch: UISwitch!
    
    @IBOutlet weak var emailSwitch: UISwitch!
    
    @IBOutlet weak var loginSwitch: UISwitch!
    
    @IBOutlet weak var registeredSwitch: UISwitch!
    
    
    func saveSettings() {
        let results = String(Int(amountOfPeopleSlider.value))
        amountOfPeople = results
        var inc: String = "name"
        if locationSwitch.isOn == true {
          inc.append(",location")
        }
        if emailSwitch.isOn == true {
          inc.append(",email")
        }
        if loginSwitch.isOn == true {
          inc.append(",login")
        }
        if registeredSwitch.isOn == true {
          inc.append(",registered")
        }
        inc.append(",picture")
        inclusionParameters = inc
      }
      override func viewDidLoad() {
        super.viewDidLoad()
        amountOfPeopleLabel.text = "15"
        amountOfPeopleSlider.value = 15
        amountOfPeopleSlider.minimumValue = 0
        amountOfPeopleSlider.maximumValue = 30
      }
    @IBAction func completeButtonTapped(_ sender: Any) {
        saveSettings()
        dismiss(animated: true)
        
    }
    
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let userTableViewController = segue.destination as? UserTableViewController {
          userTableViewController.inclusionParameters = inclusionParameters
          userTableViewController.amountOfPeople = amountOfPeople
        }
      }
    @IBAction func amountOfPeopleChanged(_ sender: Any) {
        amountOfPeopleLabel.text = String(amountOfPeopleSlider.value.rounded())
    }
    
    }













