//
//  File.swift
//  GHTypography
//
//  Created by Avish Manocha on 05/04/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

@IBDesignable
class PrimaryShimmer: Shimmer {
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setValues()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setValues()
        
    }
    
    
    private func setValues() {
        label.text = "  Book now, pay later  "
        label.textColor = UIColor.white
        label.backgroundColor = UIColor(red: 0/255, green: 186/255, blue: 140/255, alpha: 1.0)
        tailImage.image = UIImage(named: "Green")
        
    }
    
    
}
