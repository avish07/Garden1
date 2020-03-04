//
//  SingleLineFont16Px.swift
//  SIngleLineComponent
//
//  Created by Avish Manocha on 20/03/19.
//  Copyright © 2019 Avish Manocha. All rights reserved.
//

import Foundation
import UIKit

class SingleLineFont16Px: DesignableSingleTextComponentBase {
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setConstraint()
        setLabelStyling()
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
            
            self.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: ControlConstraintsPadding.NegativeSideConstraints.value),
        
            ])
    }
    
    private func setLabelStyling() {
        label.font = Typography.bodyRegular.value
        label.textColor = AppColors.textPrimary
        label.text = "Single line text 16px"
    }
    
}
