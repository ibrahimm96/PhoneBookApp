//
//  ViewController.swift
//  PhoneBook
//
//  Created by Ibrahim Mansoor on 4/11/24.
//

import UIKit
import CoreLocation

class PhoneBookMainViewController: UIViewController, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    @IBOutlet var openTextMessageButton: UIButton!
    var defaultPhoneNumber = "15103301270"

    @IBAction func textButtonTapped(_ sender: Any) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let geocoderLocation = CLGeocoder()
        }
}
    


