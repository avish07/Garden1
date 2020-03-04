//
//  TextStyles.swift
//  ResusableViewComponents
//
//  Created by Shubham on 3/19/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import Foundation
import UIKit

public class TextStyle: NSObject {
    
    public var font:UIFont
    var lineHeight:CGFloat
    var color:UIColor?
    var characterSpacing: CGFloat = -0.033
    var textAlignment: NSTextAlignment?
    
    public init(_font:UIFont, _lineHeight:CGFloat, _color: UIColor = AppColors.textPrimary ) {
        self.font = _font
       // self.lineHeight = _lineHeight
        self.lineHeight = (font.pointSize * 1.5)
        
        self.color = _color
    }
   
    func attributeDictionary() -> [NSAttributedString.Key: Any] {
        if let textColor = color {
            let attributes: [NSAttributedString.Key: Any] = [
                .font: self.font,
                .paragraphStyle: paragraphStyle(),
                .foregroundColor: textColor,
                .baselineOffset: (lineHeight)/font.pointSize,
                NSAttributedString.Key.kern : characterSpacing
                
                ]
             return attributes
        }
        else  {
            let attributes: [NSAttributedString.Key: Any] = [
                .font: self.font,
                .paragraphStyle: paragraphStyle(),
                 .baselineOffset: (lineHeight)/font.pointSize,
                 NSAttributedString.Key.kern : characterSpacing,
                 
                
            ]
            return attributes
        }
    }
    
    
    func paragraphStyle() -> NSMutableParagraphStyle {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping
        paragraphStyle.minimumLineHeight = self.lineHeight
        if let alignment = textAlignment {
            paragraphStyle.alignment = alignment
        }
        return paragraphStyle
    }
    
    func applyToString(string: String) -> NSAttributedString {
        return NSAttributedString(string: string, attributes: attributeDictionary())
    }
    
    func applyToAttributedString(attributedString: NSAttributedString) -> NSAttributedString {
        let styledString = NSMutableAttributedString(attributedString: attributedString)
        styledString.addAttributes(attributeDictionary(), range: NSRange(location: 0, length: attributedString.length - 1))
        return styledString
    }
}


public struct  TextStyles {
    public static let h1Regular: TextStyle = TextStyle(_font: UIFont(name: GHFont.REGULAR, size: 24)!, _lineHeight: 33 )
    public static let h1Medium: TextStyle = TextStyle(_font: UIFont(name: GHFont.MEDIUM, size: 24)!, _lineHeight: 36)
    
    public static let h2Regular: TextStyle = TextStyle(_font: UIFont(name: GHFont.REGULAR, size: 24)!, _lineHeight: 29)
    public static let h2Medium: TextStyle = TextStyle(_font: UIFont(name: GHFont.MEDIUM, size: 24)!, _lineHeight: 29)
    
    public static let subtitleSemi: TextStyle = TextStyle(_font: UIFont(name: GHFont.SEMI_BOLD, size: 18)!, _lineHeight: 25)
    public static let subtitleRegular: TextStyle = TextStyle(_font: UIFont(name: GHFont.REGULAR, size: 18)!, _lineHeight: 25)
    public static let subtitleMedium: TextStyle = TextStyle(_font: UIFont(name: GHFont.MEDIUM, size: 18)!, _lineHeight: 25 )
    
    public static let body1Medium: TextStyle = TextStyle(_font: UIFont(name: GHFont.MEDIUM, size: 16)!, _lineHeight: 24)
    public static let body1Regular: TextStyle = TextStyle(_font: UIFont(name: GHFont.REGULAR, size: 16)!, _lineHeight: 24)
    public static let body1Semibold: TextStyle = TextStyle(_font: UIFont(name: GHFont.SEMI_BOLD, size: 16)!, _lineHeight: 24)
    
    public static let body2Medium: TextStyle = TextStyle(_font: UIFont(name: GHFont.MEDIUM, size: 14)!, _lineHeight: 20)
    public static let body2Regular: TextStyle = TextStyle(_font: UIFont(name: GHFont.REGULAR, size: 14)!, _lineHeight: 20)
    public static let body2Semibold: TextStyle = TextStyle(_font: UIFont(name: GHFont.SEMI_BOLD, size: 14)!, _lineHeight: 20)
    
    public static let captionSemibold: TextStyle = TextStyle(_font: UIFont(name: GHFont.SEMI_BOLD, size: 12)!, _lineHeight: 16)
    public static let captionRegular: TextStyle = TextStyle(_font: UIFont(name: GHFont.REGULAR, size: 12)!, _lineHeight: 16)
    
    public static let captionMedium: TextStyle = TextStyle(_font: UIFont(name: GHFont.MEDIUM, size: 12)!, _lineHeight: 16)
    
    
    public static let miniSemibold: TextStyle = TextStyle(_font: UIFont(name: GHFont.SEMI_BOLD, size: 11)!, _lineHeight: 14)
    public static let miniMedium: TextStyle = TextStyle(_font: UIFont(name: GHFont.MEDIUM, size: 11)!, _lineHeight: 14)
    
    public static let overlineSemibold: TextStyle = TextStyle(_font: UIFont(name: GHFont.SEMI_BOLD, size: 10)!, _lineHeight: 15)
    public static let overlineMedium: TextStyle = TextStyle(_font: UIFont(name: GHFont.MEDIUM, size: 10)!, _lineHeight: 13)
}



