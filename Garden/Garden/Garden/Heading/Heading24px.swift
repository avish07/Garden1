//
//  Heading16px.swift
//  SIngleLineComponent
//
//  Created by Avish Manocha on 22/03/19.
//  Copyright © 2019 Avish Manocha. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable
class Heading24px: DesignableHeading {
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setStyling()
        setHolderText()
        setConstraint()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setStyling()
        setHolderText()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setConstraint()
    }
    
    private func setConstraint() {
        
        self.heightAnchor.constraint(equalToConstant: 77).isActive = true
        headingLabel.heightAnchor.constraint(equalToConstant: 33).isActive = true
    }
    
    private func setStyling() {
        headingLabel.font = Typography.h1Regular.value
        headingSublabel.font = Typography.body2Medium.value
        righAlignedLabel.font = Typography.miniSemibold.value
        
    }
    
    private func setHolderText() {
        headingLabel.text = "Heading 24px"
        headingSublabel.text = "Subheading 14px"
        righAlignedLabel.text = "Mini 11px"
        
    }
    
}
