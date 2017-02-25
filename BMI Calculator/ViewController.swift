//--------------------------------------------------------------
//  ViewController.swift
//
//  Poject: BMI Calculator
//  Class: CPSC 411
//  Professor: David McLaren
//  Date: 2/27/2017
//  Created by Horacio A Sanchez on 2/13/17.
//  Copyright © 2017 Horacio Sanchez. All rights reserved.
//--------------------------------------------------------------
// Things to do:
// -This program is Completed! :)
//--------------------------------------------------------------

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    //MARK: Properties
    @IBOutlet weak var hLabel: UILabel!
    @IBOutlet weak var wLabel: UILabel!
    @IBOutlet weak var uLabel: UILabel!
    @IBOutlet weak var rLabel: UILabel!
    @IBOutlet weak var hTextField: UITextField!
    @IBOutlet weak var wTextField: UITextField!
    @IBOutlet weak var outletSwitch: UISwitch!
    @IBOutlet weak var rangeImageView: UIImageView!
    var height = 0.0
    var weight = 0.0
    var hdefault = 1.0
    var wdefault = 1.0
    var BMI = 0.0
    var category = " "
    let lbTokg = 0.453592 // 1 lb = 0.453592 kg
    let ftTom = 0.3048 // 1 ft = 0.3048 m
    
    //MARK: UITextFieldDelegates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
    //This function delegate helps dismiss the keyboard when the user taps 'return' or similar.
       hTextField.resignFirstResponder()
       wTextField.resignFirstResponder()
       return true
    }
    
    //MARK: Actions
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        //If the "calculate" button is tapped on first when the app launches and the Text Fields are empty, assign zero to the Text Fields so that they can be unwrapped and converted to Doubles in the logic below.
        if (hTextField.text == "") || (wTextField.text == ""){
            hTextField.text = "0.0"
            wTextField.text = "0.0"
        }

        
        //NOTE: The formula given to calculate the Index Body Mass is IBM = kg/m^2 which is in METRIC units so we'll need to convert lbs = kg and ft = m when the 'switch' button is both ON & OFF
        //If the switch is ON, we convert height and weight to METRIC units, diplay them in the text fields and calculate IBM. Display IBM and corresponding range.
        //If switch is OFF, weight = lbs & height = ft convert to METRIC units and calculate IBM. Display IBM and corresponding range.
        
        if !outletSwitch.isOn{
            height = Double(Float(hTextField.text!)!)
            weight = Double(Float(wTextField.text!)!)
            BMI = (lbTokg * weight)/(ftTom*ftTom*height*height)
            if BMI < 16.00{
                category = "Severe Thinness"
                rLabel.text = "\(category) -> BMI: \(Double(round(100*BMI)/100))"
                rangeImageView.image = UIImage(named: "SevereThinnes")
            }else if (BMI >= 16.00) && (BMI <= 16.99){
                category = "Moderate Thinness"
                rLabel.text = "\(category) -> BMI: \(Double(round(100*BMI)/100))"
                rangeImageView.image = UIImage(named: "ModerateThinnes")
            }else if (BMI >= 17.00) && (BMI <= 18.49){
                category = "Mild Thinness"
                rLabel.text = "\(category) -> BMI: \(Double(round(100*BMI)/100))"
                rangeImageView.image = UIImage(named: "MildThinnes")
            }else if (BMI >= 18.50) && (BMI <= 24.99){
                category = "Normal"
                rLabel.text = "\(category) -> BMI: \(Double(round(100*BMI)/100))"
                rangeImageView.image = UIImage(named: "Normal")
            }else if (BMI >= 25.00) && (BMI <= 29.99){
                category = "Overweight"
                rLabel.text = "\(category) -> BMI: \(Double(round(100*BMI)/100))"
                rangeImageView.image = UIImage(named: "Overweight")
            }else if (BMI >= 30.00) && (BMI <= 34.99){
                category = "Moderate Obese"
                rLabel.text = "\(category) -> BMI: \(Double(round(100*BMI)/100))"
                rangeImageView.image = UIImage(named: "ModerateObese")
            }else if (BMI >= 35.00) && (BMI <= 39.99){
                category = "Severe Obese"
                rLabel.text = "\(category) -> BMI: \(Double(round(100*BMI)/100))"
                rangeImageView.image = UIImage(named: "SevereObese")
            }else if BMI > 39.99{
                category = "Very Severe Obese"
                rLabel.text = "\(category) -> BMI: \(Double(round(100*BMI)/100))"
                rangeImageView.image = UIImage(named: "VerySevereObese")
            }
        }else{
            height = Double(Float(hTextField.text!)!)
            weight = Double(Float(wTextField.text!)!)
            BMI = weight/(height*height)
            if BMI < 16.00{
                category = "Severe Thinness"
                rLabel.text = "\(category) -> BMI: \(Double(round(100*BMI)/100))"
                rangeImageView.image = UIImage(named: "SevereThinnes")
            }else if (BMI >= 16.00) && (BMI <= 16.99){
                category = "Moderate Thinness"
                rLabel.text = "\(category) -> BMI: \(Double(round(100*BMI)/100))"
                rangeImageView.image = UIImage(named: "ModerateThinnes")
            }else if (BMI >= 17.00) && (BMI <= 18.49){
                category = "Mild Thinness"
                rLabel.text = "\(category) -> BMI: \(Double(round(100*BMI)/100))"
                rangeImageView.image = UIImage(named: "MildThinnes")
            }else if (BMI >= 18.50) && (BMI <= 24.99){
                category = "Normal"
                rLabel.text = "\(category) -> BMI: \(Double(round(100*BMI)/100))"
                rangeImageView.image = UIImage(named: "Normal")
            }else if (BMI >= 25.00) && (BMI <= 29.99){
                category = "Overweight"
                rLabel.text = "\(category) -> BMI: \(Double(round(100*BMI)/100))"
                rangeImageView.image = UIImage(named: "Overweight")
            }else if (BMI >= 30.00) && (BMI <= 34.99){
                category = "Moderate Obese"
                rLabel.text = "\(category) -> BMI: \(Double(round(100*BMI)/100))"
                rangeImageView.image = UIImage(named: "ModerateObese")
            }else if (BMI >= 35.00) && (BMI <= 39.99){
                category = "Severe Obese"
                rLabel.text = "\(category) -> BMI: \(Double(round(100*BMI)/100))"
                rangeImageView.image = UIImage(named: "SevereObese")
            }else if BMI > 39.99{
                category = "Very Severe Obese"
                rLabel.text = "\(category) -> BMI: \(Double(round(100*BMI)/100))"
                rangeImageView.image = UIImage(named: "VerySevereObese")
            }
        }
    }
    
    @IBAction func actionSwitch(_ sender: UISwitch) {
        
        //This button works as follows:
        // First, extract the height and weight values from the text fields and assing them to their respective variables.
        // If the button is ON, then convert the height and weight to metric values
        // Else if the button is toggled OFF, the values in the text field become zero(Double).
    
        if (wTextField.text == "") || (hTextField.text == ""){
            
            wTextField.text = "0.0"
            hTextField.text = "0.0"
        }
        if sender.isOn{
            hTextField.text = "\(Double(round(100*ftTom*height)/100))"
            wTextField.text = "\(Double(round(100*lbTokg*weight)/100))"
        }
        else{
            hTextField.text = "0.0"
            wTextField.text = "0.0"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets an image as a background on the app view
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "wallpaper")
        self.view.insertSubview(backgroundImage, at: 0)
        
        
        // Handle the textfield user's input through delegate callbacks
        hTextField.delegate = self
        wTextField.delegate = self
        
        //Display default image when the app runs for 1st tme
        //rangeImageView.image = UIImage(named: "highlightedStar")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

