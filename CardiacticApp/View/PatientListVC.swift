//
//  PatientListVC.swift
//  CardiacticApp
//
//  Created by SAIL on 19/08/24.
//

import UIKit

class PatientListVC: UIViewController {

    @IBOutlet weak var searchBarOutlet: UISearchBar! {
        didSet {
            searchBarOutlet.delegate = self
        }
    }

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
        apiCall()
       
    }
    @IBAction func backbutton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
extension PatientListVC{
   
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
extension PatientListVC: UITableViewDelegate, UITableViewDataSource {

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

extension PatientListVC: UISearchBarDelegate {


}
