//
//  DProfileVC.swift
//  CardiacticApp
//
//  Created by SAIL on 25/10/24.
//

import UIKit
import Kingfisher

class DProfileVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var fieldLabel: UILabel!
    
    var profileData : ProfileDataModel?
    var profileVM = ProfileViewModel()
    var idData = UserDefaultsManager.shared.getUserId() ?? ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        apiCall()
    }
    func intialLoads(){
        nameLabel.text = "Dr. \(profileData?.data.name ?? "")"
        idLabel.text = "ID : \(profileData?.data.doctorID ?? "")"
//        fieldLabel.text = profileData?.data.doctorID
        if profileData?.data.profileDoc != "" && profileData?.data.profileDoc != nil{
            if let url = URL(string: APIList.baseURL + (profileData?.data.profileDoc ?? "")){
                profileImage.kf.setImage(with: url)
            }
        }
       
    }
    
    
    @IBAction func personalDetailsButton(_ sender: Any) {
        
    }
    @IBAction func changePasswordButton(_ sender: Any) {
        
    }
    @IBAction func logoutButton(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
   

}
extension DProfileVC{
   
    func apiCall(){
        let param = ["doctor_id": idData]
        profileVM.profileApiCall(userInfo: param) { response   in
            if let responseData = response {
                if responseData.status {
                    self.profileData = responseData
                    self.intialLoads()
                }else {
                    ToastManager.shared.showToast(message: response?.message ?? "", in: self.view)
                }
            }
        }
    }
}
