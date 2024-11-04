//
//  LoaderHelper.swift
//  CardiacticApp
//
//  Created by SAIL on 09/09/24.
//

import UIKit
import NVActivityIndicatorView

public class LoadingOverlayer{
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let Loaderview = LoadingOverlayer.shared
    var overlayerView = UIView()
    var activityIndicator : NVActivityIndicatorView!

class var shared: LoadingOverlayer {
    
    struct Static {
        static let instance: LoadingOverlayer = LoadingOverlayer()
    }
    return Static.instance
}

    public func showOverlay(view: UIView) {
        
        overlayerView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        overlayerView.center = view.center
//        overlayerView.backgroundColor = UIColor(white: 666666, alpha: 0.7)
//        overlayerView.alpha = 0.9
        overlayerView.backgroundColor = UIColor.black
        overlayerView.alpha = 0.5
        //UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 0.7)
        //UIColor(white: 0xffffff, alpha: 0.7)
        //0x444444
        overlayerView.clipsToBounds = true
        overlayerView.layer.cornerRadius = 10
        
        let xAxis = self.overlayerView.center.x
        let yAxis = self.overlayerView.center.y
        let frame = CGRect(x: (xAxis - 25), y: (yAxis - 25), width: 45, height: 45)
        activityIndicator = NVActivityIndicatorView(frame: frame)
        activityIndicator.type = .circleStrokeSpin
       // activityIndicator.color = UIColor(displayP3Red: 16/255, green: 28/255, blue: 140/255, alpha: 1)
        
//        activityIndicator.color = Constants.CorporateRedColor
        //61,188,201
        
        overlayerView.addSubview(activityIndicator)
        view.addSubview(overlayerView)
        
        //view.backgroundColor
        
        activityIndicator.startAnimating()
    }

    public func hideoverlayerView() {
        if (activityIndicator != nil){
            activityIndicator.stopAnimating()
            overlayerView.removeFromSuperview()
        }
        
    }
}
