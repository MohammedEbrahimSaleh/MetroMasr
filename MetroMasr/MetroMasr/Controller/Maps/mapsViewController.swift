//
//  mapsViewController.swift
//  MetroMasr
//
//  Created by Other user on 2/26/19.
//  Copyright © 2019 SoftTechnology. All rights reserved.
//

import UIKit

class mapsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   // constants
   var arr = ["New Marg","El Marg","Azbet El Nakheel","Ain Shams","El Matrya","Helmyt El Zayton","Hadayak El Zyton","Sarya El Koba","Hamamat El Koba","Kobry El Koba","Manshiet El Sadr","El demerdash","Gamra","El Shohadaa","Ahmed Orabi","Naser","Saddat","Saad Zaglol","ElSayda Zienb","El Malk El Saleh","Mari Gergis","El Zahraa","Dar El Salam","Hadayk El Maadi","El Maadi","Thaknat El Maadi","Tora El Balad","Kozzika","Tora El Asmant","El Maasara","Hadayek Helwan","Wadi Hoof","Helwan University","Ain Helwan","Helwan"]
    
    let firstLine = ["New Marg","El Marg","Azbet El Nakheel","Ain Shams","El Matrya","Helmyt El Zayton","Hadayak El Zyton","Sarya El Koba","Hamamat El Koba","Kobry El Koba","Manshiet El Sadr","El demerdash","Gamra","El Shohadaa","Ahmed Orabi","Naser","Saddat","Saad Zaglol","ElSayda Zienb","El Malk El Saleh","Mari Gergis","El Zahraa","Dar El Salam","Hadayk El Maadi","El Maadi","Thaknat El Maadi","Tora El Balad","Kozzika","Tora El Asmant","El Maasara","Hadayek Helwan","Wadi Hoof","Helwan University","Ain Helwan","Helwan"]
    
    let secondLine = ["Shubra","Kolyat El Zera3a","El Mazalat","El Khalafawi","St.Terisa","Rod El Farag","Massara","El Shohadaa","Attaba","Muhamed Nagguib","Saddat","El Opera","Dokki","El Bohoos","Cairo University","Faysal","Giza","Om El Misryeen","Sakiat Mikki","El Monib"]
    
    let thirdLine = ["El Ahram","Kolyey El Banat","Cairo Stadium","Cairo Fairgrounds","El Abbasiya","Abdou Basha","El Geish","Bab El Sha3ria","Attaba"]
    
    
// outlets
    @IBOutlet weak var myLinesSegmentcontrol: UISegmentedControl!
    
    
    
    @IBOutlet weak var linesTable: UITableView!
    // actions
    
    
    @IBAction func myLinesSegementPressed(_ sender: UISegmentedControl) {
        
        if myLinesSegmentcontrol.selectedSegmentIndex==0{
             arr = firstLine
             linesTable.reloadData()
        }
        
        else if myLinesSegmentcontrol.selectedSegmentIndex==1{
       arr = secondLine
             linesTable.reloadData()
        }
        
        else if myLinesSegmentcontrol.selectedSegmentIndex==2{
            arr = thirdLine
             linesTable.reloadData()
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       linesTable.delegate = self
        linesTable.dataSource = self
        linesTable.allowsSelection = false
        linesTable.reloadData()
        

        
    }
//functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = linesTable.dequeueReusableCell(withIdentifier: "cell") as! dierctionTableViewCell
        cell.cellLbl.text = arr[indexPath.row]
        return cell
    }
    
    
    
    
    
}
