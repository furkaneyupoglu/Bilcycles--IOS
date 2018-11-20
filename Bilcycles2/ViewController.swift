//
//  ViewController.swift
//  Bilcycles2
//
//  Created by Yusuf Furkan Eyupoglu on 7.11.2018.
//  Copyright © 2018 Yusuf Furkan Eyupoglu. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ViewController: UIViewController {
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    var seniorbisikletData = [String]()
    
    @IBOutlet weak var studentIdText: UITextField!
    
    
    @IBOutlet weak var nameText: UITextField!
    
    
    @IBOutlet weak var DenemeLabel: UILabel!
    
    
    @IBOutlet weak var surname: UITextField!
    
    
    
    @IBOutlet weak var phoneText: UITextField!
    
    
    
    @IBOutlet weak var passwordText: UITextField!
    
    //let ref = Database.database().reference()
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        //let ref = Database.database().reference()
        
        //ref.child("user/name").setValue("asdadcad")
        
        
        //Set the firebase
        
        
        //retrieve the posts and listen for changes in firebase
        //databaseHandle = ref?.child("seniorbisiklet").observe(.childAdded, with: { (snapshot) in
            //code to execute when a child is added under "seniorbisiklet"
            //Take the value from the snapshot and added it to the seniorbisikletData array
          //  let seniorbisiklet = snapshot.value as? String
        
            
            //if let actualseniorbisiklet = seniorbisiklet {  self.seniorbisikletData.append(actualseniorbisiklet)
                
                
                
                
            //}
        //})
        
       /* let postInfo = ["Name": nameText.text!, "surname": surname.text!, "phone": phoneText.text!,"student id":studentIdText.text!,"password":passwordText.text!]
        let reference  = Database.database().reference().child("user").childByAutoId()
        reference.setValue(postInfo)
        let chidAutoId=reference.key
        print(chidAutoId)
 */
        let ref = Database.database().reference()
        

    
    }
    
    

    @IBAction func createUserButton(_ sender: UIButton) {
        
        let ref = Database.database().reference()
        //ref.childByAutoId().setValue(["StdID":studentIdText.text!,"Name":nameText.text!,"Surname":surname.text!,"Phone":phoneText.text!,"Password":passwordText.text!])
        guard let studentId = studentIdText.text else {return}
        guard let password = passwordText.text else {return}
        //guard let  = studentIdText.text else {return}
        
        //ref.child("user").childByAutoId().setValue(["stdID":studentIdText.text!,"name":nameText.text!,"surname":surname.text!,"phone":phoneText.text!,"password":passwordText.text!])
        
        Auth.auth().createUser(withEmail: studentId, password: password){ user, error in
            if error == nil && user == nil {
                print("user created")
            }else{
                print("Error creating user: \(error!.localizedDescription)")
            }
        }
        
        
        
        
    }
    
    @objc func handleSignUp() {
        
        
        let ref = Database.database().reference()
        //ref.childByAutoId().setValue(["StdID":studentIdText.text!,"Name":nameText.text!,"Surname":surname.text!,"Phone":phoneText.text!,"Password":passwordText.text!])
        
        guard let studentId = studentIdText.text else {return}
        guard let password = passwordText.text else {return}
        guard let username = phoneText.text else {return}

        //guard let  = studentIdText.text else {return}
        
        //ref.child("user").childByAutoId().setValue(["stdID":studentIdText.text!,"name":nameText.text!,"surname":surname.text!,"phone":phoneText.text!,"password":passwordText.text!])
        
        Auth.auth().createUser(withEmail: studentId, password: password){ user, error in
            if error == nil && user == nil {
                print("user created")
                print("burda")
            }else{
                print("Error creating user: \(error!.localizedDescription)")
                print("else de")
            }
        }
        
        
    } //func bitişi
    
}
