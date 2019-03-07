//
//  anotherPositionViewController.swift
//  MetroMasr
//
//  Created by Other user on 2/26/19.
//  Copyright © 2019 SoftTechnology. All rights reserved.
//

import UIKit

class anotherPositionViewController: UIViewController {

    // variables
    var location : String = ""
    //outlets
    @IBOutlet weak var locationTextField: DesignableTextField!
    
    @IBOutlet weak var nearestStationLbl: UILabel!
    
    
    @IBOutlet weak var getDirectionBtn: DesignableButton!
    
    //actions
    
    @IBAction func getStationBtnPressed(_ sender: DesignableButton) {
        
        location = locationTextField.text!
        if (location.isEmpty)
        {
            let myAlert1 = UIAlertController(title: "Alert", message: "you have to write a location to get the nearest station", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default)
            myAlert1.addAction(okAction)
            self.present(myAlert1, animated:true, completion:nil)
            return;
        }
        
        let myAlert = UIAlertController(title: "Notice", message: "Make sure your GPS is on and there is internet coonnection to get the best results", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default){ action in self.nearestStationLbl.text="The closest station for \(self.location)    is Ain shams station about 175 meters away ."
            self.getDirectionBtn.isEnabled=true
        }
            myAlert.addAction(okAction)
            self.present(myAlert, animated:true, completion:nil)
        
        
       
    
    }
    
    
    
    @IBAction func getDirectionsBtnPressed(_ sender: DesignableButton) {
    }
    
    
    // view did load
    override func viewDidLoad() {
        super.viewDidLoad()

        getDirectionBtn.isEnabled=false
        
       
    }

    
    
    
    
}
