//
//  AmenityView.swift
//  GHTypography
//
//  Created by Avish Manocha on 31/05/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

final class AmenityView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    var button = Icon(type: .medium)
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    let imageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.setViewAttributes(radiusType: .medium, borderWidth: 1)
        return view
        
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        let textStyle = TextStyles.body2Medium
        textStyle.color = AppColors.textSecondary
        label.attributedText = textStyle.applyToString(string: "Power backup")
        return label
        
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageContainer.addSubview(button)
        addSubview(imageContainer)
        addSubview(textLabel)
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    private func setup() {
        
        NSLayoutConstraint.activate([
            
            imageContainer.topAnchor.constraint(equalTo: self.topAnchor),
            imageContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageContainer.widthAnchor.constraint(equalToConstant: 48),
            
            button.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor),
           
            textLabel.leadingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: 8),
            textLabel.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor),
            textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
            
            ])
        
    }
    
}
