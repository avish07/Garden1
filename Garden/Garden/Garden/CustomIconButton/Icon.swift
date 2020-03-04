//
//  Icon.swift
//  GHTypography
//
//  Created by Avish Manocha on 17/05/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

public class Icon: UIButton {
    
    // MARK: Handler
    public typealias  ActionHandler = ((Bool) -> (Bool?))?
    public var handler: ActionHandler!
    
    
    //MARK: Selector
    let actionSelector = #selector(buttonTapped)
    
    // MARK: Size constants
    var sizeValue: CGFloat = 44
    
 
    public var type: CustomIconButtonType!

    
    public convenience init(type: CustomIconButtonType) {
        self.init()
        handler = nil
        self.type = type
        self.addTarget(self, action: actionSelector, for: .touchUpInside)
        
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.widthAnchor.constraint(equalToConstant: sizeValue),
            self.heightAnchor.constraint(equalToConstant: sizeValue)
            
            ])
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
    }
    
    public func setImage(_ name: String, actionHandler: ActionHandler = nil) {
        self.setImage(UIImage(named: name, in: Bundle(for: Icon.self), compatibleWith: nil), for: .normal)
        
//        print(self.currentImage)
        
       // self.setImage()
      //  self.setImage(UIImage(named: "you"), for: .normal)
       // self.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        
        // self.setImage(image li, for: <#T##UIControl.State#>)
        handler = actionHandler
        switch self.type {
        case .small?:
            
            if (handler! != nil) {
                self.isUserInteractionEnabled = true
                sizeValue = 44
                self.imageEdgeInsets = UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14)
            } else {
                 self.isUserInteractionEnabled = true
                sizeValue = 16
            }
           
            break
            
        case .medium?:
            
           
            if handler! != nil {
                self.isUserInteractionEnabled = true
                sizeValue = 44
                self.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            } else {
                 self.isUserInteractionEnabled = false
                sizeValue = 24
            }
            
        case .large?:
            if handler! != nil {
                self.isUserInteractionEnabled = true
                 self.imageEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
                sizeValue = 44
                //  self.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
            } else {
                self.isUserInteractionEnabled = false
               
                sizeValue = 32
            }
            
        case .xtraLarge?:
            if handler! != nil {
                self.isUserInteractionEnabled = true
               // self.imageEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
                sizeValue = 44
                //  self.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
            } else {
                self.isUserInteractionEnabled = false
                
                sizeValue = 44
            }

            
            
        case .amenity?:
            
            
            if handler! != nil {
                self.isUserInteractionEnabled = true
                sizeValue = 44
                //  self.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
            } else {
                self.isUserInteractionEnabled = false
                sizeValue = 48
        //        self.backgroundColor = UIColor.white
          //      self.layer.cornerRadius = 8
            //     self.layer.borderWidth = 1
              //  self.layer.borderColor = UIColor(r: 237, g: 237, b: 237, alpha: 1.0).cgColor
            }
        case .none:
            break
        }
        
    }
    
    @objc func buttonTapped() {
        
        if handler! != nil {
            let val =  handler?(true)
            print(val as Any)
        }
        print("Handler")
    }
        
    }

public extension Icon {
    
    enum CustomIconButtonType: Int {
        case small, medium, large, xtraLarge, amenity
    }
    
    
}
