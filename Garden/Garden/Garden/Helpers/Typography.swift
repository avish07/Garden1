//
//  Typography.swift
//  GHTypography
//
//  Created by Avish Manocha on 27/03/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import Foundation
import UIKit

fileprivate enum FontWeight: String {
    case metropolisBold = "Metropolis-Bold"
    case metropolisSemiBold = "Metropolis-SemiBold"
    case metropolisRegular = "Metropolis-Regular"
    case metropolisMedium = "Metropolis-Medium"
}

fileprivate enum FontSize: CGFloat {
    case point24 = 24
    case point21 = 21
    case point18 = 18
    case point16 = 16
    case point14 = 14
    case point12 = 12
    case point11 = 11
    case point10 = 10
    
}

enum Typography {
    
    case h1Medium, h1Regular, h2Medium, h2Regular, subtitleSemibold, subtitleMedium, subtitleRegular, bodySemibold, bodyMedium, bodyRegular, body2Semibold, body2Medium, body2Regular, captionMedium, captionSemibold, miniSemibold, miniMedium, OverlineSemibold, OverlineMedium
    
    var value: UIFont {
        
        switch self {
        case .h1Medium:
            return UIFont(name: FontWeight.metropolisBold.rawValue, size: FontSize.point24.rawValue)!
            
        case .h1Regular:
            return UIFont(name: FontWeight.metropolisRegular.rawValue, size: FontSize.point24.rawValue)!
            
        case .h2Medium:
            return UIFont(name: FontWeight.metropolisMedium.rawValue, size: FontSize.point21.rawValue)!
            
        case .h2Regular:
            return UIFont(name: FontWeight.metropolisRegular.rawValue, size: FontSize.point21.rawValue)!
            
        case .subtitleSemibold:
            return UIFont(name: FontWeight.metropolisSemiBold.rawValue, size: FontSize.point18.rawValue)!
            
        case .subtitleMedium:
            return UIFont(name: FontWeight.metropolisMedium.rawValue, size: FontSize.point18.rawValue)!
            
        case .subtitleRegular:
            return UIFont(name: FontWeight.metropolisRegular.rawValue, size: FontSize.point18.rawValue)!
            
        case .bodySemibold:
            return UIFont(name: FontWeight.metropolisSemiBold.rawValue, size: FontSize.point16.rawValue)!
            
        case .bodyMedium:
            return UIFont(name: FontWeight.metropolisMedium.rawValue, size: FontSize.point16.rawValue)!
            
        case .bodyRegular:
            return UIFont(name: FontWeight.metropolisRegular.rawValue, size: FontSize.point16.rawValue)!
            
        case .body2Semibold:
            return UIFont(name: FontWeight.metropolisSemiBold.rawValue, size: FontSize.point14.rawValue)!
            
        case .body2Medium:
            return UIFont(name: FontWeight.metropolisMedium.rawValue, size: FontSize.point14.rawValue)!
            
        case .body2Regular:
            return UIFont(name: FontWeight.metropolisRegular.rawValue, size: FontSize.point14.rawValue)!
            
        case .captionMedium:
            return UIFont(name: FontWeight.metropolisMedium.rawValue, size: FontSize.point12.rawValue)!
            
        case .captionSemibold:
            return UIFont(name: FontWeight.metropolisSemiBold.rawValue, size: FontSize.point12.rawValue)!
            
        case .miniSemibold:
            return UIFont(name: FontWeight.metropolisSemiBold.rawValue, size: FontSize.point11.rawValue)!
            
        case .miniMedium:
            return UIFont(name: FontWeight.metropolisMedium.rawValue, size: FontSize.point11.rawValue)!
            
        case .OverlineSemibold:
            return UIFont(name: FontWeight.metropolisSemiBold.rawValue, size: FontSize.point10.rawValue)!
            
        case .OverlineMedium:
            return UIFont(name: FontWeight.metropolisMedium.rawValue, size: FontSize.point10.rawValue)!
            
        }
        
    }
    
}
