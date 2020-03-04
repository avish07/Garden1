//
//  GHCheckBoxButton.swift
//  ButtonComponent
//
//  Created by Shubham on 3/15/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit


@IBDesignable class CheckboxButton: UIButton {
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configure()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.configure()
    }
    
    func addSize() {
        self.heightAnchor.constraint(equalToConstant: ButtonConstants.checkBoxSize.height).isActive = true
        self.widthAnchor.constraint(equalToConstant: ButtonConstants.checkBoxSize.width).isActive = true
    }
    
    func addStyling() {
        self.setImage(UIImage(named:"check"), for: .normal)
        self.setImage(UIImage(named:"checked"), for: .selected)
    }
    
    func configure() {
        addSize()
        addStyling()
    }
}
