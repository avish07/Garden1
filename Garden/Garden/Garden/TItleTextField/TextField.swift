//
//  GHTextField.swift
//  GHTypography
//
//  Created by Shubham on 3/26/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

public class TextField: UITextField {
    var isSuccessField: Bool = false
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        UITextField.appearance().tintColor = AppColors.textPrimary
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UITextField.appearance().tintColor = AppColors.textPrimary
    }
    
    
    
    var textStyle: TextStyle? {
        didSet {
            self.font = textStyle?.font
            self.textColor = textStyle?.color
        }
    }
    
    
    var placeholderTextStyle: TextStyle? {
        didSet {
            addTextAccordingToStyle()
        }
    }
    
    override public var placeholder: String? {
        didSet {
            addTextAccordingToStyle()
        }
    }
    
    
    func  addTextAccordingToStyle() {
        if let pTextStyle = placeholderTextStyle {
            let attributedString = NSAttributedString(string: placeholder ?? "", attributes: [NSAttributedString.Key.font : pTextStyle.font, NSAttributedString.Key.foregroundColor: pTextStyle.color!])
            self.attributedPlaceholder = attributedString
        }
        
    }
    
    
    
    
}
