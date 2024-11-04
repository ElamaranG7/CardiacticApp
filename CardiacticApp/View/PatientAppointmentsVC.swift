//
//  PatientAppointmentsVC.swift
//  CardiacticApp
//
//  Created by SAIL on 11/09/24.
//

import UIKit

class PatientAppointmentsVC: UIViewController {
    
    @IBOutlet weak var appointmentsListTableView: UITableView!{
        didSet{
            appointmentsListTableView.delegate = self
            appointmentsListTableView.dataSource = self
            appointmentsListTableView.register(UINib.init(nibName: "AppointmentListTableViewCell", bundle: nil), forCellReuseIdentifier: "AppointmentListTableViewCell")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension PatientAppointmentsVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = appointmentsListTableView.dequeueReusableCell(withIdentifier: "AppointmentListTableViewCell", for: indexPath) as! AppointmentListTableViewCell
        
        cell.nameLabel.text = "Elamaran \(indexPath.row + 1)"
        
       
        
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyBoard.instantiateViewController(withIdentifier: "ViewCandidateVc") as! ViewCandidateVc
//
//        self.navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
