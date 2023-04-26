//
//  ViewController.swift
//  Tipsy_12
//
//  Created by Лариса Терегулова on 25.04.2023.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var number = 0.0
    var peopleCount = 0.0
    var roundResult = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        switch sender.currentTitle {
            case "0%":
            number = 0
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            case "10%":
            number = 0.1
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            case "20%":
            number = 0.2
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            default:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        }
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\((Int)(sender.value))"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billResult = Double(billTextField.text!) ?? 0.0
        peopleCount = Double(splitNumberLabel.text!)!
        let result = (billResult + (billResult * number)) / peopleCount
        roundResult = NSString(format: "%.2f", result) as String
        print(roundResult)
        self.performSegue(withIdentifier: "goToResult", sender: self)
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = roundResult
            destinationVC.tip = Int(number * 100)
            destinationVC.split = Int(peopleCount)
        }
    }
}

