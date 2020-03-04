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
class Heading21px: DesignableHeading {
    
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
        
        self.heightAnchor.constraint(greaterThanOrEqualToConstant: 69).isActive = true
       // self.heightAnchor.constraint(equalToConstant: 69).isActive = true
        //headingLabel.heightAnchor.constraint(equalToConstant: 29).isActive = true
    }
    
    private func setStyling() {
        headingLabel.font = Typography.h2Regular.value
        headingSublabel.font = Typography.captionMedium.value
        righAlignedLabel.font = Typography.miniSemibold.value
        
    }
    
    private func setHolderText() {
        headingLabel.text = "Heading 21px"
        headingSublabel.text = "Subheading 12px"
        righAlignedLabel.text = "Mini 11px"
        
    }
    
}

