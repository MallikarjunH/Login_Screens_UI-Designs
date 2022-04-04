//
//  ViewController.swift
//  OPT_Sreen
//
//  Created by Mallikarjun on 20/02/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var textOTP1: UITextField!
    @IBOutlet weak var textOTP2: UITextField!
    @IBOutlet weak var textOTP3: UITextField!
    @IBOutlet weak var textOTP4: UITextField!
    
    var otpValue1 = ""
    var otpValue2 = ""
    var otpValue3 = ""
    var otpValue4 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addBottomBorderColor(textField: textOTP1)
        addBottomBorderColor(textField: textOTP2)
        addBottomBorderColor(textField: textOTP3)
        addBottomBorderColor(textField: textOTP4)
        
        textOTP1.becomeFirstResponder()
    }
    
    //MARK: Custom Code to adding border color at bottom of textField
    func addBottomBorderColor(textField: UITextField){
        
        let layer = CALayer()
        layer.backgroundColor = UIColor.gray.cgColor
        layer.frame = CGRect(x: 0, y: textField.frame.size.height - 2.0, width: textField.frame.size.width, height: 2.0)
        textField.layer.addSublayer(layer)
    }
    
    //MARK: TextField Delegate Method
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if ((textField.text!.count < 1) && (string.count > 0)){ //Entering first and moving next TextField
            
            
            if textField == textOTP1{
                otpValue1 = string
                textOTP2.becomeFirstResponder()
            }
            
            if textField == textOTP2{
                otpValue2 = string
                textOTP3.becomeFirstResponder()
            }
            
            if textField == textOTP3{
                otpValue3 = string
                textOTP4.becomeFirstResponder()
            }
            
            if textField == textOTP4{
                otpValue4 = string
                textOTP4.resignFirstResponder()
            }
            
            textField.text = string
            
            return false
        }
        else if ((textField.text!.count >= 1) && (string.count == 0)){ // removing/deleteing
            
            if textField == textOTP1{
                otpValue1 = string
                textOTP1.resignFirstResponder()
            }
            
            if textField == textOTP2{
                otpValue2 = string
                textOTP1.becomeFirstResponder()
            }
            
            if textField == textOTP3{
                otpValue3 = string
                textOTP2.becomeFirstResponder()
            }
            
            if textField == textOTP4{
                otpValue4 = string
                textOTP3.becomeFirstResponder()
            }
            
            textField.text = ""
            return false
        }
        else if (textField.text!.count) >= 1{ // After changing value (Already entered but changing again)
            
            if textField == textOTP1{
                otpValue1 = string
            }
            
            if textField == textOTP2{
                otpValue2 = string
            }
            
            if textField == textOTP3{
                otpValue3 = string
            }
            
            if textField == textOTP4{
                otpValue4 = string
            }
            
            textField.text = string
            return false
        }
        return true
    }
    
    
    //MARK: Submit Button Clicked
    @IBAction func submitOtpClicked(_ sender: Any) {
        textOTP1.resignFirstResponder()
        textOTP2.resignFirstResponder()
        textOTP3.resignFirstResponder()
        textOTP4.resignFirstResponder()
        
        if otpValue1 == "" &&  otpValue2 == "" && otpValue3 == "" && otpValue4 == "" {
            
            let alert =  self.showAlert(msg: "Enter the OTP, It should not be empty", title: "Oops..")
            self.present(alert, animated: true, completion: nil)
            
        }
        else if otpValue1 == "" || otpValue2 == "" || otpValue3 == ""  || otpValue4 == "" {
            let alert =  self.showAlert(msg: "Please Enter the valid 4 digit OTP", title: "Error")
            self.present(alert, animated: true, completion: nil)
        }
        else{
            
            //do your another work // API Call
        }
    }
    
    //MARK: Show Alert Function
    func showAlert(msg:String, title: String) -> UIAlertController{
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        return alert
        //self.present(alert, animated: true, completion: nil)
    }
    
}

