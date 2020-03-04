//
//  GHButton.swift
//  ButtonComponent
//
//  Created by Shubham on 3/14/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit


enum GHButtonSize {
    case small
    case normal
}

enum GHButtonType {
    case primaryButton
    case secondaryButton
    case destructiveButton
    case whiteButton
    case textButtonBlack
    case textButtonWhite
    case textButtonLinkBlue
}


@IBDesignable public class GHButton: UIButton {

    var buttonSize: GHButtonSize = .normal {
        didSet {
            // Layout Subview
            addSize()
        }
    }
    
    var buttonStyle: GHButtonType = .destructiveButton {
        didSet {
            // Layout Subview
            performStyling()
        }
    }
    
    // MARK- Overriden Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    // For Configuting Common state
    override public var isEnabled:Bool {
        didSet {
            //Your code
            if isEnabled {
                self.performStyling()
            }
            else {
                self.layer.borderColor = UIColor.clear.cgColor
            }
        }
    }
    
     func configure() {
        // Setting Up Base Properties that are to be inherited from Us
        self.layer.cornerRadius = CGFloat(ButtonConstants.cornerRadius)
        self.layer.masksToBounds = true
        
        let buttonStyle: ButtonAttributes  = getButtonAttributes(type: self.buttonStyle)
          // add Disabled State
        self.setBackgroundImage(UIImage(color: buttonStyle.disabledBgColor), for: .disabled)
        self.setTitleColor(buttonStyle.disabledTextColor, for: .disabled)
        // Add Subclasses Styling
        addSize()
        performStyling()
    }
    
    func addSize() {
        switch buttonSize {
        case .normal:
            let textStyle = TextStyles.body2Semibold
            self.heightAnchor.constraint(equalToConstant:CGFloat(textStyle.lineHeight + 24 )).isActive = true
            self.titleLabel?.font = textStyle.font;
            
            
        case .small:
            let textStyle = TextStyles.captionSemibold
            self.heightAnchor.constraint(equalToConstant:CGFloat(textStyle.lineHeight + 20 )).isActive = true
            self.titleLabel?.font = textStyle.font;
        }
    }
    
    func performStyling() {
        let buttonStyle: ButtonAttributes  = getButtonAttributes(type: self.buttonStyle)
        self.setTitleColor(buttonStyle.titleColor, for: .normal)
        self.setTitleColor(buttonStyle.titleColor, for: .highlighted)
        self.layer.borderWidth = CGFloat(buttonStyle.borderWidth)
        self.layer.borderColor = buttonStyle.borderColor.cgColor
        self.setBackgroundImage(UIImage(color: buttonStyle.bgColorNormal), for: .normal)
        self.setBackgroundImage(UIImage(color: buttonStyle.bgColorHighLighted), for: .highlighted)
    }
    
    func getButtonAttributes(type: GHButtonType) -> ButtonAttributes {
        
        switch type {
        case .primaryButton:
            return   ButtonConstants.primary
            
        case .secondaryButton:
            return   ButtonConstants.secondary
        case .destructiveButton:
            return   ButtonConstants.destructive
            
        case .whiteButton:
            return   ButtonConstants.white
        case .textButtonBlack:
            return   ButtonConstants.textBlack
        
        case .textButtonWhite:
            return   ButtonConstants.textWhite
        
        case .textButtonLinkBlue:
         return   ButtonConstants.textLinkBlue
    }
}
    
}

public class ButtonStyle {
    public let textColor: UIColor
    public let borderColor: UIColor
    public let bgColorNormal: UIColor
    public let bgColorHighlighted: UIColor
    public let borderWidth: Double
    
    public init(_textColor: UIColor, _borderColor: UIColor, _bgColorNormal: UIColor, _bgColorHighlighted: UIColor, _borderWidth: Double
        ) {
        self.textColor = _textColor
        self.borderColor = _borderColor
        self.bgColorNormal = _bgColorNormal
        self.bgColorHighlighted = _bgColorHighlighted
        self.borderWidth = _borderWidth
    }
    
}

