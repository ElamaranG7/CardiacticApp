//
//  DAddPatientVC.swift
//  CardiacticApp
//
//  Created by SAIL on 25/10/24.
//

import UIKit

class DAddPatientVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    var titleName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalLoads()
    }
    func initalLoads(){
        if self.titleLabel.text ==  "My Details"{
            self.nameTextField.isUserInteractionEnabled = false
            self.ageTextField.isUserInteractionEnabled = false
            self.genderTextField.isUserInteractionEnabled = false
            self.phoneTextField.isUserInteractionEnabled = false
            self.addressTextField.isUserInteractionEnabled = false
        } else if self.titleLabel.text ==  "Add Patient"{
            self.nameTextField.isUserInteractionEnabled = true
            self.ageTextField.isUserInteractionEnabled = true
            self.genderTextField.isUserInteractionEnabled = true
            self.phoneTextField.isUserInteractionEnabled = true
            self.addressTextField.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func backbutton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
   
    @IBAction func createTapButton(_ sender: Any) {
        
    }
    
}
