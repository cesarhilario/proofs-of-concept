//
//  ViewController.swift
//  swfit-geolocation
//
//  Created by César William Hilário on 09/06/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    @IBOutlet weak var latitudeField: UITextField!;
    @IBOutlet weak var longitudeField: UITextField!;
    @IBOutlet weak var accurancyField: UITextField!;
    
    @IBAction func getLocation(_ sender: Any) {
        locationManager.requestLocation();
    }
}

extension ViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//            print("Location data received.");
//            print("location \(location)");
//            print("locations \(locations)");
//        }
        
        if let location = locations.last{
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            let accurancy = location.courseAccuracy
            
            latitudeField.text = String(latitude);
            longitudeField.text = String(longitude);
            accurancyField.text = String(accurancy);
            
        }
        
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get users location.")
    }
}
