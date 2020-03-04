//
//  GHPasswordTextField.swift
//  GHTypography
//
//  Created by Shubham on 23/12/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

public class GHPasswordTextField: TitleTextField {
    var isSecureEntryEnabled: Bool = true;
     
    override public func prepareForInterfaceBuilder() {
           super.prepareForInterfaceBuilder()
       }
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           self.textField.isSecureTextEntry = isSecureEntryEnabled
        }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
            self.textField.isSecureTextEntry = isSecureEntryEnabled
       }
    
    
    var isEyeEnabled: Bool = false {
        didSet {
            viewSetup()
        }
        
    }
    
    func viewSetup() {
         // Adding Toggle Button in RightView Mode
        addEyeButton()
    }
    func addEyeButton() {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 16, height: 16);
        button.addTarget(self, action: #selector(toggleTextFieldType), for: .touchUpInside)
        
        button.setImage(UIImage(named: "eyeDisabled", in: Bundle(for: GHPasswordTextField.self), compatibleWith: nil), for: .normal)
        button.setImage( UIImage(named: "eyeEnabled", in: Bundle(for: GHPasswordTextField.self), compatibleWith: nil), for: .selected)
        
        textField.rightView = button;
        textField.rightViewMode = .always
       
         
    }
    
    @objc func toggleTextFieldType(sender: UIButton) {
        isSecureEntryEnabled = !isSecureEntryEnabled
        textField.isSecureTextEntry = isSecureEntryEnabled;
         // Change Toggle Eye Button
        sender.isSelected = !isSecureEntryEnabled
    }
}




