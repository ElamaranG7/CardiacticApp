//
//  ToastManager.swift
//  CardiacticApp
//
//  Created by SAIL on 23/10/24.
//

import UIKit
// MARK: - Toast Message

class ToastManager {
    static let shared = ToastManager()
    
    static let DELAY_SHORT: TimeInterval = 1.5
    static let DELAY_LONG: TimeInterval = 3.0
    private init() {}
    
    func showToast(message: String, in view: UIView, delay: TimeInterval = DELAY_SHORT) {
        let toastLabel = createToastLabel(with: message)
        view.addSubview(toastLabel)

        NSLayoutConstraint.activate([
            toastLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toastLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 15),
            toastLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -15),
            toastLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])

        animateToast(toastLabel, delay: delay)
    }

    private func createToastLabel(with message: String) -> UILabel {
        let label = UILabel()
        label.backgroundColor = UIColor(white: 0, alpha: 0.7)
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = message
        label.alpha = 0
        label.numberOfLines = 0
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    private func animateToast(_ label: UILabel, delay: TimeInterval) {
        UIView.animate(withDuration: 0.3, animations: {
            label.alpha = 1.0
        }) { _ in
            UIView.animate(withDuration: 0.3, delay: delay, options: .curveEaseOut, animations: {
                label.alpha = 0.0
            }) { _ in
                label.removeFromSuperview()
            }
        }
    }
}

