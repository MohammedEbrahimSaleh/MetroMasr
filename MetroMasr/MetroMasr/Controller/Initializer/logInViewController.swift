//
//  logInViewController.swift
//  MetroMasr
//
//  Created by Other user on 2/21/19.
//  Copyright © 2019 SoftTechnology. All rights reserved.
//

import UIKit

class logInViewController: UIViewController {
    
    //variabls
    var email :String = ""
    var password :String = ""
    //outlets
    @IBOutlet weak var userEmailTextField: DesignableTextField!
    
    @IBOutlet weak var userPasswordTextField: DesignableTextField!
    
    // actions
    
    @IBAction func logInBtnPressed(_ sender: UIButton) {
        
        email=userEmailTextField.text!
        password=userPasswordTextField.text!
        
        if (email.isEmpty)
        {
              displayMyAlertMessage(alertTitle: "Alert", userMessage: "Please enter your email")
               return;
        }
        else if (password.isEmpty)
        {
            displayMyAlertMessage(alertTitle: "Alert", userMessage: "Please enter your Password if you forgot it press forget password button")
            return;
        }
        if email=="1"&&password=="1"
       {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let vc = storyboard.instantiateViewController(withIdentifier: "myTabBarViewController")as! myTabBarViewController
              self.present(vc, animated: true, completion: nil)
        }
        else
        {
            displayMyAlertMessage(alertTitle: "Alert", userMessage: "Wrong  email or passwoed")
        }
        
    }
    
    @IBAction func forgetBtnPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "forgetPasswordViewController")as! forgetPasswordViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignUPViewController")as! SignUPViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    
    // view did load
    override func viewDidLoad() {
        
        let tapGesture = UITapGestureRecognizer(target:self, action: #selector(logInViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        super.viewDidLoad()
        
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    
    func displayMyAlertMessage(alertTitle:String,userMessage:String)
    {
        let myAlert = UIAlertController(title: alertTitle, message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated:true, completion:nil)
    }

    
  }

