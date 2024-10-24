//
//  BasicVC.swift
//  CardiacticApp
//
//  Created by SAIL on 08/08/24.
//

import UIKit

class BasicVC: UIViewController {

 

    override func viewDidLoad() {
        super.viewDidLoad()
    }
  

     
}

// MARK: - Extension: BasicVC

extension BasicVC {
    func showAlert(title: String, message: String, okActionHandler: (() -> Void)? = nil, cancelActionHandler: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            okActionHandler?()
        })
        if let cancelHandler = cancelActionHandler {
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
                cancelHandler()
            })
        }
        present(alertController, animated: true)
    }
}



extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}

// MARK: - Extension: UIView

@IBDesignable
extension UIView {
    @IBInspectable var cornerRadiusView: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else { return nil }
            return UIColor(cgColor: cgColor)
        }
        set { layer.borderColor = newValue?.cgColor }
    }

    @IBInspectable var shadowRadius: CGFloat {
        get { return layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }

    @IBInspectable var shadowOpacity: Float {
        get { return layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }

    @IBInspectable var shadowOffset: CGSize {
        get { return layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }

    @IBInspectable var shadowColor: UIColor? {
        get {
            guard let cgColor = layer.shadowColor else { return nil }
            return UIColor(cgColor: cgColor)
        }
        set { layer.shadowColor = newValue?.cgColor }
    }
}

// MARK: - ShadowView

@IBDesignable
class ShadowView: UIView {
    @IBInspectable var shadowsColor: UIColor? {
        didSet { updateView() }
    }
    
    @IBInspectable var shadowsOpacity: Float = 0.7 {
        didSet { updateView() }
    }
    
    @IBInspectable var shadowsOffset: CGSize = CGSize(width: 1, height: 1) {
        didSet { updateView() }
    }
    
    @IBInspectable var shadowsRadius: CGFloat = 2.0 {
        didSet { updateView() }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        shadowsColor = .gray
        updateView()
    }
    
    private func updateView() {
        layer.shadowColor = shadowsColor?.cgColor
        layer.shadowOpacity = shadowsOpacity
        layer.shadowOffset = shadowsOffset
        layer.shadowRadius = shadowsRadius
    }
}
