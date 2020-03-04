//
//  SingleLineFont14Px.swift
//  SIngleLineComponent
//
//  Created by Avish Manocha on 20/03/19.
//  Copyright © 2019 Avish Manocha. All rights reserved.
//

import Foundation
import UIKit

class SingleLineFont14Px: DesignableSingleTextComponentBase {
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setLabelStyling()
        setConstraint()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLabelStyling()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        setConstraint()
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            
            self.heightAnchor.constraint(greaterThanOrEqualToConstant: TextFieldHeight.Small.rawValue),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: ControlConstraintsPadding.NegativeSideConstraints.value),
            
            
            ])
        
    }
    
    private func setLabelStyling() {
        label.font = Typography.body2Regular.value
        label.textColor = AppColors.textPrimary
        label.text = "Single line text 14px"
        
    }
    
}
