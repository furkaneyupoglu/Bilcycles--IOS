//
//  RentBicycleViewController.swift
//  Bilcycles2
//
//  Created by Yusuf Furkan Eyupoglu on 18.11.2018.
//  Copyright © 2018 Yusuf Furkan Eyupoglu. All rights reserved.
//

import UIKit
import Firebase

class RentBicycleViewController: UIViewController {
    
    let dataSource=["East Campus","Middle Campus","Main Campus"]
    
    
    @IBOutlet weak var PickerViev: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        PickerViev.dataSource=self
        PickerViev.delegate=self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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


extension RentBicycleViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return dataSource.count
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //shape = dataSource[row]
        //return img.image=UIImage(named: dataSource[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
}
