//  ViewController.swift
//  the test
//  Created by IOS on 2/27/19.
//  Copyright © 2019 IOS. All rights reserved.
    
    
import UIKit
    
class BookTicketsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
   
        //constants
    let firstLine = ["New Marg","El Marg","Azbet El Nakheel","Ain Shams","El Matrya","Helmyt El Zayton","Hadayak El Zyton","Sarya El Koba","Hamamat El Koba","Kobry El Koba","Manshiet El Sadr","El demerdash","Gamra","El Shohadaa","Ahmed Orabi","Naser","Saddat","Saad Zaglol","ElSayda Zienb","El Malk El Saleh","Mari Gergis","El Zahraa","Dar El Salam","Hadayk El Maadi","El Maadi","Thaknat El Maadi","Tora El Balad","Kozzika","Tora El Asmant","El Maasara","Hadayek Helwan","Wadi Hoof","Helwan University","Ain Helwan","Helwan"]
    
    let secondLine = ["Shubra","Kolyat El Zera3a","El Mazalat","El Khalafawi","St.Terisa","Rod El Farag","Massara","El Shohadaa","Attaba","Muhamed Nagguib","Saddat","El Opera","Dokki","El Bohoos","Cairo University","Faysal","Giza","Om El Misryeen","Sakiat Mikki","El Monib"]
    
    let thirdLine = ["El Ahram","Kolyey El Banat","Cairo Stadium","Cairo Fairgrounds","El Abbasiya","Abdou Basha","El Geish","Bab El Sha3ria","Attaba"]
    
    
    let datasource = ["New Marg","El Marg","Azbet El Nakheel","Ain Shams","El Matrya","Helmyt El Zayton","Hadayak El Zyton","Sarya El Koba","Hamamat El Koba","Kobry El Koba","Manshiet El Sadr","El demerdash","Gamra","El Shohadaa","Ahmed Orabi","Naser","Saddat","Saad Zaglol","ElSayda Zienb","El Malk El Saleh","Mari Gergis","El Zahraa","Dar El Salam","Hadayk El Maadi","El Maadi","Thaknat El Maadi","Tora El Balad","Kozzika","Tora El Asmant","El Maasara","Hadayek Helwan","Wadi Hoof","Helwan University","Ain Helwan","Helwan","Shubra","Kolyat El Zera3a","El Mazalat","El Khalafawi","St.Terisa","Rod El Farag","Massara","Attaba" ,"Muhamed Nagguib","El Opera","Dokki","El Bohoos","Cairo University","Faysal","Giza","Om El Misryeen","Sakiat Mikki","El Monib","El Ahram","Kolyey El Banat","Cairo Stadium","Cairo Fairgrounds","El Abbasiya","Abdou Basha","El Geish","Bab El Sha3ria"]
        
        //-- variables
    var source = ""
    var destiation = ""
    var sourceLine = 0
    var destinationLine = 0
    var numberOfTickets = 0
    var numberOfStations = 0
    var totalFees2 : Int = 0
    var direction1 : ([String],Int)?
    var direction2 : ([String],Int)?
    var direction3 : ([String],Int)?
    var totalDirection : [String]?
        
        
        //--outlets
    @IBOutlet weak var fromLabl: UILabel!
    @IBOutlet weak var toLbl: UILabel!
    @IBOutlet weak var fromPicker: UIPickerView!
    @IBOutlet weak var toPicker: UIPickerView!
    @IBOutlet weak var numofticketsTextField: UITextField!
    @IBOutlet weak var ticketCalcultionLbl: UILabel!
    @IBOutlet weak var bookNowBtn: DesignableButton!
    @IBOutlet weak var hereBtn: DesignableButton!
    
        //--actions
    @IBAction func bookNowBtnPressed(_ sender: DesignableButton) {
        
        numberOfTickets = Int(numofticketsTextField.text!)!
    }
    
    
    @IBAction func hereBtnPressed(_ sender: DesignableButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "getDirectionsViewController") as!getDirectionsViewController
             vc.arr=totalDirection
        self.present(vc, animated: true, completion: nil)
        
        
    }
    
    
    
    @IBAction func calculateMyBtnPressed(_ sender: UIButton) {
        
        
        
        if((numofticketsTextField.text?.isEmpty)!||Int(numofticketsTextField.text!)! > 15)
        {
            
            let myAlert = UIAlertController(title: "Alert", message: "Please Enter a number of Tickets no more than 15  ", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated:true, completion:nil)
            
        }
        
     else
        {
            numberOfTickets=Int(numofticketsTextField.text!)!
           // check if the station in both source and destination are the same
        if source==destiation
        {
                ticketCalcultionLbl.text = "You choosed the same station in both the source and the destination \n You can't book a ticket for the same station "
                 bookNowBtn.isHidden = true
                 hereBtn.isHidden = true
        }
        else
        {
            // check if the station in both source and destination are in the same line
            finishUP(sour: source, dest: destiation)
        }
            
    }
        
}
    
    
   
    
    ///////////////////////////////////////////////////////////////////////
    // function to  Know a specific station in which line
    func whichLine (station:String)-> Int
    {
        var lineNumber = 0
        
        for i in 0..<firstLine.count
        {
            if station==firstLine[i]
            {lineNumber=lineNumber+10}
        }
        for i in 0..<secondLine.count
        {
            if station==secondLine[i]
            {lineNumber=lineNumber+11}
        }
        for i in 0..<thirdLine.count
        {
            if station==thirdLine[i]
            {lineNumber=lineNumber+12}
        }
        return lineNumber
    }
    
    
    //function to check if i am in the same line or not
    
    
    func finishUP(sour:String,dest:String)
    {
        
        sourceLine = whichLine(station: sour)
        destinationLine =  whichLine(station: dest)

        
        if ((sourceLine==destinationLine)||(sourceLine==10&&destinationLine==21)||(sourceLine==11&&destinationLine==21)||(sourceLine==11&&destinationLine==23)||(sourceLine==12&&destinationLine==23)||(sourceLine==21&&destinationLine==10)||(sourceLine==21&&destinationLine==11)||(sourceLine==21&&destinationLine==23)||(sourceLine==23&&destinationLine==11)||(sourceLine==23&&destinationLine==12)||(sourceLine==23&&destinationLine==21))
            
        {
            if (sourceLine==10&&destinationLine==10)||(sourceLine==21&&destinationLine==21)||(sourceLine==10&&destinationLine==21)||(sourceLine==21&&destinationLine==10)
            {
            
                
                direction1 = sameLineDirectionsandfees(line: firstLine, sour: source, dest: destiation)
                numberOfStations = direction1!.1
                totalFees2 =  getTotalFees(numberOfStations: direction1!.1)
                 totalDirection = direction1!.0
                ticketCalcultionLbl.text = "It's \(numberOfStations) stations between \(source) and \(destiation)\n The total fees are \(totalFees2) EGP \n press the direction button below to get details . "
                bookNowBtn.isHidden=false
                hereBtn.isHidden=false

            }
            else if (sourceLine==11&&destinationLine==11)||(sourceLine==21&&destinationLine==21)||(sourceLine==23&&destinationLine==23)||(sourceLine==11&&destinationLine==21)||(sourceLine==11&&destinationLine==23)||(sourceLine==21&&destinationLine==11)||(sourceLine==21&&destinationLine==23)||(sourceLine==23&&destinationLine==11)||(sourceLine==23&&destinationLine==21)
            {
                
                direction1 = sameLineDirectionsandfees(line: secondLine, sour: source, dest: destiation)
                numberOfStations = direction1!.1
                totalFees2 =  getTotalFees(numberOfStations: direction1!.1)
                 totalDirection = direction1!.0
                ticketCalcultionLbl.text = "It's \(numberOfStations) stations between \(source) and \(destiation)\n The total fees are \(totalFees2) EGP \n press the direction button below to get details . ) "
                bookNowBtn.isHidden=false
                hereBtn.isHidden=false



            }
            else if (sourceLine==12&&destinationLine==12)||(sourceLine==23&&destinationLine==23)||(sourceLine==12&&destinationLine==23)||(sourceLine==23&&destinationLine==12)
            {
            
            
                
                direction1 = sameLineDirectionsandfees(line: thirdLine, sour: source, dest: destiation)
                numberOfStations = direction1!.1
                totalFees2 =  getTotalFees(numberOfStations: direction1!.1)
                 totalDirection = direction1!.0
                ticketCalcultionLbl.text = "It's \(numberOfStations) stations between \(source) and \(destiation)\n The total fees are \(totalFees2) EGP \n press the direction button below to get details .  "
                bookNowBtn.isHidden=false
                hereBtn.isHidden=false
                



            }
            
        }
        else
        {
           // state one ( i am in line 1 and want to go to line 2 )
            
            if (sourceLine==10||sourceLine==21)&&(destinationLine==11||destinationLine==21||destinationLine==23)
            {
                
                if (whereInLine(line: secondLine, station: destiation)<=6)||((whereInLine(line: firstLine, station: source)<=15) && (destiation == "Attaba"))||((whereInLine(line: firstLine, station: source)<=14) && (destiation == "Muhamed Nagguib"))
                {
                    
                    direction1 = sameLineDirectionsandfees(line: firstLine, sour: source, dest: "El Shohadaa")
                    numberOfStations =  direction1!.1
                    direction2 = sameLineDirectionsandfees(line: secondLine, sour: "El Shohadaa", dest:destiation  )
                    direction2!.0 = direction1!.0 + direction2!.0
                    numberOfStations = numberOfStations + direction2!.1 - 1
                    totalFees2 =  getTotalFees(numberOfStations: numberOfStations)
                    totalDirection = direction2!.0

                    ticketCalcultionLbl.text = "It's \(numberOfStations) stations between \(source) and \(destiation)\n The total fees are \(totalFees2) EGP \n press the direction button below to get details .  "
                bookNowBtn.isHidden=false
                hereBtn.isHidden=false
                 }
                
                
                   else if ((whereInLine(line: firstLine, station: source)>=17) && (destiation=="Attaba")||(whereInLine(line: firstLine, station: source)>=15) && (destiation=="Muhamed Nagguib")||(whereInLine(line: secondLine, station: destiation)>=11))
                    {
                        
                        direction1 = sameLineDirectionsandfees(line: firstLine, sour: source, dest: "Saddat")
                        numberOfStations =  direction1!.1
                        direction2 = sameLineDirectionsandfees(line: secondLine, sour: "Saddat", dest:destiation  )
                        direction2!.0 = direction1!.0 + direction2!.0
                        numberOfStations = numberOfStations + direction2!.1 - 1
                        totalFees2 =  getTotalFees(numberOfStations: numberOfStations)
                         totalDirection = direction2!.0
                        ticketCalcultionLbl.text = "It's \(numberOfStations) stations between \(source) and \(destiation)\n The total fees are \(totalFees2) EGP \n press the direction button below to get details .  "
                        bookNowBtn.isHidden=false
                        hereBtn.isHidden=false
                        
                    }
                
            }
        
/////////////////////////////////////////////////////////////////////////////////////
                //if i am in line 2 and want to go to line 1
           else if ((sourceLine==11||sourceLine==21||sourceLine==23)&&(destinationLine==10||destinationLine==21))
            {


                
                if (whereInLine(line: secondLine, station: source)<=6)||((whereInLine(line: firstLine, station: destiation)<=15) && (source == "Attaba"))||((whereInLine(line: firstLine, station: destiation)<=14) && (source == "Muhamed Nagguib"))
                {
                    
                    direction1 = sameLineDirectionsandfees(line: secondLine, sour: source, dest: "El Shohadaa")
                    numberOfStations =  direction1!.1
                    direction2 = sameLineDirectionsandfees(line: firstLine, sour: "El Shohadaa", dest:destiation  )
                    direction2!.0 = direction1!.0 + direction2!.0
                    numberOfStations = numberOfStations + direction2!.1 - 1
                    totalFees2 =  getTotalFees(numberOfStations: numberOfStations)
                    totalDirection = direction2!.0
                    
                    ticketCalcultionLbl.text = "It's \(numberOfStations) stations between \(source) and \(destiation)\n The total fees are \(totalFees2) EGP \n press the direction button below to get details . "
                    bookNowBtn.isHidden=false
                    hereBtn.isHidden=false
                }
                    
                    
                else if ((whereInLine(line: firstLine, station: destiation)>=17) && (source=="Attaba")||(whereInLine(line: firstLine, station: destiation)>=15) && (source=="Muhamed Nagguib")||(whereInLine(line: secondLine, station: source)>=11))
                {
                    
                    direction1 = sameLineDirectionsandfees(line: secondLine, sour: source, dest: "Saddat")
                    numberOfStations =  direction1!.1
                    direction2 = sameLineDirectionsandfees(line: firstLine, sour: "Saddat", dest:destiation  )
                    direction2!.0 = direction1!.0 + direction2!.0
                    numberOfStations = numberOfStations + direction2!.1 - 1
                    totalFees2 =  getTotalFees(numberOfStations: numberOfStations)
                    totalDirection = direction2!.0
                    ticketCalcultionLbl.text = "It's \(numberOfStations) stations between \(source) and \(destiation)\n The total fees are \(totalFees2) EGP \n press the direction button below to get details . "
                    bookNowBtn.isHidden=false
                    hereBtn.isHidden=false
                    
                }
                
                
                

            }
/////////////////////////////////////////////////////////////////////////////////////
            //if i am in line 2 and want to go to line 3
            
            
           else if ((sourceLine==11||sourceLine==21||sourceLine==23)&&(destinationLine==12||destinationLine==23))
            {
                
                
                
                if (whereInLine(line: secondLine, station: source)<=19) && ((whereInLine(line: thirdLine, station: destiation)<=8))
                {
                    
                    direction1 = sameLineDirectionsandfees(line: secondLine, sour: source, dest: "Attaba")
                    numberOfStations =  direction1!.1
                    direction2 = sameLineDirectionsandfees(line: thirdLine, sour: "Attaba", dest:destiation  )
                    direction2!.0 = direction1!.0 + direction2!.0
                    numberOfStations = numberOfStations + direction2!.1 - 1
                    totalFees2 =  getTotalFees(numberOfStations: numberOfStations)
                    totalDirection = direction2!.0
                    
                    ticketCalcultionLbl.text = "It's \(numberOfStations) stations between \(source) and \(destiation)\n The total fees are \(totalFees2) EGP \n press the direction button below to get details . "
                    bookNowBtn.isHidden=false
                    hereBtn.isHidden=false
                }
           }
 /////////////////////////////////////////////////////////////////////////////////////
            
            
            //if i am in line 3 and want to go to line 2
            
            
           else if ((sourceLine==12||sourceLine==23) && (destinationLine==11||destinationLine==21||destinationLine==23))
            {
                
                
                
                if (whereInLine(line: secondLine, station: destiation)<=19) && ((whereInLine(line: thirdLine, station: source)<=8))
                {
                    
                    direction1 = sameLineDirectionsandfees(line: secondLine, sour: source, dest: "Attaba")
                    numberOfStations =  direction1!.1
                    direction2 = sameLineDirectionsandfees(line: thirdLine, sour: "Attaba", dest:destiation  )
                    direction2!.0 = direction1!.0 + direction2!.0
                    numberOfStations = numberOfStations + direction2!.1 - 1
                    totalFees2 =  getTotalFees(numberOfStations: numberOfStations)
                    totalDirection = direction2!.0
                    
                    ticketCalcultionLbl.text = "It's \(numberOfStations) stations between \(source) and \(destiation)\n The total fees are \(totalFees2) EGP \n press the direction button below to get details . "
                    bookNowBtn.isHidden=false
                    hereBtn.isHidden=false
                }
            }
            
            
/////////////////////////////////////////////////////////////////////////////////////
            // state one ( i am in line 1 and want to go to line 3 )
            
           else if (sourceLine==10||sourceLine==21)&&(destinationLine==12||destinationLine==23)
            {
                
                if (whereInLine(line: firstLine, station: source)<=15) && (whereInLine(line: thirdLine, station: destiation)<=8)
                {
                    
                    direction1 = sameLineDirectionsandfees(line: firstLine, sour: source, dest: "El Shohadaa")
                    numberOfStations =  direction1!.1
                    direction2 = sameLineDirectionsandfees(line: secondLine, sour: "El Shohadaa", dest:"Attaba"  )
                    direction2!.0 = direction1!.0 + direction2!.0
                    numberOfStations = numberOfStations + direction2!.1 - 1
                    direction3 = sameLineDirectionsandfees(line: thirdLine, sour: "Attaba", dest:destiation  )
                    direction3!.0 = direction2!.0 + direction3!.0

                    numberOfStations = numberOfStations + direction3!.1 - 1
                    totalFees2 =  getTotalFees(numberOfStations: numberOfStations)
                    totalDirection = direction3!.0
                    
                    ticketCalcultionLbl.text = "It's \(numberOfStations) stations between \(source) and \(destiation)\n The total fees are \(totalFees2) EGP \n press the direction button below to get details . "
                    bookNowBtn.isHidden=false
                    hereBtn.isHidden=false
                }
                    
                    
                else if (whereInLine(line: firstLine, station: source)>16) && (whereInLine(line: thirdLine, station: destiation)<=8)
                {
                    
                    direction1 = sameLineDirectionsandfees(line: firstLine, sour: source, dest: "Saddat")
                    numberOfStations =  direction1!.1
                    direction2 = sameLineDirectionsandfees(line: secondLine, sour: "Saddat", dest:"Attaba"  )
                    direction2!.0 = direction1!.0 + direction2!.0
                    numberOfStations = numberOfStations + direction2!.1 - 1
                    direction3 = sameLineDirectionsandfees(line: thirdLine, sour: "Attaba", dest:destiation  )
                    direction3!.0 = direction2!.0 + direction3!.0
                    
                    numberOfStations = numberOfStations + direction3!.1 - 1
                    totalFees2 =  getTotalFees(numberOfStations: numberOfStations)
                    totalDirection = direction3!.0
                    
                    ticketCalcultionLbl.text = "It's \(numberOfStations) stations between \(source) and \(destiation)\n The total fees are \(totalFees2) EGP \n press the direction button below to get details . "
                    bookNowBtn.isHidden=false
                    hereBtn.isHidden=false
                }
                
            }
            
/////////////////////////////////////////////////////////////////////////////////////
            
            // state one ( i am in line 3 and want to go to line 1 )
            
           else if (sourceLine==12||sourceLine==23) && (destinationLine==10||destinationLine==21)
            {
                
                if (whereInLine(line: firstLine, station: source)<=15) && (whereInLine(line: thirdLine, station: source)<=8)
                {
                    
                    direction1 = sameLineDirectionsandfees(line: thirdLine, sour: source, dest: "Attaba")
                    numberOfStations =  direction1!.1
                    direction2 = sameLineDirectionsandfees(line: secondLine, sour: "Attaba", dest:"El Shohadaa"  )
                    direction2!.0 = direction1!.0 + direction2!.0
                    numberOfStations = numberOfStations + direction2!.1 - 1
                    direction3 = sameLineDirectionsandfees(line: firstLine, sour: "El Shohadaa", dest:destiation  )
                    direction3!.0 = direction2!.0 + direction3!.0
                    
                    numberOfStations = numberOfStations + direction3!.1 - 1
                    totalFees2 =  getTotalFees(numberOfStations: numberOfStations)
                    totalDirection = direction3!.0
                    
                    ticketCalcultionLbl.text = "It's \(numberOfStations) stations between \(source) and \(destiation)\n The total fees are \(totalFees2) EGP \n press the direction button below to get details . "
                    bookNowBtn.isHidden=false
                    hereBtn.isHidden=false
                }
                    
                    
                else if (whereInLine(line: firstLine, station: destiation)>=16) && (whereInLine(line: thirdLine, station: source)<=8)
                {
                    
                    direction1 = sameLineDirectionsandfees(line: thirdLine, sour: source, dest: "Attaba")
                    numberOfStations =  direction1!.1
                    direction2 = sameLineDirectionsandfees(line: secondLine, sour: "Attaba", dest:"Saddat"  )
                    direction2!.0 = direction1!.0 + direction2!.0
                    numberOfStations = numberOfStations + direction2!.1 - 1
                    direction3 = sameLineDirectionsandfees(line: firstLine, sour: "Saddat", dest:destiation  )
                    direction3!.0 = direction2!.0 + direction3!.0
                    
                    numberOfStations = numberOfStations + direction3!.1 - 1
                    totalFees2 =  getTotalFees(numberOfStations: numberOfStations)
                    totalDirection = direction3!.0
                    
                    ticketCalcultionLbl.text = "It's \(numberOfStations) stations between \(source) and \(destiation)\n The total fees are \(totalFees2) EGP \n press the direction button below to get details . "
                    bookNowBtn.isHidden=false
                    hereBtn.isHidden=false
                }
                
            }
            
 /////////////////////////////////////////////////////////////////////////////////////
        }
        
    }

    
    //function to calculate the ticket if in the same direction
    
    func sameLineDirectionsandfees(line : [String],sour:String,dest:String)->([String],Int)
    {
        var arr: [String]=[]
        var numOfStations = 0
        var direct1 : String = ""
        var direct2 :String = ""
        var station1Number = 0
        var station2Number = 0
       
        
        
        station1Number = whereInLine(line: line, station: sour)
        station2Number = whereInLine(line: line, station: dest)
        
        if station2Number>station1Number
        {
            
            
            numOfStations = (station2Number-station1Number)+1
            
            
            if line==firstLine
            {
                direct1 = "Helwan Direction"
            }
                
            else if line==secondLine
            {
                direct1 = "Giza Direction"
            }
            else
            {
                direct1 = "Attaba Direction"
            }
           
            arr.append(direct1)
            
            for x in (station1Number+1)..<(station2Number+1)
            {
                arr.append(line[x])
            }
            
            
        }
        
        
        
       else if station1Number>station2Number
        {
            
            
            numOfStations = (station1Number-station2Number)+1
           
            
            if line==firstLine
            {
                direct2 = "El Marg Direction"
            }
               
            else if line==secondLine
            {
                direct2 = "Shoubra Direction"
            }
            else
            {
                direct2 = "El 3abasya Direction"
            }
            
            arr.append(direct2)
            
            for x in (station2Number...(station1Number-1)).reversed()
            {
                arr.append(line[x])
            }
            
            
        }
        
        return (arr, numOfStations)
    }
   // function to calculate the fees
    func getTotalFees (numberOfStations:Int)->Int
    {
        var theTotalfees = 0
        if numberOfStations<=9
        {
            theTotalfees = numberOfTickets * 3
        }
        else if numberOfStations>9&&numberOfStations<=16
        {
            theTotalfees = numberOfTickets * 5
        }
        else if numberOfStations>16
        {
            theTotalfees = numberOfTickets * 7
        }
        return theTotalfees
        
    }
    
 // function to know where in line  a station is
func whereInLine(line:[String],station:String)-> Int
{
    var  stationNumber:Int = 0
    for i in 0..<line.count
    { if (station==line[i])
      {
        stationNumber = i

       }
    }
    return stationNumber
}
    
    
    
    
    
    
    //-- view did load
    override func viewDidLoad()
    {
    super.viewDidLoad()
    bookNowBtn.isHidden=true
    hereBtn.isHidden = true
    toPicker.delegate = self
    toPicker.dataSource = self
    fromPicker.delegate = self
    fromPicker.dataSource = self
    self.numofticketsTextField.delegate = self
       
        }
        
        //functions
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return datasource.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView==fromPicker
        {
        fromLabl.text = "from: "+datasource[row]
            source = datasource[row]
        }
        else if pickerView==toPicker
        {
        toLbl.text = "to: "+datasource[row]
            destiation = datasource[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: datasource[row], attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        return attributedString
    }
    
    // to make sure only digits inside the number of tickets text field
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharecters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharecters.isSuperset(of: characterSet)
    }
    
    
    

        
}

