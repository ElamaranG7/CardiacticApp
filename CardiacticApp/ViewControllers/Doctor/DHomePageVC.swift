//
//  DHomePageVC.swift
//  CardiacticApp
//
//  Created by SAIL on 23/10/24.
//

import UIKit

class DHomePageVC: UIViewController {

    @IBOutlet weak var patientsListTable: UITableView!{
        didSet{
            patientsListTable.delegate = self
            patientsListTable.dataSource = self
            patientsListTable.register(UINib.init(nibName: "PatientListTableViewCell", bundle: nil), forCellReuseIdentifier: "PatientListTableViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    

}
extension DHomePageVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = patientsListTable.dequeueReusableCell(withIdentifier: "PatientListTableViewCell", for: indexPath) as! PatientListTableViewCell
        
        cell.idLabel.text = "\(indexPath.row + 1)"
        cell.nameLabel.text = "Elamaran G"
        if cell.conditionLabel.backgroundColor == .orange {
            cell.conditionLabel.text = "use Caution"
        }else if cell.conditionLabel.backgroundColor == .red {
            cell.conditionLabel.text = "Warning"
        }else if cell.conditionLabel.backgroundColor == .green {
            cell.conditionLabel.text = "Excellent"
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
