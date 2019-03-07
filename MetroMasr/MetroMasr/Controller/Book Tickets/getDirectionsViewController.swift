//
//  getDirectionsViewController.swift
//  MetroMasr
//
//  Created by Other user on 3/4/19.
//  Copyright © 2019 SoftTechnology. All rights reserved.
//

import UIKit

class getDirectionsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    // variables
   var arr : [String]?
    
    // outlets
    @IBOutlet weak var directionsTable: UITableView!
    

    
    
    
    
    @IBAction func doneBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arr?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = directionsTable.dequeueReusableCell(withIdentifier: "cell") as! dierctionTableViewCell
        if (arr![indexPath.row]=="Helwan Direction"||arr![indexPath.row]=="Giza Direction"||arr![indexPath.row]=="Attaba Direction"||arr![indexPath.row]=="El Marg Direction"||arr![indexPath.row]=="Shoubra Direction"||arr![indexPath.row]=="El 3abasya Direction")
        {
            cell.directionLbl.textColor = UIColor.black
            cell.directionLbl.backgroundColor = UIColor.white
            cell.directionImage.image = UIImage.init(named: "point1")
            
        }
        cell.directionLbl.text = arr?[indexPath.row]
        
        return cell 
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        directionsTable.delegate = self
        directionsTable.dataSource = self
        directionsTable.allowsSelection = false
        directionsTable.reloadData()
       
    }

}
