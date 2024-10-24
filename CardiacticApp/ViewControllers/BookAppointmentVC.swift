//
//  BookAppointmentVC.swift
//  CardiacticApp
//
//  Created by SAIL on 19/08/24.
//

import UIKit

class BookAppointmentVC: UIViewController {

    @IBOutlet weak var startTimeButton: UIButton!
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startTimeButton.tag = 1
        dateButton.tag = 0
    }

    @IBAction func timeButtonTapped(_ sender: UIButton) {
        showTimePicker()
    }

    @IBAction func dateButtonTapped(_ sender: UIButton) {
        showDatePicker()
    }

    func showTimePicker() {
        let timePickerVC = TimePickerViewController()
        timePickerVC.modalPresentationStyle = .popover
        timePickerVC.popoverPresentationController?.sourceView = startTimeButton
        timePickerVC.popoverPresentationController?.sourceRect = startTimeButton.bounds

        timePickerVC.doneAction = { [weak self] selectedDate in
            let formatter = DateFormatter()
            formatter.dateFormat = "h:mm a"  // 12-hour format with AM/PM
            self?.timeLabel.text = formatter.string(from: selectedDate)
        }


//        timePickerVC.cancelAction = { [weak self] in
//            // Handle cancellation if needed
//        }

        present(timePickerVC, animated: true, completion: nil)
    }

    func showDatePicker() {
        let datePickerVC = DatePickerViewController()
        datePickerVC.modalPresentationStyle = .popover
        datePickerVC.popoverPresentationController?.sourceView = dateButton
        datePickerVC.popoverPresentationController?.sourceRect = dateButton.bounds

        datePickerVC.doneAction = { [weak self] selectedDate in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            self?.dateLabel.text = formatter.string(from: selectedDate)
        }

//        datePickerVC.cancelAction = { [weak self] in
//            // Handle cancellation if needed
//        }

        present(datePickerVC, animated: true, completion: nil)
    }
}
