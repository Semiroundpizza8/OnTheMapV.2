//
//  LoginViewController.swift
//  OnTheMapV.2
//
//  Created by Benjamin Odisho on 9/3/17.
//  Copyright © 2017 Benjamin Odisho. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func loginPressed(_ sender: AnyObject) {
        
        UdacityClient.sharedInstance().obtainSessionID(username: username.text!, password: password.text!) { success in
            
        }
    }
}
