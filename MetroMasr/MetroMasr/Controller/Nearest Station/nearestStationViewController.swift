//
//  nearestStationViewController.swift
//  MetroMasr
//
//  Created by Other user on 2/26/19.
//  Copyright © 2019 SoftTechnology. All rights reserved.
//

import UIKit

class nearestStationViewController: UIViewController {

    //variables
    var child : UIViewController? //= //myCurrentPositionViewController()
    //outlets
    
    @IBOutlet weak var mySegmentControl: UISegmentedControl!
    
    @IBOutlet weak var myView: UIView!
    
    // actions
    
    @IBAction func nearestStationSegmentPressed(_ sender: UISegmentedControl) {
        child!.willMove(toParentViewController: nil)
        child!.removeFromParentViewController()
        child!.view.removeFromSuperview()
        
        if mySegmentControl.selectedSegmentIndex == 0
        {
            child = myCurrentPositionViewController()
            addChildViewController(child!)
            myView.addSubview(child!.view)
            child!.didMove(toParentViewController: self)
        }
        else if mySegmentControl.selectedSegmentIndex == 1
        {
            child = anotherPositionViewController()
            addChildViewController(child!)
            myView.addSubview(child!.view)
            child!.didMove(toParentViewController: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        child = myCurrentPositionViewController()
        addChildViewController(child!)
        myView.addSubview(child!.view)
        child!.didMove(toParentViewController: self)
    }
}
