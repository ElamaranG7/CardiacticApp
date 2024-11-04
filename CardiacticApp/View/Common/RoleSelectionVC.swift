//
//  RoleSelectionVC.swift
//  CardiacticApp
//
//  Created by SAIL on 04/11/24.
//

import UIKit

class RoleSelectionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func doctorTapButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        UserDefaultsManager.shared.setLoginType("Doctor")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func patientTapButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        UserDefaultsManager.shared.setLoginType("Patient")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
  
}
