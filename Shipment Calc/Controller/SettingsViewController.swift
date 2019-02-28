//
//  SettingsViewController.swift
//  Shipment Calc
//
//  Created by Aleksandrs Muravjovs on 05/02/2019.
//  Copyright © 2019 Aleksandrs Muravjovs. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var inputTypeSegmentedController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.value(forKey: "inputType") as? String == "metric" {
            inputTypeSegmentedController.selectedSegmentIndex = 0
        } else if UserDefaults.standard.value(forKey: "inputType") as? String == "english" {
            inputTypeSegmentedController.selectedSegmentIndex = 1
        } else {
            inputTypeSegmentedController.selectedSegmentIndex = 0
        }
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    
    @IBAction func inputTypeSegmentedControllerChanged(_ sender: UISegmentedControl) {
        
        switch inputTypeSegmentedController.selectedSegmentIndex {
        case 0:
            UserDefaults.standard.setValue("metric", forKey: "inputType")
            UserDefaults.standard.set(6000, forKey: "inputCriteria")

        case 1:
            UserDefaults.standard.setValue("english", forKey: "inputType")
            UserDefaults.standard.set(166, forKey: "inputCriteria")

        default:
            break
        }
    }
}
