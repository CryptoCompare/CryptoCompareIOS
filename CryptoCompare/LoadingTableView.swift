//
//  LoadingTableView.swift
//  CryptoCompare
//
//  Created by YAGYANK CHADHA on 21/10/17.
//  Copyright © 2017 YAGYANK CHADHA. All rights reserved.
//

import UIKit

class LoadingTableView: UITableView {
    
    
    let loadingImage = UIImage(named: "loadingIndicator")
    var loadingImageView: UIImageView
    
    required init(coder aDecoder: NSCoder) {
        loadingImageView = UIImageView(image: loadingImage)
        super.init(coder: aDecoder)!
        addSubview(loadingImageView)
        adjustSizeOfLoadingIndicator()
    }
    
    func showLoadingIndicator() {
        loadingImageView.isHidden = false
        self.bringSubview(toFront: loadingImageView)
        
        startRefreshing()
    }
    
    func hideLoadingIndicator() {
        loadingImageView.isHidden = true
        
        stopRefreshing()
    }
    
    override func reloadData() {
        super.reloadData()
        self.bringSubview(toFront: loadingImageView)
    }
    
    // MARK: private methods
    // Adjust the size so that the indicator is always in the middle of the screen
    override func layoutSubviews() {
        super.layoutSubviews()
        adjustSizeOfLoadingIndicator()
    }
    
    private func adjustSizeOfLoadingIndicator() {
        let loadingImageSize = loadingImage?.size
        loadingImageView.frame = CGRect(x: frame.width/2 - loadingImageSize!.width/2, y: frame.height/2-loadingImageSize!.height/2, width: loadingImageSize!.width, height: loadingImageSize!.height)
    }
    
    // Start the rotating animation
    private func startRefreshing() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.isRemovedOnCompletion = false
        animation.toValue = M_PI * 2.0
        animation.duration = 0.8
        animation.isCumulative = true
        animation.repeatCount = Float.infinity
        loadingImageView.layer.add(animation, forKey: "rotationAnimation")
    }
    
    // Stop the rotating animation
    private func stopRefreshing() {
        loadingImageView.layer.removeAllAnimations()
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
