//
//  File.swift
//  GHTypography
//
//  Created by Avish Manocha on 05/04/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

@IBDesignable
class SecondaryShimmer: Shimmer {
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setValues()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setValues()
        
    }
    
    
    private func setValues() {
        label.text = "  Get 10% off  "
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.red
        tailImage.image = UIImage(named: "Red")
        
    }
    
    
}
