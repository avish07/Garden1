//
//  BaseTagComponent.swift
//  GHTypography
//
//  Created by Shubham on 5/8/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

enum TagSize  {
    case small
    case normal
    case large
}


@IBDesignable class BaseTagComponent: UIControl {
    var textLbl: GHLabel = GHLabel()
    
    var type: TagSize = .small {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var tagSize: String =  "s" {
        didSet {
            switch tagSize {
            case "s":
                type = .small
            case "n","m":
                type = .normal
            case "l":
                type = .large
            default:
                type = .small
            }
        }
    }
    
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    
    
    /// View Setup Helper; required for setting up view for the first time
    func setupView() {
        let textStyle = getTextStyle()
         textLbl.textStyle = textStyle;
        self.addSubview(textLbl)
        textLbl.translatesAutoresizingMaskIntoConstraints = false
        print(self.frame)
    }
    
    
    func getTextStyle() -> TextStyle {
        switch type {
        case .small:
            return TextStyles.captionMedium
        case .normal:
            return TextStyles.body2Medium
        case .large:
            return TextStyles.body1Medium
        }
    }
    
    
}
