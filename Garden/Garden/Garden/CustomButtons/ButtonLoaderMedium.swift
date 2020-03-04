//
//  GHPrimaryLoaderButton.swift
//  ButtonComponent
//
//  Created by Shubham on 3/15/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit


@IBDesignable class ButtonLoaderMedium: ButtonPrimaryMedium {
    
    
   fileprivate var activityIndicator: DGActivityIndicatorView?
    
    var backupTitle: String = ""
    var isAnimating: Bool {
        get {
            
            return activityIndicator!.animating
        }
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addLoaderIndicator()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addLoaderIndicator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addLoaderIndicator()
    }
    
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
    }
    
    func addLoaderIndicator() {
        activityIndicator = DGActivityIndicatorView(type: .ballBeat, tintColor:UIColor.white , size: 40)
        activityIndicator?.frame = CGRect(x: self.frame.size.width/2 - 25, y: self.frame.size.height/2 - 25, width: 50, height: 50)
        self.addSubview(activityIndicator!)
    }
    
    func startAnimation() {
        activityIndicator?.frame = CGRect(x: self.frame.size.width/2 - 25, y: self.frame.size.height/2 - 25, width: 50, height: 50)
        backupTitle = self.titleLabel?.text ?? ""
        self.setTitle("", for: .normal)
        activityIndicator?.startAnimating()
        
    }
    func stopAnimation() {
        
        
        activityIndicator?.frame = CGRect(x: self.frame.size.width/2 - 25, y: self.frame.size.height/2 - 25, width: 50, height: 50)

        self.setTitle(backupTitle, for: .normal)
        activityIndicator?.stopAnimating()
    }
    
}

