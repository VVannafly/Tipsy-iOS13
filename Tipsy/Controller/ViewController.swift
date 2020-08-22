//
//  ViewController.swift
//  Tipsy
//
//  Created by Dmitriy Chernov on 19.08.2020.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  
    @IBOutlet weak var billLabel: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var nullPrcLabel: UIButton!
    @IBOutlet weak var tenPrcLabel: UIButton!
    @IBOutlet weak var twePrcLabel: UIButton!
    
    var percent = 0.0
    var people = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    @IBAction func tipButton (_ sender: UIButton) {
        
        billLabel.endEditing(true)
        
        nullPrcLabel.isSelected = false
        tenPrcLabel.isSelected = false
        twePrcLabel.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        percent = buttonTitleAsANumber / 100
        
    }
    
    
    @IBAction func splitStepper (_ sender: UIStepper) {
        splitLabel.text = String(format: "%.0f", sender.value)
        people = Int(sender.value)
    }
    
    @IBAction func calculateButton (_ sender: UIButton) {
        
        let totalBill = billLabel.text!
        if totalBill != "" {
            billTotal = Double(totalBill)!
            let result = billTotal * (1 + percent) / Double(people)
            finalResult = String(format: "%.2f", result)
        }
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.percent = Int(percent * 100)
            destinationVC.people = people
            destinationVC.result = finalResult
            
        }
    }
    
    
}

