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
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var titleName = ""
    var addPatientVM = AddPatientViewModel()
    var addPatientData : AddPatientModel?
    var profileData : ProfileDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initalLoads()

    }
    func initalLoads(){
        self.titleLabel.text = titleName
        if self.titleLabel.text ==  "My Details"{
            
            if let data = self.profileData{
                self.nameTextField.text = data.data.name
                self.ageTextField.text = String(data.data.age)
                self.genderTextField.text = data.data.gender
                self.phoneTextField.text = data.data.phoneNumber
                self.addressTextField.text = data.data.address
            }
            self.addressLabel.text = "Profession"
            self.addressTextField.placeholder = "Enter your Profession"
            self.nameTextField.isUserInteractionEnabled = false
            self.ageTextField.isUserInteractionEnabled = false
            self.genderTextField.isUserInteractionEnabled = false
            self.phoneTextField.isUserInteractionEnabled = false
            self.addressTextField.isUserInteractionEnabled = false
            createButton.isHidden = true
            
        } else if self.titleLabel.text ==  "Add Patient"{
//            self.nameTextField.isUserInteractionEnabled = true
//            self.ageTextField.isUserInteractionEnabled = true
//            self.genderTextField.isUserInteractionEnabled = true
//            self.phoneTextField.isUserInteractionEnabled = true
//            self.addressTextField.isUserInteractionEnabled = true
            createButton.isHidden = false
        }
    }
    
    @IBAction func backbutton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
   
    @IBAction func createTapButton(_ sender: Any) {
        self.apiCall()
        
    }
    
}

extension DAddPatientVC{
   
    func apiCall(){
        let param : [String: Any] = ["name": self.nameTextField.text!,
                     "age": self.ageTextField.text!,
                     "gender": self.genderTextField.text!,
                     "phone_number_1": self.phoneTextField.text!,
                     "profession": self.addressTextField.text!,
                     ]
        addPatientVM.addPatientApiCall(params: param) { response in
            if let responseData = response {
                if responseData.status {
                    self.addPatientData = responseData
                }else{
                    ToastManager.shared.showToast(message: response?.message ?? "", in: self.view)
                }
            }
        }
    }
}
