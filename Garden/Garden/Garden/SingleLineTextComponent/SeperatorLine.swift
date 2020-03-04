//
//  SeperatorLine.swift
//  SIngleLineComponent
//
//  Created by Avish Manocha on 20/03/19.
//  Copyright © 2019 Avish Manocha. All rights reserved.
//

import Foundation
import UIKit

class SeperatorLine: UIView {
    
    var sizeee: CGFloat!
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
      //  setConstraint()
    }
    
    
    
    
    enum EnumSeperatorColor: Int {
        
        case dividerPrimary, dividerSecondary, dividerTertiary, dividerInvisible
        
    }
    
    
    
   
    private func setConstraint() {
         print(sizeee)
         print(seperatorColor)
        NSLayoutConstraint.activate([
            
            self.heightAnchor.constraint(equalToConstant: 10)
        ])
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        print(sizeee)
        print(seperatorColor)
        setConstraint()
    }
    
    
    var seperatorColor: EnumSeperatorColor = EnumSeperatorColor.dividerPrimary {
        
        didSet {
            
            switch seperatorColor {
                
            case .dividerPrimary:
                sizeee = 8
                self.layer.backgroundColor = AppColors.dividerPrimary.cgColor
                
            case .dividerSecondary:
                self.layer.backgroundColor = AppColors.dividerSecondary.cgColor
                
            case .dividerTertiary:
                self.layer.backgroundColor = AppColors.dividerTertiary.cgColor
               
            case .dividerInvisible:
                self.layer.backgroundColor = UIColor.clear.cgColor
                
            }
            
        }
        
        
    }
    
}
