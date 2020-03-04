//
//  Heading16px.swift
//  SIngleLineComponent
//
//  Created by Avish Manocha on 22/03/19.
//  Copyright © 2019 Avish Manocha. All rights reserved.
//

import Foundation

@IBDesignable
class Heading14px: DesignableHeading {
    
    @IBInspectable
    var headerText: String = "Heading 14px" {
        
        didSet {
            
            headingLabel.text = headerText
        }
        
        
    }
    
    
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
        
        self.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
      //  self.heightAnchor.constraint(equalToConstant: 40).isActive = true
       // headingLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setStyling() {
        headingLabel.font = Typography.body2Semibold.value
        
    }
    
    private func setHolderText() {
        headingLabel.text = headerText
        
    }
    
}
