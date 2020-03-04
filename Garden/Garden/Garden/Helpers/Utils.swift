//
//  Utils.swift
//  GHTypography
//
//  Created by Avish Manocha on 27/03/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import Foundation
import UIKit

struct ButtonConstants {
    public static let Small = 34
    public static let Normal = 46
    public static let cornerRadius = 4
    public static let borderWidth = 1.0
    public static let buttonDisabled = AppColors.buttonDisabled
    public static let checkBoxSize:CGSize  = CGSize(width: 25, height: 25)
    
    
    // TODO:
    public static let primary = ButtonAttributes(titleColor: AppColors.textWhite, bgColorNormal:AppColors.fillPrimary , bgColorHighLighted: AppColors.fillPrimaryDark,borderWidth: ButtonConstants.borderWidth)
    
    public static let secondary = ButtonAttributes(titleColor: AppColors.textPrimary, bgColorNormal:AppColors.buttonSecondary , bgColorHighLighted: AppColors.buttonSecondaryFocus, borderWidth: ButtonConstants.borderWidth)
    
    
    public static let destructive = ButtonAttributes(titleColor: AppColors.textWhite, bgColorNormal:AppColors.buttonDestructive , bgColorHighLighted: AppColors.buttonDestructiveFocus, borderWidth: ButtonConstants.borderWidth)
    
   
    public static let white = ButtonAttributes(titleColor: AppColors.textPrimary, bgColorNormal:AppColors.fillSecondary , bgColorHighLighted: AppColors.fillSecondaryDark, borderWidth: ButtonConstants.borderWidth)
    
    public static let textBlack = ButtonAttributes(titleColor: AppColors.textPrimary, bgColorNormal:UIColor.clear , bgColorHighLighted: UIColor.clear, borderWidth: ButtonConstants.borderWidth,disabledBgColor: UIColor.clear, disabledTextColor: AppColors.textSupporter)
    
    public static let textWhite = ButtonAttributes(titleColor: AppColors.textWhite, bgColorNormal:UIColor.clear , bgColorHighLighted: UIColor.clear, borderWidth: ButtonConstants.borderWidth,disabledBgColor: UIColor.clear, disabledTextColor: AppColors.textSupporter)
    
    public static let textLinkBlue = ButtonAttributes(titleColor: AppColors.textLinkBlue, bgColorNormal:UIColor.clear , bgColorHighLighted: UIColor.clear, borderWidth: ButtonConstants.borderWidth,disabledBgColor: UIColor.clear, disabledTextColor: AppColors.textSupporter)
}

extension UIImage {
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
}






func getTextStyleWithString(textString: String) -> TextStyle {
    
    switch textString {
    case "h1m":
        return TextStyles.h1Medium
    case "h1r":
        return TextStyles.h1Regular
        
    case "h2m":
        return TextStyles.h2Medium
    case "h2r":
        return TextStyles.h2Regular
        
    case "s1s":
        return TextStyles.subtitleSemi
    case "s1m":
        return TextStyles.subtitleMedium
    case "s1r":
        return TextStyles.subtitleRegular
        
    case "b1m":
        return TextStyles.body1Medium
    case "b1r":
        return TextStyles.body1Regular
    case "b1s":
        return TextStyles.body2Semibold
        
    case "b2m":
        return TextStyles.body2Medium
        
    case "b2r":
        return TextStyles.body2Regular
        
    case "b2s":
        return TextStyles.body2Semibold
        
    case "c1s":
        return TextStyles.captionSemibold
    case "c1m":
        return TextStyles.captionMedium
        
    case "o1m":
        return TextStyles.overlineMedium
    case "o1s":
        return TextStyles.overlineSemibold
        
    case "m1m":
        return TextStyles.miniMedium
    case "m1s":
        return TextStyles.miniSemibold
        
    default:
        return TextStyles.body1Regular
    }
    
    
    
}


public extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
    
    convenience init(all: CGFloat, alpha: CGFloat) {
        self.init(red: all/255, green: all/255, blue: all/255, alpha: alpha)
    }
    
    func borderImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        let ctx = UIGraphicsGetCurrentContext()
        self.setFill()
        if let ctx = ctx {
            ctx.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
    
}




extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let rect = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        print(rect.size.height)
      //  return ceil(rect.size.height)
       let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font: font], context: nil)
      
        print(boundingBox.height)
        return boundingBox.height
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox =  self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}

extension UIApplication {
    
    var visibleViewController: UIViewController? {
        
        guard let rootViewController = keyWindow?.rootViewController else {
            return nil
        }
        
        return getVisibleViewController(rootViewController)
    }
    
    private func getVisibleViewController(_ rootViewController: UIViewController) -> UIViewController? {
        
        if let presentedViewController = rootViewController.presentedViewController {
            return getVisibleViewController(presentedViewController)
        }
        
        if let navigationController = rootViewController as? UINavigationController {
            return navigationController.visibleViewController
        }
        
        if let tabBarController = rootViewController as? UITabBarController {
            return tabBarController.selectedViewController
        }
        
        return rootViewController
        
    }
}

public enum ControlAttributes {
    case small, medium, none
}

public extension UIView {
    
    func setViewAttributes(radiusType: ControlAttributes, borderWidth: CGFloat = 0, borderColor: UIColor = AppColors.outlinePrimary,isShadowRequired: Bool = false) {
        
        clipsToBounds = true
       // layer.masksToBounds = true
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
      
        switch radiusType {
        case .small:
            layer.cornerRadius = 4
            
        case .medium:
            layer.cornerRadius = 8
            
        case .none:
            layer.cornerRadius = 0
        }
        //AppColors.controlShadow.cgColor
        if isShadowRequired {
            //clipsToBounds = true
            layer.masksToBounds = false
            layer.shadowRadius = 4.0
            layer.shadowColor = AppColors.controlShadow.cgColor
            layer.shadowOpacity = 0.3
            layer.shadowOffset = CGSize(width: 0, height: 4)
            layer.shadowPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: layer.cornerRadius).cgPath
        }
        
    }

}


extension UserDefaults {
    
    func setDate(value: String)  {
        set(value, forKey: "date")
    }
    
    func getDate() -> String {
        return value(forKey: "date") as! String
    }
    
}

extension Date {
    
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: self)
    }
}

extension UINavigationBar {
    
    func setBottomBorderColor() {
        let bottomRect = CGRect(x: 0, y: frame.height, width: frame.width, height: 1)
        let bottomView = UIView(frame: bottomRect)
        bottomView.backgroundColor = UIColor(all: 240, alpha: 1.0)
        addSubview(bottomView)
    }
}

// MARK: for disabling the logs.
func print(_ object: Any) {
     Swift.print(object)
}

