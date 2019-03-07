//
//  demonstrationViewController.swift
//  Gifty
//
//  Created by Other user on 2/18/19.
//  Copyright © 2019 Other user. All rights reserved.
//

import UIKit

class demonstrationViewController: UIViewController, UIScrollViewDelegate {
    // variables
    
    var images: [String] = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
    var describtion : [String] = ["Metro Masr will be an entire new experience for you . \n With Metro Masr installed on your Iphone your subway travells will be so much easier .\n Please read the next atleast once before usage .","If you are a regular comuter or if it is the first time for you using the subway don't worry . \n it will be so easy and joyable for you with Metro Masr in your side .","The app has so many options that will make your subway travel the easiest and the greatest ever . ","With the MAPS properity you can have a detailed map for every line of the cairo metro three lines with all the stations names and directions . ","With the Nearest Station properity you can know the closest station to your current position or to any other position and also you can get the exact directions to it .  ","The book Tickets properity is a major one in the app as you can book online tickets to any station \nSo no more lines or latensy all you need is Metro Masr and internet connection . ","Calculating how many stations between current position and destination and choose the right kind of ticket to book is also part of Book tickets properity saving you much time and money\n You only decide how many tickets you need .  ","As soon as you book a ticket you'll get a Barcode to let you into the station and out of it much easy and saving time but it expire after 24 hours from recieving it . ","If you got a problem with your  Barcode you can get to Barcode issue in your account and you will get a new one very fast . ","In my account properity you have your personal informations along side your travels log or history and a record of every ticket you booked and both the source and the destination .\n Also you can send a Barcode issue if you got any . ","In setting proberity you will get to change any of your personal informations and also some extra setings as sounds and elerts  etc...","Notice that you will be able to book only 15 tickets a day with maximum number of 100 tickets a week .","The charges for the tickets you book will be the same regular charge you pay traditonally plus tax fees ","Also keep your Bar code image really close to the scanner to avoid any delays or problems . ","We assure you with Metro Masr your travels experience will be plesent and easy ",""]
    
    
    
    
    var frame1 = CGRect(x: 0, y: 0, width: 0, height: 0)
    var frame2 = CGRect(x: 0, y: 0, width: 0, height: 0)
    //constants
    //outlets
    @IBOutlet weak var myScrollView: UIScrollView!
    
    @IBOutlet weak var myPageControl: UIPageControl!
    
    
    //actions
    

    
    // view did load
    override func viewDidLoad() {
        super.viewDidLoad()

        myPageControl.numberOfPages = images.count
        for index in 0..<images.count {
            frame1.origin.x = myScrollView.frame.size.width * CGFloat(index)
            frame1.size.height = myScrollView.frame.size.height / 2
            frame1.size.width = myScrollView.frame.size.width
            
            let imgView = UIImageView(frame:frame1)
            imgView.image = UIImage(named: images[index])
            self.myScrollView.addSubview(imgView)
            
            
            
            frame2.origin.x = (myScrollView.frame.size.width * CGFloat(index)) + 20
            frame2.origin.y = myScrollView.frame.size.height / 2
            frame2.size.height = myScrollView.frame.size.height / 2
            frame2.size.width = (myScrollView.frame.size.width) - 50
            
            let desLabel = UILabel(frame: frame2)
            desLabel.textColor = .white
            desLabel.textAlignment = .center
            desLabel.text = describtion[index]
            desLabel.numberOfLines = 10
            self.myScrollView.addSubview(desLabel)
            
            
            
            
        }
        myScrollView.contentSize = CGSize(width: myScrollView.frame.size.width * CGFloat(images.count), height: myScrollView.frame.size.height)
               myScrollView.delegate = self
        
    }

    // functions
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = myScrollView.contentOffset.x / myScrollView.frame.size.width
        myPageControl.currentPage = Int(pageNumber)
    }

}
