//
//  AirCalculationsModel.swift
//  Shipment Calc
//
//  Created by Aleksandrs Muravjovs on 05/02/2019.
//  Copyright © 2019 Aleksandrs Muravjovs. All rights reserved.
//

import Foundation

class AirCalculationsModel {
    
    private var criteria: Int = 0
    
    func calculateChWeight(lenght: Double, width: Double, height: Double, pieces: Int, grossWeight: Double) -> Double {
        
        inputTypeCriteria()
        print(criteria)
        
        let chWeightResult = ((lenght * width * height) * Double(pieces))/Double(criteria)
        
        if chWeightResult >= grossWeight {
            return chWeightResult
        } else {
            return grossWeight
        }
    }
    
    func inputTypeCriteria() {
        
        if UserDefaults.standard.value(forKey: "valueType") as? String == "metric" {
           criteria = 6000
        } else if UserDefaults.standard.value(forKey: "valueType") as? String == "english" {
            criteria = 166
        } else {
           criteria = 6000
        }
    }
 
    
    func calculateVolume (length: Double, width: Double, height: Double, pieces: Int) -> Double {
        
        return (((length * width * height) * Double(pieces)/1000000))
    }
}
