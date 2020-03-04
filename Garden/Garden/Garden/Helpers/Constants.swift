//
//  Constants.swift
//  GHTypography
//
//  Created by Shubham on 2/18/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import Foundation
import UIKit

enum ColorPalletEnumFirstSection {
    case firstItem,
    secondItem, thirdItem, fourthItem
    
    var colorName: String {
        
        switch self {
        case .firstItem:
            return "Azure"
            
        case .secondItem:
            return "Golden Dust"
            
        case .thirdItem:
            return "Berry Red"
            
        case .fourthItem:
            return "Teal Green"
            
        }
    }
    
    var colorHexName: String {
        
        switch self {
        case .firstItem:
            return "#0693fe"
            
        case .secondItem:
            return "#ffcc66"
            
        case .thirdItem:
            return "#e58585"
            
        case .fourthItem:
            return "#1fffc7"
        }
         
    }
    
}

enum ColorPalletEnumSecondSection {
    case firstItem,
    secondItem, thirdItem, fourthItem, fifthItem, sixthItem, seventhItem
    
    var colorName: String {
        
        switch self {
        case .firstItem:
            return "G-100"
            
        case .secondItem:
            return "G-200"
            
        case .thirdItem:
            return "G-300"
            
        case .fourthItem:
            return "G-400"
            
        case .fifthItem:
            return "G-500"
            
        case .sixthItem:
            return "G-600"
           
        case .seventhItem:
            return "G-700"
            
        }
        
    }
    
    var colorHexName: String {
        
        switch self {
        case .firstItem:
            return "#FFFFFF"
            
        case .secondItem:
            return "#FAFAFA"
            
        case .thirdItem:
            return "#DFDFDF"
            
        case .fourthItem:
            return "#A6A6A6"
            
        case .fifthItem:
            return "#5E5E5E"
            
        case .sixthItem:
            return "#2E2E2E"
           
        case .seventhItem:
            return "#0D0D0D"
            
        }
        
    }
    
}


struct Typograph {
    static let H5:UIFont  = UIFont(name:GHFont.REGULAR, size: 28)!
    
    static let H6:UIFont  = UIFont(name: GHFont.SEMI_BOLD, size: 20)!
    static let B1:UIFont  = UIFont(name: GHFont.MEDIUM, size: 16)!
    static let B2:UIFont  = UIFont(name: GHFont.MEDIUM, size: 14)!
    static let Subtitle:UIFont  = UIFont(name: GHFont.SEMI_BOLD, size: 16)!
    static let Caption:UIFont  = UIFont(name: GHFont.BOLD, size: 14)!
    static let Overline:UIFont  = UIFont(name: GHFont.MEDIUM, size: 12)!
    
    static let singleLineTextField16Regular:UIFont  = UIFont(name: GHFont.REGULAR, size: 16)!
    static let singleLineTextField14Regular:UIFont  = UIFont(name: GHFont.REGULAR, size: 14)!
    static let singleLineTextField14Medium:UIFont  = UIFont(name: GHFont.MEDIUM, size: 14)!
    static let singleLineTextField11Medium:UIFont  = UIFont(name: GHFont.MEDIUM, size: 11)!
    
    static let headingTitle14px:UIFont  = UIFont(name: GHFont.SEMI_BOLD, size: 14)!
    static let headingTitle16px:UIFont  = UIFont(name: GHFont.MEDIUM, size: 16)!
    static let headingTitle18px:UIFont  = UIFont(name: GHFont.SEMI_BOLD, size: 18)!
    static let headingSubtitle:UIFont  = UIFont(name: GHFont.MEDIUM, size: 12)!
    static let headingSubtitle14px:UIFont  = UIFont(name: GHFont.MEDIUM, size: 14)!
    static let headingRightAlignTitle:UIFont  = UIFont(name: GHFont.SEMI_BOLD, size: 11)!
    
    static let headingTitle21px:UIFont  = UIFont(name: GHFont.REGULAR, size: 21)!
    
    static let headingTitle24px:UIFont  = UIFont(name: GHFont.REGULAR, size: 24)!

    
}


public struct GHFont {
    static let BOLD: String = "Metropolis-Bold"
    static let SEMI_BOLD: String = "Metropolis-SemiBold"
    public static let REGULAR: String = "Metropolis-Regular"
    static let MEDIUM: String = "Metropolis-Medium"
}

struct Fonttt {
    static let H5: Int = 24
    static let H9: Int = 25; static let H6: Int = 27
}


struct FOntWeight {
    
    static let fontWeiightRegular: String = GHFont.REGULAR
    static let fontWeiightRegularr: String = GHFont.REGULAR
    
}



/*
struct ButtonConstants {
    public static let Small = 34
    public static let Normal = 46
    public static let cornerRadius = 4
    public static let borderWidth = 1.0
    public static let buttonDisabled = Color.g300

    public static let primary = ButtonAttributes(titleColor: AppColors.textWhite, borderColor: AppColors.primaryColorDark, bgColorNormal:AppColors.primaryColor , bgColorHighLighted: AppColors.primaryColorDark)
    
    public static let secondary = ButtonAttributes(titleColor: AppColors.textGreen, borderColor: AppColors.textGreen, bgColorNormal:UIColor.clear , bgColorHighLighted: AppColors.textWhite)
    
    public static let destructive = ButtonAttributes(titleColor: AppColors.textWhite, borderColor: AppColors.destructiveColorDark, bgColorNormal:AppColors.destructiveColor , bgColorHighLighted: AppColors.destructiveColorDark)
    
    public static let white = ButtonAttributes(titleColor: AppColors.textPrimary, borderColor: UIColor.clear, bgColorNormal:AppColors.textWhite , bgColorHighLighted: Color.whiteUnselected)
    
    public static let text = ButtonAttributes(titleColor: AppColors.textPrimary, borderColor: UIColor.clear, bgColorNormal:UIColor.clear , bgColorHighLighted: UIColor.clear)
    
}
*/


struct ButtonAttributes {
    var titleColor:UIColor
    var borderColor:UIColor = UIColor.clear
    var bgColorNormal:UIColor
    var bgColorHighLighted:UIColor
    var borderWidth:Double
    var disabledBgColor: UIColor = ButtonConstants.buttonDisabled
    var disabledTextColor: UIColor = UIColor.white
    
    
    init(titleColor: UIColor, borderColor: UIColor = UIColor.clear,bgColorNormal: UIColor,bgColorHighLighted: UIColor, borderWidth: Double, disabledBgColor: UIColor = ButtonConstants.buttonDisabled,disabledTextColor: UIColor = UIColor.white ) {
        self.titleColor = titleColor;
        self.borderColor = borderColor
        self.bgColorNormal = bgColorNormal
        self.bgColorHighLighted = bgColorHighLighted
        self.borderWidth = borderWidth
        self.disabledBgColor = disabledBgColor
        self.disabledTextColor = disabledTextColor
    }
}



struct ViewConstants {
    public static let Small = 34
    public static let Normal = 46
    public static let cornerRadius = 10
}


public struct AppConstants {
   public static let navigationBarHeight: CGFloat = 44
   public static let statusBarHeight = UIApplication.shared.statusBarFrame.height
   public static let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.height
    public static let topPadding = UIApplication.shared.keyWindow?.safeAreaInsets.top
    public static let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom
   public static let screenWidth = UIScreen.main.bounds.width
   public static let screenHeight: CGFloat = UIScreen.main.bounds.height
   public static let buttonHeight: CGFloat = 44
   public static let buttonWidth: CGFloat = 44
   public static let buttonEdgeInsets: CGFloat = -10
   public static let buttonTextUpDownEdgeInsets: CGFloat = -8
   public static let buttonTextSidingEdgeInsets: CGFloat = 0
   public static let navigationBarInterItemSpacing: CGFloat = 8
}




//UIView.animate(withDuration: <#T##TimeInterval#>, delay: <#T##TimeInterval#>, options: <#T##UIView.AnimationOptions#>, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)

//enum Constants: AnyObject {
//
//    case inAnimationDuration = 0.9
//    case outAnimationDuration = 0.8
//    case delay = 0
//
//}


extension UIView {
    
    static var nib: UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
