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
class Heading18px: DesignableHeading {
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setStyling()
        setHolderText()
        setConstraint()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setStyling()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setConstraint()
    }
    
    private func setConstraint() {
        
        NSLayoutConstraint.activate([
            
            headingLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
            ])
    }
    
    private func setStyling() {
        let headingTextStyle = TextStyles.subtitleMedium
        headingTextStyle.color = AppColors.textPrimary
        self.seperatorLine.seperatorColor = SeperatorLine.EnumSeperatorColor(rawValue: 3)!
        headingLabel.textStyle = headingTextStyle
        
    }
    
    private func setHolderText() {
        headingLabel.textColor = AppColors.textSecondary
        headingLabel.text = "Heading 18px"
        
    }
    
}

