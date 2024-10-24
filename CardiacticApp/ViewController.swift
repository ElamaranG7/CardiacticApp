//
//  ViewController.swift
//  CardiacticApp
//
//  Created by SAIL on 05/08/24.
//

//import UIKit
//
//class ViewController: BasicVC {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//
//}
import UIKit

class DatePickerViewController: UIViewController {
    
    var datePicker: UIDatePicker!
    var doneAction: ((Date) -> Void)?
    var cancelAction: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Setup UIDatePicker
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(datePicker)
        
        // Setup Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))
        
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        view.addSubview(toolbar)
        
        // Layout
        NSLayoutConstraint.activate([
            toolbar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            toolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            datePicker.topAnchor.constraint(equalTo: toolbar.bottomAnchor),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            datePicker.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func doneTapped() {
        doneAction?(datePicker.date)
        dismiss(animated: true, completion: nil)
        
    }
    @objc private func cancelTapped() {
        cancelAction?()
        dismiss(animated: true, completion: nil)
    }
}

class TimePickerViewController: UIViewController {

    var timePicker: UIDatePicker!
    var doneAction: ((Date) -> Void)?
    var cancelAction: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        // Setup UIDatePicker
        timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(timePicker)

        // Setup Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.translatesAutoresizingMaskIntoConstraints = false

        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))

        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        view.addSubview(toolbar)

        // Layout
        NSLayoutConstraint.activate([
            toolbar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            toolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            timePicker.topAnchor.constraint(equalTo: toolbar.bottomAnchor),
            timePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            timePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            timePicker.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    @objc private func doneTapped() {
        doneAction?(timePicker.date)
        dismiss(animated: true, completion: nil)
    }

    @objc private func cancelTapped() {
        cancelAction?()
        dismiss(animated: true, completion: nil)
    }
}
