//
//  GHNormalPrimaryButton.swift
//  ButtonComponent
//
//  Created by Shubham on 3/14/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

public class ButtonPrimaryMedium: GHButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override public func awakeFromNib() {
        super.awakeFromNib()
        initialiseParams()
    }
    
    override public func prepareForInterfaceBuilder() {
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
        self.buttonStyle = .primaryButton
        self.configure()
    }


}
