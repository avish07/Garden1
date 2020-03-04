//
//  ConstraintsPadding.swift
//  GHTypography
//
//  Created by Avish Manocha on 27/03/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import Foundation
import UIKit

enum ControlConstraintsPadding: CGFloat {
    
    case PositiveSideConstraints, fromTop, NegativeSideConstraints, ImageWidthConstraint, SpacingBetweenControls, verticalSpacingBetweenControls
    
    var value: CGFloat {
        switch self {
        case .PositiveSideConstraints:
            return 24
            
        case .fromTop:
            return 16
            
        case .NegativeSideConstraints:
            return -24
            
        case .ImageWidthConstraint:
            return 24
            
        case .SpacingBetweenControls:
            return -16
            
        case .verticalSpacingBetweenControls:
            return 4
            
        }
        
    }
    
}
