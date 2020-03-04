//
//  GHLabel.swift
//  ButtonComponent
//
//  Created by Shubham on 3/19/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

@IBDesignable public class GHLabel: UILabel {
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    public var textStyle: TextStyle? {
        didSet {
         addTextAccordingToStyle()
       }
    }
    
    @IBInspectable var style:String = "b1s"{
        didSet {
            // add Text as Per Style
            addTextAsPerStyle()
        }
    }
    
    @IBInspectable var color: UIColor = AppColors.textPrimary {
        
        didSet {
            self.textStyle?.color = color
            addTextAccordingToStyle()
        }
        
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        addTextAsPerStyle()
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        addTextAsPerStyle()
    }
    
   fileprivate func addTextAsPerStyle() {
        let textStyle = getTextStyleWithString(textString: style)
        self.textStyle = textStyle
        addTextAccordingToStyle()
    }
    
    override public var text: String? {
        didSet {
            addTextAccordingToStyle()
            
        }
    }
    
   private func addTextAccordingToStyle() {
        if let tStyle = textStyle {
          //  self.baselineAdjustment = .alignCenters
            self.attributedText = tStyle.applyToString(string: text ?? "")
        }
    }
}
