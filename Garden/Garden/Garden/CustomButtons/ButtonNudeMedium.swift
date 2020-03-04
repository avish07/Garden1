//
//  GHNormaWhiteButton.swift
//  ButtonComponent
//
//  Created by Shubham on 3/14/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

class ButtonNudeMedium: GHButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        initialiseParams()
    }
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initialiseParams()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialiseParams()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    
    func initialiseParams() {
        self.buttonSize = .normal
        self.buttonStyle = .whiteButton
        self.configure()
    }

}
