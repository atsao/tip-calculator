//
//  ViewController.swift
//  tippr
//
//  Created by Andrew Tsao on 9/19/16.
//  Copyright © 2016 Andrew Tsao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        if !launchedBefore {
//            tipControl.selectedSegmentIndex = 0
//        } else {
//            tipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "default_tip_index")
//        }
        tipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "default_tip_index")
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)

//        currentTipIndex = UserDefaults.standard.integer(forKey: "default_tip_index")
        
//        tipAmount.text = String(format: "%d%%", currentTip)
        
        tipControl.selectedSegmentIndex = currentTipIndex
        
        calculateTip(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func onTap(_ sender: AnyObject) {
//        view.endEditing(true)
//    }
    
    @IBAction func changeTip(_ sender: AnyObject) {
        let selectedTipIndex = tipControl.selectedSegmentIndex
        
        currentTipIndex = selectedTipIndex
        calculateTip(self)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        let billAmount = Double(billField.text!) ?? 0
        let tipPercent = Double(tipValues[currentTipIndex]) / 100
        let tip = tipPercent * billAmount
        let total = tip + billAmount;
        
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func unwindToMeWithSegue(segue: UIStoryboardSegue!) {
        
    }
}

