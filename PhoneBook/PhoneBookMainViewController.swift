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
        if let phoneNumber = phoneNumberInput.text, !phoneNumber.isEmpty {
            let recipient = "sms:" + phoneNumber
            if let url = URL(string: recipient) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            endEditing()
        } else {
            print("Invalid Number")
        }
    }
    
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        phoneNumberInput.keyboardType = .numberPad
    }


}

