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
    
    let colors: [UIColor] = [.red, .green, .orange]
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

}
extension PatientListVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = patientsListTable.dequeueReusableCell(withIdentifier: "PatientListTableViewCell", for: indexPath) as! PatientListTableViewCell
        
        cell.idLabel.text = "\(indexPath.row + 1)"
        cell.nameLabel.text = "Elamaran G"
        cell.conditionLabel.backgroundColor = colors.randomElement()
        if cell.conditionLabel.backgroundColor == .orange {
            cell.conditionLabel.text = "use Caution"
        }else if cell.conditionLabel.backgroundColor == .red {
            cell.conditionLabel.text = "Warning"
        }else if cell.conditionLabel.backgroundColor == .green {
            cell.conditionLabel.text = "Excellent"
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

extension PatientListVC: UISearchBarDelegate {


}
