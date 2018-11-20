//
//  MenuViewController.swift
//  Bilcycles2
//
//  Created by Yusuf Furkan Eyupoglu on 15.11.2018.
//  Copyright © 2018 Yusuf Furkan Eyupoglu. All rights reserved.
//

import UIKit
import Firebase

class MenuViewController: UIViewController {
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBOutlet weak var signupButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let user = Auth.auth().currentUser {
            self.performSegue(withIdentifier: "toHomeScreen", sender: self)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        get {
            return .lightContent
        }
    }



}
