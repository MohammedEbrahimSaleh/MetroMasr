//
//  SignUPViewController.swift
//  MetroMasr
//
//  Created by Other user on 2/21/19.
//  Copyright © 2019 SoftTechnology. All rights reserved.
//

import UIKit

class SignUPViewController: UIViewController {
      //variables
    
    var firstName = ""
    var surName = ""
    var lastName = ""
    var socialID = ""
    var phoneNumber = ""
    var adress = ""
    var email = ""
    var password = ""
    var repeatPass = ""
    
     // outlets
    @IBOutlet weak var userFirstNameTextField: DesignableTextField!
    
    @IBOutlet weak var userSurNameTextField: DesignableTextField!
    
    @IBOutlet weak var userLastNameTextField: DesignableTextField!
    
    @IBOutlet weak var userIDNumberTextField: DesignableTextField!
    
    @IBOutlet weak var userPhoneNumberTextField: DesignableTextField!
    
    @IBOutlet weak var userAdressTextField: DesignableTextField!
    
    @IBOutlet weak var userEmailTextField: DesignableTextField!
    
    @IBOutlet weak var userPasswordTextField: DesignableTextField!
    
    @IBOutlet weak var userRepeatPasswordTextField: DesignableTextField!
    // actions
    
    @IBAction func RegisterBtnPressed(_ sender: DesignableButton) {
        
        
        firstName=userFirstNameTextField.text!
        surName=userSurNameTextField.text!
        lastName=userLastNameTextField.text!
        socialID=userIDNumberTextField.text!
        phoneNumber=userPhoneNumberTextField.text!
        adress=userAdressTextField.text!
        email=userEmailTextField.text!
        password=userPasswordTextField.text!
        repeatPass=userRepeatPasswordTextField.text!
        
        if (firstName.isEmpty||surName.isEmpty||lastName.isEmpty||socialID.isEmpty||phoneNumber.isEmpty||adress.isEmpty||email.isEmpty||password.isEmpty||repeatPass.isEmpty)
        {
            
            
            let myAlert = UIAlertController(title: "Alert", message: "All fields are required", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated:true, completion:nil)
            
        }
        else if (password != repeatPass)
        {
            let myAlert = UIAlertController(title: "Alert", message: "Your password and the repeated password don't match", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated:true, completion:nil)
        }
        
        else
        {
            let myAlert = UIAlertController(title: "Congratulations", message: "Regestration successfull\n Welcome to Metro Masr", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){action in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "myTabBarViewController")as! myTabBarViewController
                self.present(vc, animated: true, completion: nil)

            }
            myAlert.addAction(okAction)
            self.present(myAlert, animated:true, completion:nil)
        }
        
        
    }
    
    @IBAction func haveAccountBtnPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "logInViewController")as! logInViewController
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

}
