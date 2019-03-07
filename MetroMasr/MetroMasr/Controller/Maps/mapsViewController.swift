//
//  mapsViewController.swift
//  MetroMasr
//
//  Created by Other user on 2/26/19.
//  Copyright © 2019 SoftTechnology. All rights reserved.
//

import UIKit

class mapsViewController: UIViewController {
// outlets
    @IBOutlet weak var myLinesSegmentcontrol: UISegmentedControl!
    
    @IBOutlet weak var myMapsImageView: UIImageView!
   // actions
    
    
    @IBAction func myLinesSegementPressed(_ sender: UISegmentedControl) {
        
        if myLinesSegmentcontrol.selectedSegmentIndex==0{
            myMapsImageView.image=UIImage.init(named: "line1")
        }
        
        else if myLinesSegmentcontrol.selectedSegmentIndex==1{
            myMapsImageView.image=UIImage.init(named: "line2")
        }
        
        else if myLinesSegmentcontrol.selectedSegmentIndex==2{
            myMapsImageView.image=UIImage.init(named: "line3")
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myMapsImageView.image=UIImage.init(named: "line1")

        
    }

    
    
    
    
    
}
