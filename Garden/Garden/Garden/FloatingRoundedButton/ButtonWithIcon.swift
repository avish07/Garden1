//
//  ButtonWithIcon.swift
//  GHTypography
//
//  Created by Avish Manocha on 10/01/20.
//  Copyright © 2020 Guesthouser. All rights reserved.
//

import UIKit

public class ButtonWithIcon: UIButton {

    // MARK: Handler
     public typealias actionHandler = ((Bool) -> (Bool?))?
     private var handler: actionHandler!
    
    private var insideImage: Icon!
    
    public convenience init(imageName: String?, actionHandler: actionHandler) {
        
        self.init()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 23.5
        self.isUserInteractionEnabled = false
        self.backgroundColor = AppColors.fillApplicationBackgroundDisabled
        handler = actionHandler
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        insideImage = Icon(type: .medium)
        insideImage.setImage("rightArrow")
        
      //  insideImage.backgroundColor =  UIColor.green
        self.addSubview(insideImage)
        insideImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
    @objc
    func buttonTapped() {
        
        print("Action Tapped")
        handler?(true)
        
    }
    
    public func updateBackground(isInteractable: Bool) {
        
       // self.isEnabled = isInteractable
        self.isUserInteractionEnabled = isInteractable
        
        if isInteractable {
                   
                   self.backgroundColor = AppColors.fillPrimary
               } else {
                   
                  self.backgroundColor = AppColors.fillApplicationBackgroundDisabled
               }

//        UIView.animate(withDuration: 0.5) {
//            if isInteractable {
//                       
//                       self.backgroundColor = AppColors.fillPrimary
//                   } else {
//                       
//                      self.backgroundColor = AppColors.fillApplicationBackgroundDisabled
//                   }
//        }
        
       
    }
    
//    override public var backgroundColor: UIColor? {
//        
//        didSet {
//            print(backgroundColor as Any)
//        }
//        
//    }
    
    
    override open var isHighlighted: Bool {
        
        didSet {
            backgroundColor = isHighlighted ? AppColors.fillPrimaryDark : AppColors.fillPrimary
        }
    }
    
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
        
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            self.widthAnchor.constraint(equalToConstant: 64),
            self.heightAnchor.constraint(equalToConstant: 47),
            insideImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            insideImage.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
