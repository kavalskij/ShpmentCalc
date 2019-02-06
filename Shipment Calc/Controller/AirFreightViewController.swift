//
//  AirFreightViewController.swift
//  Shipment Calc
//
//  Created by Aleksandrs Muravjovs on 05/02/2019.
//  Copyright © 2019 Aleksandrs Muravjovs. All rights reserved.
//

import UIKit

class AirFreightViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var lengthTextField: UITextField!
    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var piecesTextField: UITextField!
    @IBOutlet weak var totalWeightTextField: UITextField!
    @IBOutlet weak var chWeightResultLabel: UILabel!
    @IBOutlet weak var volumeResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.lengthTextField.delegate = self
        self.widthTextField.delegate = self
        self.heightTextField.delegate = self
        self.piecesTextField.delegate = self
        self.totalWeightTextField.delegate = self
        
    }
    
    @IBAction func claculateBtnPressed(_ sender: UIButton) {
        
        guard let length = Double(lengthTextField.text!) else { return }
        guard let width = Double(widthTextField.text!) else { return }
        guard let height = Double(heightTextField.text!) else { return }
        guard let pieces = Int(piecesTextField.text!) else { return }
        guard let grossWeight = Double(totalWeightTextField.text!) else { return }
        
        let chWeight: Double = AirCalculationsModel().calculateChWeight(lenght: length, width: width, height: height, pieces: pieces, grossWeight: grossWeight)
        let volume: Double = AirCalculationsModel().calculateVolume(length: length, width: width, height: height, pieces: pieces)
        
        chWeightResultLabel.text = String(format: "%.2f", chWeight)
        volumeResult.text = String(format: "%.2f", volume)
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    //MARK - UITextField Delegates
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //For numers
        if (textField == lengthTextField) || (textField == widthTextField) || (textField == heightTextField) || (textField == piecesTextField) || (textField == totalWeightTextField) {
            let allowedCharacters = CharacterSet(charactersIn:"0123456789.")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    
}

