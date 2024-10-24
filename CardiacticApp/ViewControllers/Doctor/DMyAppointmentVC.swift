//
//  DMyAppointmentVC.swift
//  CardiacticApp
//
//  Created by SAIL on 23/10/24.
//

import UIKit

class DMyAppointmentVC: UIViewController {

    @IBOutlet weak var appointmentsListTableView: UITableView!{
        didSet{
            appointmentsListTableView.delegate = self
            appointmentsListTableView.dataSource = self
            appointmentsListTableView.register(UINib.init(nibName: "AppointmentListTableViewCell", bundle: nil), forCellReuseIdentifier: "AppointmentListTableViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    


}

extension DMyAppointmentVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = appointmentsListTableView.dequeueReusableCell(withIdentifier: "AppointmentListTableViewCell", for: indexPath) as! AppointmentListTableViewCell
        
        cell.nameLabel.text = " Elamaran \(indexPath.row + 1)"
        
       
        
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
