//
//  MainMenuViewController.swift
//  Bilcycles2
//
//  Created by Yusuf Furkan Eyupoglu on 18.11.2018.
//  Copyright © 2018 Yusuf Furkan Eyupoglu. All rights reserved.
//

import UIKit
import Firebase

class MainMenuViewController: UIViewController {
    
    
    
    @IBOutlet weak var loginButton: UIButton!
    

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
        
       // if let user = Auth.auth().currentUser {
         //   self.performSegue(withIdentifier: "toHomeScreen", sender: self)
        //}
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        get {
            return .lightContent
        }
    }
    
    
    @IBAction func handleLogout(_ sender:Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
    }
    
    
}
