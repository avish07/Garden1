//
//  SingleLineFont16PxWithLabel.swift
//  SIngleLineComponent
//
//  Created by Avish Manocha on 20/03/19.
//  Copyright © 2019 Avish Manocha. All rights reserved.
//

import Foundation
import UIKit

class SingleLineFont16PxWithLabel: DesignableSingleTextComponentBase {
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setLabelStyling()
        addSubview(secondLabel)
        
        setConstraint()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setLabelStyling()
        addSubview(secondLabel)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setConstraint()
    }
    
    
    private func setConstraint() {
    
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            
            self.heightAnchor.constraint(greaterThanOrEqualToConstant: TextFieldHeight.Large.rawValue),
            label.trailingAnchor.constraint(equalTo: secondLabel.leadingAnchor, constant: -16),
            secondLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            secondLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            secondLabel.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 16)
            
            ])
        
    }
    
    
    let secondLabel: UILabel =  {
        let lbl = UILabel()
        lbl.text = "Mini 11px"
        lbl.textAlignment = .right
        lbl.textColor = AppColors.textSecondary
        lbl.font = Typography.miniMedium.value
        lbl.layer.backgroundColor = UIColor.white.cgColor
        return lbl
    }()
    
    
    private func setLabelStyling() {
        label.font = Typography.bodyRegular.value
        label.textColor = AppColors.textPrimary
        label.text = "Single line text 16px"
    }
    
    
    
}


