//
//  Toolbar.swift
//  GHTypography
//
//  Created by Avish Manocha on 12/04/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

class ToolbarSingleton: UIView {
    
    private var animator: UIViewPropertyAnimator!
    
    typealias closure = ((Bool) -> ())?
    static var refClosure: closure?
    let screenWidth = UIScreen.main.bounds.width
    var isShow: Bool = false
    var isImageActionable: Bool = false
    private static let shared = ToolbarSingleton()
    
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
        
    }()
    
    private let actionButton: UIButton = {
        let button = UIButton()
       return button
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        
    }
    
    private func setup() {
        isUserInteractionEnabled = true
        self.addSubview(textLabel)
        addSubview(actionButton)
        actionButton.addTarget(self, action: #selector(self.tapIt), for: .touchUpInside)
        
    }
    
    @objc func tapIt() {
        if let cloosure = ToolbarSingleton.refClosure {
            cloosure?(true)
        }
        
    }
    
    
    static func showErrorToolbar(_ text: String, _ buttonText: String ,onTouch: closure ) {
       
      self.shared.setBgColor(color: AppColors.fillRed)
        self.shared.errorLayout(titleText: text, titleTextStyle: TextStyles.captionRegular, titleTextColor: AppColors.textWhite, buttonText: buttonText, buttonTextStyle: TextStyles.body2Semibold, buttonTextColor: AppColors.textWhite, buttonImage: nil)
        refClosure = onTouch
    }
    
    static func showSuccessToolbar(_ text: String, _ buttonText: String ,onTouch: closure ) {
       
        self.shared.setBgColor(color: AppColors.fillGreen)
        self.shared.errorLayout(titleText: text, titleTextStyle: TextStyles.captionRegular, titleTextColor: AppColors.textWhite)
    }
    
    static func showInternetToolbar(_ text: String, _ buttonText: String ,onTouch: closure ) {
        
        self.shared.setBgColor(color: AppColors.fillSecondary)
        self.shared.errorLayout(titleText: text, titleTextStyle: TextStyles.captionRegular, titleTextColor: AppColors.textPrimary, buttonText: buttonText, buttonTextStyle: TextStyles.body2Semibold, buttonTextColor: AppColors.textPrimary, buttonImage: nil)
         refClosure = onTouch
    }
    
    static func showPasswordToolbar(_ text: String, _ buttonText: String ,onTouch: closure ) {
        
        self.shared.setBgColor(color: AppColors.fillRed)
            self.shared.errorLayout(titleText: text, titleTextStyle: TextStyles.captionRegular, titleTextColor: AppColors.textWhite, buttonText: nil, buttonTextStyle: nil, buttonTextColor: nil, buttonImage: ImageConstants.checkBox.rawValue)
        if (onTouch != nil) {
            self.shared.isImageActionable = false
        }
         refClosure = onTouch
    }
    
    private func setBgColor(color: UIColor) {
             actionButton.setAttributedTitle(NSAttributedString(string: ""), for: .normal)
            actionButton.setImage(nil, for: .normal)
            self.backgroundColor = color
        
    }

    private func errorLayout(titleText: String, titleTextStyle: TextStyle, titleTextColor: UIColor, buttonText: String? = nil, buttonTextStyle: TextStyle? = nil, buttonTextColor: UIColor? = nil, buttonImage: String? = nil) {
        
        
        if self.isShow {
            return
        }
        
        var width: (button: CGFloat, title: CGFloat) = (0, 0)
        if let buttonText = buttonText {
            actionButton.setImage(nil, for: .normal)
            let buttonTextStyl = buttonTextStyle!
            buttonTextStyl.color = buttonTextColor!
            let attributedString =  buttonTextStyl.applyToString(string: buttonText)
            actionButton.setAttributedTitle(attributedString, for: .normal)
           
            width.button = buttonText.width(withConstrainedHeight: 20, font: buttonTextStyl.font)
            width.title =  screenWidth - (width.button + 72)
             actionButton.setImage(nil, for: .normal)
            actionButton.frame = CGRect(x: screenWidth - (34 + width.button), y: 0, width: (width.button + 10), height: 48)
            
        } else if let imageName = buttonImage {
            
            actionButton.setImage(UIImage(named: imageName), for: .normal)
            width.title =  screenWidth - 72
                width.button = 44
                actionButton.frame = CGRect(x: screenWidth - (14 + width.button), y: 0, width: width.button, height: self.frame.size.height)

        } else {
            actionButton.setImage(nil, for: .normal)
            width.title =  screenWidth - 48
            actionButton.frame = CGRect(x: screenWidth - (34 + width.button), y: 0, width: (width.button + 10), height: 48)
            
        }
        
        let titleTextStyl = titleTextStyle
        titleTextStyl.color = titleTextColor
        let attributedString1 =  titleTextStyl.applyToString(string: titleText)
        textLabel.attributedText = attributedString1
        print(titleTextStyl.font)
        textLabel.frame = CGRect(x: 24, y: 8, width: width.title, height: 32)
        self.frame = CGRect(x: 0, y: -(textLabel.frame.size.height + 16), width: UIScreen.main.bounds.width, height: 48)
     
        UIApplication.shared.visibleViewController?.view.addSubview(self)
        self.showToolbarAnimation()
        
    }
    
    
   

 
    private func showToolbarAnimation() {
        isShow = true
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveLinear, .allowUserInteraction], animations: {
            self.frame.origin.y = 0
            
        }) { (isSuccess) in
            
            if isSuccess {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0, execute: {
                self.hideToolbarAnimation()
                })
                
                
            }
        }
        
    }
    
    private func hideToolbarAnimation() {
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveLinear, .allowUserInteraction], animations: {
            self.frame.origin.y = -48
          
        }) { (isSuccess) in
        
            self.isImageActionable = false
            self.isShow = false
            self.removeFromSuperview()
        }
        
    }
    
}

