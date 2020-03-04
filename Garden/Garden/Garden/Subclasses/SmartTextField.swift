//
//  SmartTextField.swift
//  GHTypography
//
//  Created by Avish Manocha on 06/01/20.
//  Copyright © 2020 Guesthouser. All rights reserved.
//

import Foundation
import UIKit

protocol smartTextfieldDelegate {
    func textFieldDidDelete(textfield: UITextField)
    
}

public class SmartTextfield: UITextField {
    
    var smartFieldDelegate: smartTextfieldDelegate?
    
    
//    public override var keyboardAppearance: UIKeyboardAppearance {
//        
//        didSet {
//            return dark
//        }
//        
//    }
    
    override public func deleteBackward() {
        super.deleteBackward()
        smartFieldDelegate?.textFieldDidDelete(textfield: self)
    }
    

    
}
