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
class Heading16px: DesignableHeading {
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setStyling()
        setHolderText()
        setConstraint()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    //    setStyling()
      //  setHolderText()
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
        headingLabel.font = Typography.bodyMedium.value
        headingSublabel.font = Typography.captionMedium.value
        righAlignedLabel.font = Typography.miniMedium.value
        
    }
    
    private func setHolderText() {
        headingLabel.text = "Heading 16px"
        headingSublabel.text = "Subheading 12px"
        righAlignedLabel.text = "Mini 11px"
        
    }
    
    
}
