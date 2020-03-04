//
//  GHNormalWhiteTextButton.swift
//  GHTypography
//
//  Created by Shubham on 17/12/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import Foundation

import UIKit

class TextButtonWhite: GHButton {

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
        self.buttonStyle = .textButtonWhite
        self.configure()
    }
}


