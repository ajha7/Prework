//
//  SettingsViewController.swift
//  Prework
//
//  Created by Anshul Jha on 12/16/20.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var tipOneDefaultField: UITextField!
    @IBOutlet weak var tipTwoDefaultField: UITextField!
    @IBOutlet weak var tipThreeDefaultField: UITextField!
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    @IBAction func setTipOneDefault(_ sender: Any) {
        setDefaultTips(value:Double(tipOneDefaultField.text!) ?? 15, key: "One")
    }
    
    @IBAction func setTipTwoDefault(_ sender: Any) {
        setDefaultTips(value:Double(tipTwoDefaultField.text!) ?? 18, key: "Two")
    }
    
    @IBAction func setTipThreeDefault(_ sender: Any) {
        setDefaultTips(value:Double(tipThreeDefaultField.text!) ?? 20, key: "Three")
    }
    
    func setDefaultTips(value:Double, key:String){
        defaults.set(value,forKey: key)
        defaults.synchronize()
    }
    
    @IBAction func resetToDefaultValues(_ sender: Any) {
        defaults.set(15,forKey: "One")
        defaults.set(18,forKey: "Two")
        defaults.set(20,forKey: "Three")
        defaults.synchronize()
    }
    //add helpful tip

}
