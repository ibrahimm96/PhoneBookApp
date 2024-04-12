//
//  ViewController.swift
//  PhoneBook
//
//  Created by Ibrahim Mansoor on 4/11/24.
//

import UIKit
import CoreLocation

class PhoneBookMainViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var openTextMessageButton: UIButton!
    
    var locationManager: CLLocationManager?
    let desiredCounty = "United States"
    let smsURL = "sms::15103301270"
    let whatsAppURL = "whatsapp://send?phone=15103301270"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
    }

    @IBAction func textButtonTapped(_ sender: Any) {
        findCountry { country in
            // For debugging purposes:
            if let country = country {
                print("User is in \(country)")
            } else {
                print("Unable to determine user's country")
            }
            
            // Actual Code for deciding sms vs whatsApp
            if country == self.desiredCounty {
                self.openMessagesApp()
            } else {
                self.openWhatsApp()
            }
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func openMessagesApp() {
        guard let url = URL(string: smsURL) else {
            showAlert(message: "Failed to open Messages app")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func openWhatsApp() {
        guard let url = URL(string: whatsAppURL) else {
            showAlert(message: "Failed to open WhatsApp")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

extension PhoneBookMainViewController{
    // For debugging purposes:
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            print("When user did not yet determined")
        case .restricted:
            print("Restricted by parental control")
        case .denied:
            print("When user select option Dont't Allow")
        case .authorizedWhenInUse:
            print("When user select option Allow While Using App or Allow Once")
        default:
            print("default")
        }
    }
    
    // Core function for getting user location
    func findCountry(completion: @escaping (String?) -> Void) {
        guard let location = locationManager?.location else {
            print("Location not available")
            completion(nil)
            return
        }
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print("Reverse geocoding failed with error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let placemark = placemarks?.first else {
                print("No placemark found")
                completion(nil)
                return
            }
            
            print("Placemark: \(placemark)")
            
            if let country = placemark.country {
                print("Country: \(country)")
                completion(country)
            } else {
                print("Unable to determine user's country")
                completion(nil)
            }
        }
    }

}

    


