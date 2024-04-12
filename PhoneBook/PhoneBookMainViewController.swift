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
    }

    @IBAction func textButtonTapped(_ sender: Any) {
        
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let geocoderLocation = CLGeocoder()
    }
    
    func openMessagesApp() {
        guard let url = URL(string: "sms::15103301270") else {
            showAlert(message: "Failed to open Messages app")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func openWhatsApp(phoneNumber: String) {
        guard let url = URL(string: "whatsapp://send?phone=15103301270") else {
            showAlert(message: "Failed to open WhatsApp")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
    


