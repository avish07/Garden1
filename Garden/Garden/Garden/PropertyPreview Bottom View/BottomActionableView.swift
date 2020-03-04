//
//  BottomActionableView.swift
//  GHTypography
//
//  Created by Shubham on 28/06/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

@IBDesignable public class BottomActionableView: UIView {
    
    let pairComponent: LabelPair = LabelPair(type: LabelPair.PairComponentType.small, numberofLines: 2)
    
    var  actionableButton: ButtonLoaderMedium = ButtonLoaderMedium()
    
@IBInspectable    var titleText: String = "Heading" {
        didSet {
            setUpTextElements()
        }
    }
@IBInspectable    var subtitleText: String = "SubHeading" {
        didSet {
            setUpTextElements()
        }
    }
    
@IBInspectable var buttonText: String = "Book now" {
        didSet {
            setUpTextElements()
        }
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    /// Setting Up View
     func setupView() {
        
        
        self.backgroundColor = AppColors.textWhite
        self.layer.borderWidth = 1.0
        self.layer.borderColor = AppColors.outlinePrimary.cgColor
        
        // Configuring Pair Components
        pairComponent.translatesAutoresizingMaskIntoConstraints = false
        
        let titleTextStyle = TextStyles.body1Medium
        let subtitleTextStyle =  TextStyles.captionMedium
        titleTextStyle.color = AppColors.textPrimary
        subtitleTextStyle.color = AppColors.textSupporter
        
        pairComponent.heading.textStyle = titleTextStyle
        pairComponent.subheading.textStyle = subtitleTextStyle
        self.titleText = "₹ 4,500"
        self.subtitleText = "26/5 - 29/5, 3 nights"
        
        
        
        // Configuring Primary Button
        actionableButton.translatesAutoresizingMaskIntoConstraints = false
        actionableButton.setTitle("Book Now", for: .normal)
        actionableButton.addTarget(self, action: #selector(startOrStopAnimation), for: UIControl.Event.touchUpInside)
        self.addSubview(pairComponent)
        self.addSubview(actionableButton)
       addConstraints()
    }
    
    func addConstraints() {
        
        // Constraints For Self
        
        NSLayoutConstraint.activate([self.heightAnchor.constraint(equalToConstant: 66)])
        
        
        // Constraints For Button Component
        
        
        NSLayoutConstraint.activate([actionableButton.widthAnchor.constraint(equalToConstant: 150),actionableButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),actionableButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)])
        
         // Constraints for LabelPair
        NSLayoutConstraint.activate([pairComponent.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),pairComponent.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)])
    }
    
    func setUpTextElements() {
        pairComponent.heading.text = titleText
        pairComponent.subheading.text = subtitleText
        actionableButton.setTitle(buttonText, for: .normal)
    }
    
    
    
    
    
    
    @objc func startOrStopAnimation() {
        if !actionableButton.isAnimating {
            actionableButton.startAnimation()
        }
        else {
            actionableButton.stopAnimation()
        }
    }
}

