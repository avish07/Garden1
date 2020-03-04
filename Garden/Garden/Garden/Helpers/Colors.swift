//
//  Colors.swift
//  GHTypography
//
//  Created by Avish Manocha on 27/03/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import Foundation
import UIKit


public struct GlobalColors {

    public static let azure100: UIColor = #colorLiteral(red: 0.02352941176, green: 0.5764705882, blue: 0.9960784314, alpha: 1)  //#0693fe
    public static let azure200: UIColor = #colorLiteral(red: 0.003921568627, green: 0.462745098, blue: 0.8156862745, alpha: 1)  //#0176d0
    public static let azure300C: UIColor = #colorLiteral(red: 0.003921568627, green: 0.3411764706, blue: 0.6078431373, alpha: 1)  //#01579b
    public static let azure400: UIColor = #colorLiteral(red: 0.003921568627, green: 0.2392156863, blue: 0.4196078431, alpha: 1) //#013d6b
    public static let azure500: UIColor = #colorLiteral(red: 0, green: 0.1254901961, blue: 0.2196078431, alpha: 1)  //#002038


    public static let goldenDust100: UIColor = #colorLiteral(red: 1, green: 0.8, blue: 0.4, alpha: 1)  //#ffcc66
    public static let goldenDust200: UIColor = #colorLiteral(red: 1, green: 0.7333333333, blue: 0.2, alpha: 1)  //#ffbb33
    public static let goldenDust300C: UIColor = #colorLiteral(red: 1, green: 0.6666666667, blue: 0, alpha: 1)  //#ffaa00
    public static let goldenDust400: UIColor = #colorLiteral(red: 0.8, green: 0.5333333333, blue: 0, alpha: 1) //#cc8800
    public static let goldenDust500: UIColor = #colorLiteral(red: 0.6, green: 0.4, blue: 0, alpha: 1)  //#996600

    public static let berryRed100: UIColor = #colorLiteral(red: 0.8980392157, green: 0.5215686275, blue: 0.5215686275, alpha: 1)  //#e58585
    public static let berryRed200: UIColor = #colorLiteral(red: 0.862745098, green: 0.3568627451, blue: 0.3568627451, alpha: 1)  //#dc5b5b
    public static let berryRed300C: UIColor = #colorLiteral(red: 0.8274509804, green: 0.1843137255, blue: 0.1843137255, alpha: 1)  //#d32f2f
    public static let berryRed400: UIColor = #colorLiteral(red: 0.6784313725, green: 0.1450980392, blue: 0.1450980392, alpha: 1) //#ad2525
    public static let berryRed500: UIColor = #colorLiteral(red: 0.5098039216, green: 0.1098039216, blue: 0.1098039216, alpha: 1)  //#821c1c

    public static let tealGreen100: UIColor = #colorLiteral(red: 0.1215686275, green: 1, blue: 0.7803921569, alpha: 1)  //#1fffc7
    public static let tealGreen200: UIColor = #colorLiteral(red: 0, green: 0.9215686275, blue: 0.6901960784, alpha: 1)  //#00ebb0
    public static let tealGreen300C: UIColor = #colorLiteral(red: 0, green: 0.7294117647, blue: 0.5490196078, alpha: 1)  //#00ba8c
    public static let tealGreen400: UIColor = #colorLiteral(red: 0, green: 0.5215686275, blue: 0.3882352941, alpha: 1) //#008563
    public static let tealGreen500: UIColor = #colorLiteral(red: 0, green: 0.3215686275, blue: 0.2392156863, alpha: 1)  //#00523d


    public static let g100C: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)    //#FFFFFF
    public static let g200: UIColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)    //#FAFAFA
    public static let g300: UIColor = #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1)    //#EDEDED
    public static let g400: UIColor = #colorLiteral(red: 0.8745098039, green: 0.8745098039, blue: 0.8745098039, alpha: 1)    //#DFDFDF
    public static let g500: UIColor = #colorLiteral(red: 0.7333333333, green: 0.7333333333, blue: 0.7333333333, alpha: 1)    //#BBBBBB
    public static let g600: UIColor = #colorLiteral(red: 0.6509803922, green: 0.6509803922, blue: 0.6509803922, alpha: 1)    //#A6A6A6
    public static let g700: UIColor = #colorLiteral(red: 0.368627451, green: 0.368627451, blue: 0.368627451, alpha: 1)    //#5E5E5E
    public static let g800: UIColor = #colorLiteral(red: 0.1803921569, green: 0.1803921569, blue: 0.1803921569, alpha: 1)    //#2E2E2E
    public static let g900: UIColor = #colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05098039216, alpha: 1)    //#0D0D0D

}

public struct AppColors{

    //Main Application fill colours
    public static let fillApplicationBackgroundPrimary = GlobalColors.g100C
    public static let fillApplicationBackgroundSecondary = GlobalColors.g400
    public static let fillApplicationBackgroundDisabled = GlobalColors.g500
    public static let fillPrimary = GlobalColors.azure300C //blue colour of the main application
    public static let fillPrimaryDark = GlobalColors.azure500
    public static let fillSecondary = GlobalColors.g100C
    public static let fillSecondaryDark = GlobalColors.g400
    public static let fillDisabled = GlobalColors.g500
    public static let fillRed = GlobalColors.berryRed300C
    public static let fillRedDark = GlobalColors.berryRed500
    public static let fillGreen = GlobalColors.tealGreen400
    public static let fillGreenDark = GlobalColors.tealGreen500
    public static let fillStar = GlobalColors.goldenDust300C
    //text
    public static let textPrimary = GlobalColors.g900
    public static let textSecondary = GlobalColors.g800
    public static let textTertiary = GlobalColors.g700
    public static let textSupporter = GlobalColors.g600
    public static let textPlaceholder = GlobalColors.g500
    public static let textDisabled = GlobalColors.g400
    public static let textWhite = GlobalColors.g100C
    public static let textLinkBlue = GlobalColors.azure100
    public static let textSubRed = GlobalColors.berryRed100 //subdued berryRed shade for messages
    public static let textSubGreen = GlobalColors.tealGreen200 //subdued tealGreen shade for messages
    //divider
    public static let  dividerPrimary = GlobalColors.g300
    public static let  dividerSecondary = GlobalColors.g400
    public static let  dividerTertiary = GlobalColors.berryRed300C
    //outline
    public static let  outlinePrimary = GlobalColors.g300
    public static let  outlineSecondary = GlobalColors.g400
    //button
    public static let buttonPrimary = GlobalColors.azure300C
    public static let buttonPrimaryFocus = GlobalColors.azure500
    public static let buttonSecondary = GlobalColors.g100C
    public static let buttonSecondaryFocus = GlobalColors.g300
    public static let buttonDestructive = GlobalColors.berryRed300C
    public static let buttonDestructiveFocus = GlobalColors.berryRed400
    public static let buttonDisabled = GlobalColors.g400
    
    //Tags
    public static let primaryTag = GlobalColors.azure300C
    //Misc Colors
    public static let googleColor : UIColor = #colorLiteral(red: 0.8588235294, green: 0.19607843144, blue: 0.1568627451, alpha: 1)  //#DB3228
    public static let facebookColor : UIColor = #colorLiteral(red: 0.09803921569, green: 0.462745098, blue: 0.9450980392, alpha: 1)  //#1976F1
    
    public static let applicationBackground = GlobalColors.g200
    public static let applicationBackgroundSecondary = GlobalColors.g300
    public static let controlShadow = GlobalColors.g400
    
  
}


    
