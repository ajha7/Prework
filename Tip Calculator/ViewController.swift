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
    
    @IBOutlet weak var person_1: UIImageView!
    @IBOutlet weak var person_2: UIImageView!
    @IBOutlet weak var person_3: UIImageView!
    @IBOutlet weak var person_4: UIImageView!
    @IBOutlet weak var person_5: UIImageView!
    @IBOutlet weak var person_6: UIImageView!
    @IBOutlet weak var person_7: UIImageView!
    @IBOutlet weak var person_8: UIImageView!

    var partySize = 1
    var perPerson = 0.0
    var total = 0.0
    let defaults = UserDefaults.standard
    let locale = Locale.current
    
    lazy var currencySymbol = locale.currencySymbol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        person_2.isHidden = (defaults.object(forKey: "person_2") == nil) ? true : defaults.bool(forKey: "person_2")
        person_3.isHidden = (defaults.object(forKey: "person_3") == nil) ? true : defaults.bool(forKey: "person_3")
        person_4.isHidden = (defaults.object(forKey: "person_4") == nil) ? true : defaults.bool(forKey: "person_4")
        person_5.isHidden = (defaults.object(forKey: "person_5") == nil) ? true : defaults.bool(forKey: "person_5")
        person_6.isHidden = (defaults.object(forKey: "person_6") == nil) ? true : defaults.bool(forKey: "person_6")
        person_7.isHidden = (defaults.object(forKey: "person_7") == nil) ? true : defaults.bool(forKey: "person_7")
        person_8.isHidden = (defaults.object(forKey: "person_8") == nil) ? true : defaults.bool(forKey: "person_8")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tipControl.setTitle(((defaults.string(forKey: "One") ?? "15") + "%"), forSegmentAt: 0)
        tipControl.setTitle(((defaults.string(forKey: "Two") ?? "18") + "%"), forSegmentAt: 1)
        tipControl.setTitle(((defaults.string(forKey: "Three") ?? "20") + "%"), forSegmentAt: 2)
        
        tipRateLabel.text = tipControl.titleForSegment(at: tipControl.selectedSegmentIndex)
        billField.placeholder = currencySymbol
        if (defaults.string(forKey: "billFieldText") != nil && (defaults.double(forKey: "timeElapsedBetweenAppLaunch")/60) < 10)
        {
            billField.text = defaults.string(forKey: "billFieldText")
            tipLabel.text = String(format: "\(currencySymbol)%.2f", defaults.double(forKey: "tipLabel"))
            totalLabel.text = String(format: "\(currencySymbol)%.2f", defaults.double(forKey: "totalLabel"))
            perPersonLabel.text = String(format: "\(currencySymbol)%.2f", defaults.double(forKey: "perPersonLabel"))
        }   
        else
        {
            tipLabel.text = "\(currencySymbol)0.00"
            totalLabel.text = "\(currencySymbol)0.00"
            perPersonLabel.text = "\(currencySymbol)0.00"
        }
        
        if (((defaults.double(forKey: "timeElapsedBetweenAppLaunch")/60) < 10) && defaults.integer(forKey: "partySize") >= 1)
        {
            partySize = defaults.integer(forKey: "partySize")
        }
        
        partySizeLabel.text = String(partySize)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
            defaults.set(NSDate(), forKey: "timeElapsedBetweenAppLaunch")
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
        tipRateLabel.text = tipControl.titleForSegment(at: tipControl.selectedSegmentIndex)
                               
        tipLabel.text = String(format: "\(currencySymbol)%.2f", tip)
        
        totalLabel.text = String(format: "\(currencySymbol)%.2f", total)
        
        perPersonLabel.text = String(format: "\(currencySymbol)%.2f", perPerson)
        
        defaults.set(NSDate(), forKey: "timeElapsedBetweenAppLaunch")
        defaults.set(billField.text!, forKey: "billFieldText")
        defaults.set(tip, forKey: "tipLabel")
        defaults.set(total, forKey: "totalLabel")
        defaults.set(perPerson, forKey: "perPersonLabel")
    }
    
    @IBAction func minusPartySize(_ sender: UIButton) {
        if (partySize > 1)
        {
            partySize -= 1
            animateDecrement()
        }
        partySizeLabel.text = "\(partySize)"
        perPerson = total / Double(partySize)
        perPersonLabel.text = String(format: "$%.2f", perPerson)
        defaults.set(partySize, forKey: "partySize")
    }
    
    @IBAction func plusPartySize(_ sender: UIButton) {
        partySize += 1
        partySizeLabel.text = "\(partySize)"
        perPerson = total / Double(partySize)
        perPersonLabel.text = String(format: "$%.2f", perPerson)
        defaults.set(partySize, forKey: "partySize")
        if (partySize <= 8)
        {
            animateIncrement()
        }
    }
    
    func animateDecrement()
    {
        let images = [person_1, person_2, person_3, person_4, person_5, person_6, person_7, person_8]
        if (partySize <= 7)
        {
            images[partySize]!.isHidden = true
            defaults.set(true, forKey: "person_\(partySize + 1)")
        }
    }
    
    func animateIncrement()
    {
        let images = [person_1, person_2, person_3, person_4, person_5, person_6, person_7, person_8]
        if (partySize <= 8)
        {
            images[partySize - 1]!.isHidden = false
            defaults.set(false, forKey: "person_\(partySize)")
        }
    }
}

