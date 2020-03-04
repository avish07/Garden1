//
//  Pair1.swift
//  GHTypography
//
//  Created by Avish Manocha on 02/07/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

final class Body2Body1: LabelPair {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(type: PairComponentType = .medium, numberofLines: Int = 2) {
        super.init(type: type, numberofLines: numberofLines)
        setTextStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    private func setTextStyle() {
        let textStyle = TextStyles.body2Medium
        textStyle.color = AppColors.textSupporter
        heading.textStyle = textStyle
        
        let textStyle2 = TextStyles.body1Medium
        textStyle2.color = AppColors.textPrimary
        subheading.textStyle = textStyle2
        
    }
    
   
    

}
