//
//  DesignableImageView.swift
//  SIngleLineComponent
//
//  Created by Avish Manocha on 20/03/19.
//  Copyright © 2019 Avish Manocha. All rights reserved.
//

import Foundation
import UIKit

class DesignableImageView: UIImageView {
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
    }
    
    func setImagee(_ name: String) {
        self.contentMode = .scaleAspectFit
        self.backgroundColor = UIColor.white
        self.image = UIImage(named: ImageConstants.checkBox.rawValue)
        
        
    }
    
    
}
