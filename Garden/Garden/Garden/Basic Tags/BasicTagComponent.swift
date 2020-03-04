//
//  BasicTagComponent.swift
//  GHTypography
//
//  Created by Shubham on 5/8/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

@IBDesignable class BasicTagComponent: BaseTagComponent {
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable var text:String = "Tag 1" {
        didSet {

            manageTagState()
        }
    }
    
    
   override var isSelected:Bool {
        didSet {
            manageTagState()
        }
    }
    
    func setSelected(selected:Bool) {
        isSelected = selected;
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
   }
    
    /// configuration of Basic Tag View
    func configureView() {
        
        // Configuring Color
        self.backgroundColor = AppColors.fillPrimary
        
          // Adding Constraints
        NSLayoutConstraint.activate([textLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),self.widthAnchor.constraint(equalTo: self.textLbl.widthAnchor, multiplier: 1.0, constant: 32),self.heightAnchor.constraint(equalTo: self.textLbl.heightAnchor, multiplier: 1.0, constant: 16)])
        
        NSLayoutConstraint.activate([textLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),textLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)])
        self.layer.cornerRadius = 4
         manageTagState()
    }
    
    /// Managing Tag State
    func manageTagState() {
        if self.isSelected {
                configureSelectedTag()
        }
        else {
            configureUnSelectedTag()
        }
    }
    
    /// Set Unselected State of Tag
    func configureUnSelectedTag() {
        self.textLbl.text = text
        self.backgroundColor = AppColors.fillSecondary
        self.layer.borderWidth = 1.0
        self.layer.borderColor  = AppColors.outlinePrimary.cgColor
         let textStyle = self.textLbl.textStyle
         textStyle?.color = AppColors.textPrimary
        self.textLbl.textStyle = textStyle
    }
    
    /// Set Selected State of Tag
    func configureSelectedTag() {
        self.textLbl.text = text
        self.backgroundColor = AppColors.fillPrimary
         self.layer.borderWidth = 0.0
        self.layer.borderColor  = AppColors.fillPrimaryDark.cgColor
        let textStyle = self.textLbl.textStyle
        textStyle?.color = AppColors.textWhite
        self.textLbl.textStyle = textStyle
    }
}
