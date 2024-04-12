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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        findCountry { country in
            if let country = country {
                print("User is in \(country)")
            } else {
                print("Unable to determine user's country")
            }
        }
    }
    


    @IBAction func textButtonTapped(_ sender: Any) {
        
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func findCountry(completion: @escaping (String?) -> Void) {
        guard let location = locationManager.location else {
            print("Location not available")
            completion(nil)
            return
        }
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard let placemark = placemarks?.first, error == nil else {
                print("Reverse geocoding failed with error: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            if let country = placemark.country {
                completion(country)
            } else {
                print("Unable to determine user's country")
                completion(nil)
            }
        }
    }
    
    func openMessagesApp() {
        guard let url = URL(string: "sms::15103301270") else {
            showAlert(message: "Failed to open Messages app")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func openWhatsApp() {
        guard let url = URL(string: "whatsapp://send?phone=15103301270") else {
            showAlert(message: "Failed to open WhatsApp")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
    


