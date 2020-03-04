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
class Heading24pxDoubleLine: DesignableHeading {
    
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
        
      //  heightAnchorr.constant = 110
        self.heightAnchor.constraint(equalToConstant: 110).isActive = true
        headingLabel.heightAnchor.constraint(equalToConstant: 66).isActive = true
    }
    
    private func setStyling() {
        headingLabel.numberOfLines = 2
        headingLabel.font = Typography.h1Regular.value
        headingSublabel.font = Typography.body2Medium.value
        righAlignedLabel.text = ""
    
    }
    
    private func setHolderText() {
        headingLabel.text = "Large Heading 24px that overflows"
        headingSublabel.text = "Subheading 14px"
        righAlignedLabel.text = ""
        
    }
    
}

