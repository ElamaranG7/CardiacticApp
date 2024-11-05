//
//  DMyAppointmentVC.swift
//  CardiacticApp
//
//  Created by SAIL on 23/10/24.
//

import UIKit
import Kingfisher

class DMyAppointmentVC: UIViewController {

    @IBOutlet weak var appointmentsListTableView: UITableView!{
        didSet{
            appointmentsListTableView.delegate = self
            appointmentsListTableView.dataSource = self
            appointmentsListTableView.register(UINib.init(nibName: "AppointmentListTableViewCell", bundle: nil), forCellReuseIdentifier: "AppointmentListTableViewCell")
        }
    }
    
    var appointmentsListData: [AppointmentsListData]? = []
    var appointmentListVM = AppointmentsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        apiCall()
    }


}
extension DMyAppointmentVC{
   
    func apiCall(){
        
        appointmentListVM.appointmentsListApiCall { response,status,message   in
            if response != nil {
                if status {
                    self.appointmentsListData = response ?? []
                    ToastManager.shared.showToast(message: message, in: self.view)
                    self.appointmentsListTableView.reloadData()
                }else {
                    ToastManager.shared.showToast(message: message, in: self.view)
                }
            }
        }
    }
}

extension DMyAppointmentVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return appointmentsListData?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = appointmentsListTableView.dequeueReusableCell(withIdentifier: "AppointmentListTableViewCell", for: indexPath) as! AppointmentListTableViewCell
        if let datas = appointmentsListData?[indexPath.row]{
            cell.nameLabel.text = datas.name
            cell.phoneLabel.text = datas.phoneNumber
            cell.timeLabel.text = datas.time
            if let image = datas.profilePic, image != ""{
                let url = URL(string: APIList.baseURL + image)
                cell.patientImage.kf.setImage(with: url)
            }
        }
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyBoard.instantiateViewController(withIdentifier: "ViewCandidateVc") as! ViewCandidateVc
//
//        self.navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
