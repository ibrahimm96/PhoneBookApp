//
//  ViewController.swift
//  PhoneBook
//
//  Created by Ibrahim Mansoor on 4/11/24.
//

import UIKit

class PhoneBookMainViewController: UIViewController {
    @IBOutlet var openTextMessageButton: UIButton!
    
    var recipient = "sms:19172883884"
    @IBAction func textButtonTapped(_ sender: Any) {
        UIApplication.shared.open(URL(string: recipient)!, options: [:], completionHandler: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

