//
//  myLocationOnMapViewController.swift
//  MetroMasr
//
//  Created by Other user on 3/6/19.
//  Copyright © 2019 SoftTechnology. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class myLocationOnMapViewController: UIViewController {

    //variables
    
    var previousLocation:CLLocation?
    
    //constants
    
    let locationManger = CLLocationManager()
    let regionInKiloMeters: Double = 0.5
    //outlets
    
    @IBOutlet weak var myMapView: MKMapView!
    
    @IBOutlet weak var locationLbl: UILabel!
    
    //actions
    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
  //////////view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()

    }
///// a function to set up the location manger
    func setupLocationManger()
    {
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    
    
///////// a function to center view on user location
    func centerViewOnUserLocation()
    {
        if let location = locationManger.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, span: MKCoordinateSpan(latitudeDelta: regionInKiloMeters, longitudeDelta: regionInKiloMeters))
            myMapView.setRegion(region, animated: true)
        }
    }
    
    
 /// aunction to check for the services GPs on or off and deal with the result
    func checkLocationServices() {
        
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManger()
            checkLocationAuthorization()
        }
        else
        {
            // show alert to the user
        }
    }
    
    
//// a function to check the multible levels of authorization given by the user
    
    func checkLocationAuthorization()
    {
        switch CLLocationManager.authorizationStatus()
        {
        case .authorizedWhenInUse:
            startTrackingUserLocation()
        case .denied:
            break
        case .notDetermined:
            locationManger.requestWhenInUseAuthorization()
        case .restricted:
            // show an alert let them know what's up
            break
        case .authorizedAlways:
            break
        }
    }
////////// a function to start tracking user location
    
    func startTrackingUserLocation()
    {
        myMapView.showsUserLocation = true
        centerViewOnUserLocation()
        locationManger.startUpdatingLocation()
        previousLocation = getCenterLocation(for: myMapView)
    }
    
    
//////////// function to get the center location
    func getCenterLocation(for mapView: MKMapView)->CLLocation
       {
          let latitude = myMapView.centerCoordinate.latitude
          let longitude = myMapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
        
        
             }
    
    
    
    
    
}
extension myLocationOnMapViewController: CLLocationManagerDelegate {
    
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard  let location = locations.last else { return }
//        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//        let region = MKCoordinateRegion.init(center: center, span: MKCoordinateSpan(latitudeDelta: regionInKiloMeters, longitudeDelta: regionInKiloMeters))
//        myMapView.setRegion(region, animated: true)
//    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
   
}
extension myLocationOnMapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(for: mapView)
        let geocoder = CLGeocoder()
        
        guard let previousLocation = self.previousLocation else {return}
        
        guard center.distance(from: previousLocation) > 50 else {return}
         self.previousLocation = center

        geocoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
         //   guard let self = self else { return }
            if let _ = error {
                return
            }
            guard let plcemark = placemarks?.first else {
                return
            }
            /// you can creat your own adress Notice
            let streetNumber = plcemark.subThoroughfare
            let streetName = plcemark.thoroughfare
            DispatchQueue.main.async {
                self?.locationLbl.text = "\(streetNumber ?? "") \(streetName ?? "")"
            }
        }
    }
}
