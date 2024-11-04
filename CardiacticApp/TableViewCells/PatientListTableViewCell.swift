//
//  PatientListTableViewCell.swift
//  CardiacticApp
//
//  Created by SAIL on 19/08/24.
//

import UIKit

class PatientListTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var stageLabel: UILabel!
    @IBOutlet weak var patientImage: UIImageView!
    @IBOutlet weak var conditionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
