//
//  LoginVC.swift
//  CardiacticApp
//
//  Created by SAIL on 05/09/24.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let loginVM = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }

    @IBAction func signInButton(_ sender: Any) {
       
        if (userNameTextField.text?.isEmpty == true)  && (passwordTextField.text?.isEmpty == true)  {
            print("Enter the username and password")
        }else {
            let param = ["doctor_id":userNameTextField.text!,
                         "password":passwordTextField.text!]
            loginVM.loginApiCall(userInfo: param) { response in
                if let status = response?.status {
                    if status {
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DHomeTabBarController") as! DHomeTabBarController
                        UserDefaultsManager.shared.setUserId(self.userNameTextField.text ?? "")
                        self.navigationController?.pushViewController(vc, animated: true)
                    } else {
                        ToastManager.shared.showToast(message: response?.message ?? "Operation failed", in: self.view)
                    }
                }else {
                    ToastManager.shared.showToast(message: "No response received", in: self.view)
                }
            }
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "DAddPatientVC") as? DAddPatientVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func forgetPassButton(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "DAddPatientVC") as? DAddPatientVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
