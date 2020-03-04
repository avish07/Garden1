//
//  GradientView.swift
//  GHTypography
//
//  Created by Shubham on 10/07/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit


enum Gradient_Type {
    case Downwards,Upwards
}


public class GradientView: UIView {

    var gradientView: CAGradientLayer!
    var gradientType: Gradient_Type = .Upwards
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    
    convenience init(type: Gradient_Type) {
        self.init()
         gradientType = type
        setupView()
    }
    
    func setupView() {
        addGradientView()
    }
    
    func addGradientView() {
        
        gradientView = CAGradientLayer()
        gradientView.frame = self.bounds
        print(gradientView.frame)
        configureDirection()
        gradientView.colors = [AppColors.textPrimary.withAlphaComponent(1).cgColor,AppColors.textPrimary.withAlphaComponent(0).cgColor]
            self.layer.addSublayer(gradientView)
    }
    
    func configureDirection() {
        
        
        if gradientType == .Downwards {
            gradientView.startPoint = CGPoint(x: 0.5, y: 0)
            gradientView.endPoint = CGPoint(x: 0.5, y: 1)
        }
        else {
            gradientView.startPoint = CGPoint(x: 0.5, y: 1)
            gradientView.endPoint = CGPoint(x: 0.5, y: 0)
        }
    }
    
}
