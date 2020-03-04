//
//  File.swift
//  GHTypography
//
//  Created by Avish Manocha on 05/04/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

@IBDesignable
class TerShimmer: Shimmer {
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setValues()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setValues()
        
    }
    
    
    override init() {
        super.init()
        setValues()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    private func setValues() {
        label.text = "  Early bird offer  "
        label.textColor = UIColor(red: 13/255, green: 13/255, blue: 13/255, alpha: 1.0)
        label.backgroundColor = UIColor(red: 224/255, green: 221/255, blue: 110/255, alpha: 1.0)
        tailImage.image = UIImage(named: "Yellow")
        
    }
    
    
}
