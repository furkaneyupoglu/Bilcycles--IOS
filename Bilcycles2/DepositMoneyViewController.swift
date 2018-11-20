//
//  DepositMoneyViewController.swift
//  Bilcycles2
//
//  Created by Yusuf Furkan Eyupoglu on 19.11.2018.
//  Copyright © 2018 Yusuf Furkan Eyupoglu. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class DepositMoneyViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    
    @IBOutlet weak var emailField: UITextField!
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBOutlet weak var dismissButton: UIButton!
    
    
    @IBOutlet weak var denemebakiye: UILabel!
    
    var continueButton:RoundedWhiteButton!
    var activityView:UIActivityIndicatorView!
    var updatedMoney:Double = 0.0
    
    let ref = Database.database().reference()
    
    let userID = Auth.auth().currentUser!.uid
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        continueButton = RoundedWhiteButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        continueButton.setTitleColor(secondaryColor, for: .normal)
        continueButton.setTitle("Continue", for: .normal)
        continueButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.bold)
        continueButton.center = CGPoint(x: view.center.x, y: view.frame.height - continueButton.frame.height - 24)
        continueButton.highlightedColor = UIColor(white: 1.0, alpha: 1.0)
        continueButton.defaultColor = UIColor.white
        continueButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        
        view.addSubview(continueButton)
        setContinueButton(enabled: false)
        
        activityView = UIActivityIndicatorView(style: .gray)
        activityView.color = secondaryColor
        activityView.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        activityView.center = continueButton.center
        
        view.addSubview(activityView)
        
        usernameField.delegate = self as? UITextFieldDelegate
        emailField.delegate = self as? UITextFieldDelegate
        passwordField.delegate = self as? UITextFieldDelegate
        
        usernameField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        emailField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)

        
        // Do any additional setup after loading the view.
        
      /*  let userID1 = Auth.auth().currentUser?.uid
        print("---------------------")
        print(userID1!)
        ref.child("user").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            print("---------------------")
            //print(value as! [String: String])
            let money = value?["money"] as? String ?? "aaaa"
            
            print(money)
            //let money = User(money: money)
            
            //self.usernameField.text!=money
            
            self.denemebakiye.text! = money
           // let user = User(username: username)
            
            

            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        */
        //updatedMoney=
        getData()
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        usernameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        NotificationCenter.default.removeObserver(self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
    
    @IBAction func handleDismissButton(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
    }

    @objc func keyboardWillAppear(notification: NSNotification){
        
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        continueButton.center = CGPoint(x: view.center.x,
                                        y: view.frame.height - keyboardFrame.height - 16.0 - continueButton.frame.height / 2)
        activityView.center = continueButton.center
    }
    
    @objc func textFieldChanged(_ target:UITextField) {
        let username = usernameField.text
        let email = emailField.text
        let password = passwordField.text
        let formFilled = username != nil && username != "" && email != nil && email != "" && password != nil && password != ""
        setContinueButton(enabled: formFilled)
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Resigns the target textField and assigns the next textField in the form.
        
        switch textField {
        case usernameField:
            usernameField.resignFirstResponder()
            emailField.becomeFirstResponder()
            break
        case emailField:
            emailField.resignFirstResponder()
            passwordField.becomeFirstResponder()
            break
        case passwordField:
            handleSignUp()
            break
        default:
            break
        }
        return true
    }

    
    func setContinueButton(enabled:Bool) {
        if enabled {
            continueButton.alpha = 1.0
            continueButton.isEnabled = true
        } else {
            continueButton.alpha = 0.5
            continueButton.isEnabled = false
        }
    }
    
    @objc func handleSignUp() {
        guard let username = usernameField.text else { return }
        guard let email = emailField.text else { return }
        guard let pass = passwordField.text else { return }
        
        setContinueButton(enabled: false)
        continueButton.setTitle("", for: .normal)
        activityView.startAnimating()
        
        ref.child("user").child(userID).setValue(["nameoncard":username,"cardnumber":email,"money":pass,"uid":userID])
        
        
        
        getData()
        
        
        
        /*Auth.auth().createUser(withEmail: email, password: pass) { user, error in
        
        
            if error == nil && user != nil {
                print("User created!")
                
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = username
                
                changeRequest?.commitChanges { error in
                    if error == nil {
                        print("User display name changed!")
                        self.dismiss(animated: false, completion: nil)
                    } else {
                        print("Error: \(error!.localizedDescription)")
                    }
                }
                
            } else {
                print("Error: \(error!.localizedDescription)")
            }
        } */
    }
    
    func getData(){
        
        Database.database().reference().child("user").child(userID).observeSingleEvent(of: .value, with: {(snapshot) in
            
            let user=UserInfo()
            
            user.setValuesForKeys(snapshot.value as! [String:Any])
           /* if( user.setValuesForKeys(snapshot.value as! [String:Any]) == nil)
            {
                self.denemebakiye.text="0"
                
            }
            
            self.denemebakiye.text=user.money
            */
            
            self.denemebakiye.text=user.money
            let money=Double(self.denemebakiye.text!)
            
            
            
        })
        
    }
    
    
    
}
