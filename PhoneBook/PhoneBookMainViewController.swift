//
//  ViewController.swift
//  PhoneBook
//
//  Created by Ibrahim Mansoor on 4/11/24.
//

import UIKit

class PhoneBookMainViewController: UIViewController{
    
    @IBOutlet var openTextMessageButton: UIButton!
    @IBOutlet var phoneNumberInput: UITextField!
    
    var recipient = "sms:19172883884"
    
    @IBAction func textButtonTapped(_ sender: Any) {
        guard let phoneNumber = phoneNumberInput.text?.trimmingCharacters(in: .whitespacesAndNewlines), !phoneNumber.isEmpty else {
            showAlert(message: "Phone number cannot be empty")
            return
        }
        
        let numericPhoneNumber = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        guard numericPhoneNumber.count == 10 else {
            showAlert(message: "Invalid Number")
            return
        }
        
        let recipient = "sms:" + numericPhoneNumber
        
        guard let url = URL(string: recipient) else {
            showAlert(message: "Invalid URL")
            return
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        view.endEditing(true)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Invalid Number!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        phoneNumberInput.keyboardType = .numberPad
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
}

