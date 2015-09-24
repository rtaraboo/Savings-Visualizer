//
//  ViewController.swift
//  Savings Visualizer
//
//  Created by Rosario Tarabocchia on 9/23/15.
//  Copyright © 2015 RLDT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtYearlyIncome: UITextField!
    @IBOutlet weak var sldPercentSaved: UISlider!
    
    @IBOutlet weak var lblPercent: UILabel!
    @IBOutlet weak var lblWeeklySaved: UILabel!
    @IBOutlet weak var lblMonthlySaved: UILabel!
    @IBOutlet weak var lblYearlySaved: UILabel!
    @IBOutlet weak var lbl25YearSaved: UILabel!
    
    var yearlyIncomeString = ""
    var yearlyIncomeFloat : Float = 0.0
    var percent : Float = 0.0
    var weeklySaved : Float = 0.0
    var monthlySaved : Float = 0.0
    var yearlySaved : Float = 0.0
    var year25Saved : Float = 0.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sldPercentSavedACTION(sender: UISlider) {
        
        takeData()
        calculate()
        
    }

    @IBAction func btnCalculateACTION(sender: UIButton) {
        
        takeData()
        calculate()
    }
    

    @IBAction func btnClearACTION(sender: UIButton) {
        
        clear()
    }
    
    
    func takeData(){
        
        
        if txtYearlyIncome.text == "" {
            txtYearlyIncome.text = "0"
        }
        
        yearlyIncomeString = txtYearlyIncome.text!
        yearlyIncomeFloat = Float(yearlyIncomeString)!
        
        percent = sldPercentSaved.value * 100
        
        
    }
    
    func calculate(){
        
        yearlySaved = (yearlyIncomeFloat * percent) / 100
        monthlySaved = yearlySaved / 12
        weeklySaved = yearlySaved / 52
        year25Saved = yearlySaved * 25
        
        print()
        
    }
    
    func print(){
        
        var sPercent = String(format: "%0.0f", percent)
        var sWeeklySaved = String(format: "%0.2f", weeklySaved)
        var sMonthlySaved = String(format: "%0.2f", monthlySaved)
        var sYearlySaved = String(format: "%0.2f", yearlySaved)
        var sYear25Saved = String(format: "%0.2f", year25Saved)
        
        lblPercent.text = "\(sPercent)%"
        lblYearlySaved.text = "$\(sYearlySaved)"
        lblWeeklySaved.text = "$\(sWeeklySaved)"
        lblMonthlySaved.text = "$\(sMonthlySaved)"
        lbl25YearSaved.text = "$\(sYear25Saved)"
        
        
    }
    
    func clear(){
        
        txtYearlyIncome.text = ""
        lblPercent.text = ""
        lblYearlySaved.text = ""
        lblWeeklySaved.text = ""
        lblMonthlySaved.text = ""
        lbl25YearSaved.text = ""
    
        
    }
    
    func hideKeyboard(){
        
        txtYearlyIncome.resignFirstResponder()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        hideKeyboard()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

