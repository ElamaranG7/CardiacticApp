//
//  DHomePageVC.swift
//  CardiacticApp
//
//  Created by SAIL on 23/10/24.
//

import UIKit
import Kingfisher

class DHomePageVC: UIViewController {

    @IBOutlet weak var patientsListTable: UITableView!{
        didSet{
            patientsListTable.delegate = self
            patientsListTable.dataSource = self
            patientsListTable.register(UINib.init(nibName: "PatientListTableViewCell", bundle: nil), forCellReuseIdentifier: "PatientListTableViewCell")
        }
    }
    let patientListVM = PatientlistViewModel()
    var patientListData : [PatientListData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    override func viewWillAppear(_ animated: Bool) {
        apiCall()
    }
    @IBAction func addPatientButton(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "DAddPatientVC") as? DAddPatientVC else { return }
        vc.titleName = "Add Patient"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func showAllButton(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "PatientListVC") as? PatientListVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
extension DHomePageVC{
   
    func apiCall(){
        
        patientListVM.patientListApiCall() { response,status,message   in
            if status {
                self.patientListData = response ?? []
                self.patientsListTable.reloadData()
            }else {
                ToastManager.shared.showToast(message: message, in: self.view)
            }
        }
        
    }
}
extension DHomePageVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return patientListData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = patientsListTable.dequeueReusableCell(withIdentifier: "PatientListTableViewCell", for: indexPath) as! PatientListTableViewCell
        
        let datas = patientListData[indexPath.row]
        cell.idLabel.text = datas.patientID
        cell.nameLabel.text = datas.name
        if let imageString = datas.profilePic{
            let url = URL(string: APIList.baseURL + (imageString))
            cell.patientImage.kf.setImage(with: url)
        }
        cell.conditionLabel.isHidden = false
        cell.conditionLabel.text = datas.conditionStatus
        cell.stageLabel.text = datas.stage
        if datas.conditionStatus == "caution"{
            cell.conditionLabel.backgroundColor = .orange
        }else if datas.conditionStatus == "warning"{
            cell.conditionLabel.backgroundColor = .red
        }else if datas.conditionStatus == "excellent"{
            cell.conditionLabel.backgroundColor = .green
        }else{
            cell.conditionLabel.isHidden = true
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
