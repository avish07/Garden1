//
//  PropertyPricing.swift
//  GHTypography
//
//  Created by Avish Manocha on 10/06/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit


class PropertyPricingView: UIView {
    
    var userImage: Icon!
    var pairComponent: LabelPair!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImage = Icon(type: .medium)
        
        pairComponent = LabelPair(type: .small, numberofLines: 1)
      
        
      //  self.translatesAutoresizingMaskIntoConstraints = false
        userImage.translatesAutoresizingMaskIntoConstraints = false
        pairComponent.translatesAutoresizingMaskIntoConstraints = false
      
        
        addSubview(userImage)
        addSubview(pairComponent)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
         //   self.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
            
            userImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            userImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            
            pairComponent.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 16),
            pairComponent.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            
            ])
        
    }
    
}
