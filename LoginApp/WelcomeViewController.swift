//
//  ItemViewController.swift
//  LoginApp
//
//  Created by Алиага С on 19.6.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomLabel: UILabel!
    
    var userName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomLabel.text = "Welcome, \(userName)!"
    }
}
