//
//  myCurrentPositionViewController.swift
//  MetroMasr
//
//  Created by Other user on 2/26/19.
//  Copyright © 2019 SoftTechnology. All rights reserved.
//

import UIKit
import CoreLocation
class myCurrentPositionViewController: UIViewController, CLLocationManagerDelegate{

    //constants
    
    let locationManger = CLLocationManager()
    
    // variables
    
    var location:CLLocation?
    
    
    //outlets
    
    @IBOutlet weak var nearestStationLbl: UILabel!
    
    @IBOutlet weak var getDirectionBtn: UIButton!
    
    
    
    // actions
    @IBAction func getMyLocation(_ sender: UIButton) {
    
        //Display alert message with confirmation
        
        locationManger.requestWhenInUseAuthorization()
        locationManger.startUpdatingLocation()
        
    }
    
    
    @IBAction func getDirectionsBtnPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "myLocationOnMapViewController")as! myLocationOnMapViewController
        self.present(vc, animated: true, completion: nil)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getDirectionBtn.isHidden=true
        
         // Mark: - setup location manger here
        
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        
    }

    //Mark: - location manger methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         location = locations[locations.count-1]
        if (location!.horizontalAccuracy>0)
        {
            locationManger.stopUpdatingLocation()
            lookUpCurrentLocation(completionHandler: { (result)  in })
        }
    
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    //Mark: - a function change from  location manger cllocation to user friendely place mark
    
    func lookUpCurrentLocation(completionHandler: @escaping (CLPlacemark?)-> Void )
    {
        // Use the last reported location.
        if let lastLocation = locationManger.location {
            let geocoder = CLGeocoder()
            
            // Look up the location and pass it to the completion handler
            geocoder.reverseGeocodeLocation(lastLocation,completionHandler: { (placemarks, error) in
                if error == nil
                {
                    let firstLocation = placemarks?[0]
                    self.nearestStationLbl.text="Your current position is: \(firstLocation?.name ?? "") / \(firstLocation?.locality ?? "") / \(firstLocation?.administrativeArea ?? "") / \(firstLocation?.country ?? "") / \n the closest station for you is Ain shams station about 175 meters away ."
                    self.getDirectionBtn.isHidden=false
                    completionHandler(firstLocation)
                }
                else {
           // An error occurred during geocoding.
                       completionHandler(nil)
                    self.nearestStationLbl.text="error retriving location1 "
                    }
            })
        }
        else {
            // No location was available.
            completionHandler(nil)
            self.nearestStationLbl.text="error retriving location2 "
        }
    }
    
    
}
