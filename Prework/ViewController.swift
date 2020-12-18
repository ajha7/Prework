//
//  ViewController.swift
//  Prework
//
//  Created by Anshul Jha on 12/16/20.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var tipRateLabel: UILabel!
    @IBOutlet weak var perPersonLabel: UILabel!
    var partySize = 1
    var perPerson = 0.0
    var total = 0.0
    let defaults = UserDefaults.standard
    let locale = Locale.current
    lazy var currencySymbol = locale.currencySymbol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        tipControl.setTitle(((defaults.string(forKey: "One") ?? "15") + "%"), forSegmentAt: 0)
        tipControl.setTitle(((defaults.string(forKey: "Two") ?? "18") + "%"), forSegmentAt: 1)
        tipControl.setTitle(((defaults.string(forKey: "Three") ?? "20") + "%"), forSegmentAt: 2)
        
        tipRateLabel.text = tipControl.titleForSegment(at: tipControl.selectedSegmentIndex)
        if (defaults.string(forKey: "billFieldText") != nil)
        {
            billField.text = defaults.string(forKey: "billFieldText")
        }
        else
        {
            billField.placeholder = currencySymbol
        }
        tipLabel.text = "\(currencySymbol)0.00"
        totalLabel.text = "\(currencySymbol)0.00"
        perPersonLabel.text = "\(currencySymbol)0.00"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        defaults.set(billField.text!, forKey: "billFieldText")
    }
    

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any) {
        //get bill amount
        let bill = Double(billField.text!) ?? 0
        //calculate tip and total
        let tipPercentages = [defaults.double(forKey: "One") * 0.01, defaults.double(forKey: "Two") * 0.01, defaults.double(forKey: "Three") * 0.01]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        total = bill + tip
        
        perPerson = total / Double(partySize)
        //update tip and total labels
        //tipRateLabel.text = "\(tipPercentages[tipControl.selectedSegmentIndex])%"
        tipRateLabel.text = tipControl.titleForSegment(at: tipControl.selectedSegmentIndex)
        
        tipLabel.text = String(format: "\(currencySymbol)%.2f", tip)
        
        totalLabel.text = String(format: "\(currencySymbol)%.2f", total)
        
        perPersonLabel.text = String(format: "\(currencySymbol)%.2f", perPerson)
    }
    
    @IBAction func minusPartySize(_ sender: UIButton) {
        if (partySize > 1)
        {
            partySize -= 1
        }
        partySizeLabel.text = "\(partySize)"
        perPerson = total / Double(partySize)
        perPersonLabel.text = String(format: "$%.2f", perPerson)
    }
    @IBAction func plusPartySize(_ sender: UIButton) {
        partySize += 1
        partySizeLabel.text = "\(partySize)"
        perPerson = total / Double(partySize)
        perPersonLabel.text = String(format: "$%.2f", perPerson)
    }
}

