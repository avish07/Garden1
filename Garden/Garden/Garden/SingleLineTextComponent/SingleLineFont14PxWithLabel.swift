//
//  SingleLineFont14PxWithLabel.swift
//  SIngleLineComponent
//
//  Created by Avish Manocha on 20/03/19.
//  Copyright © 2019 Avish Manocha. All rights reserved.
//

import Foundation
import UIKit

class SingleLineFont14PxWithLabel: DesignableSingleTextComponentBase {
    
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
        // self.layer.backgroundColor = UIColor.white.cgColor
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
          //  self.heightAnchor.constraint(equalToConstant: TextFieldHeight.Small.rawValue),
            self.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
            label.trailingAnchor.constraint(equalTo: secondLabel.leadingAnchor, constant: -16),
            secondLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            secondLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            secondLabel.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 16)
        
            ])
        
    }
    
    
    let secondLabel: UILabel =  {
        let lbl = UILabel()
        lbl.text = "Mini 11px"
        lbl.textColor = UIColor(red: 166/255, green: 166/255, blue: 166/255, alpha: 1.0)
        lbl.textAlignment = .right
        lbl.font = Typography.miniMedium.value
        lbl.layer.backgroundColor = UIColor.white.cgColor
        return lbl
    }()
    
    
    private func setLabelStyling() {
        //Typography.body2Medium.value
        label.font = Typography.body2Medium.value
        label.textColor = AppColors.textPrimary
        label.text = "Single line text 14px"
    }
    
    
    
}

class CustomLabel: UILabel {
    
  override  var text: String? {
    
    didSet {
        
        
        
    }
        
}
    
    
    
}
