//
//  GetStartedVC.swift
//  CardiacticApp
//
//  Created by SAIL on 05/09/24.
//

import UIKit

class GetStartedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func TapLoginBtn(_ sender: Any) {

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
          
    }
}
