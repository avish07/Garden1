//
//  SingleLineFont16PxWithImage.swift
//  SIngleLineComponent
//
//  Created by Avish Manocha on 20/03/19.
//  Copyright © 2019 Avish Manocha. All rights reserved.
//

import Foundation
import UIKit

class SingleLineFont16PxWithImage: DesignableSingleTextComponentBase {
    
    var imgView: DesignableImageView!
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setLabelStyling()
        setImage()
        
        setConstraint()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setLabelStyling()
        setImage()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setConstraint()
    }
    
    private func setConstraint() {
   
        imgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            self.heightAnchor.constraint(greaterThanOrEqualToConstant: TextFieldHeight.Large.rawValue),
            
            label.trailingAnchor.constraint(equalTo: imgView.leadingAnchor, constant: -16),
            
            imgView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imgView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: ControlConstraintsPadding.NegativeSideConstraints.value),
            imgView.widthAnchor.constraint(equalToConstant: ControlConstraintsPadding.ImageWidthConstraint.value),
            imgView.heightAnchor.constraint(equalToConstant: ControlConstraintsPadding.ImageWidthConstraint.value)
            
            
            ])
       // self.layoutIfNeeded()
    }
    
    private func setLabelStyling() {
        label.font = Typography.bodyRegular.value
        label.textColor = AppColors.textPrimary
        label.text = "Single line text 16px"
    }
    
    
    private func setImage() {
        imgView = DesignableImageView()
        imgView.setImagee(ImageConstants.checkBox.rawValue)
        addSubview(imgView)
        
    }
    
}
