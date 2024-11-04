//
//  MedicationVC.swift
//  CardiacticApp
//
//  Created by SAIL on 26/08/24.
//

import UIKit

class MedicationVC: UIViewController {

    @IBOutlet weak var medicationListTable: UITableView!{
        didSet{
            medicationListTable.delegate = self
            medicationListTable.dataSource = self
            medicationListTable.register(UINib.init(nibName: "MedicineListTableViewCell", bundle: nil), forCellReuseIdentifier: "MedicineListTableViewCell")
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
extension MedicationVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = medicationListTable.dequeueReusableCell(withIdentifier: "MedicineListTableViewCell", for: indexPath) as! MedicineListTableViewCell
        
        cell.nameLabel.text = " Medicine\(indexPath.row + 1)"
        cell.daysLeftLabel.text = "\(indexPath.row + 5) Days left"
       
        
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
