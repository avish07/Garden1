//
//  File.swift
//  GHTypography
//
//  Created by Avish Manocha on 05/04/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

@IBDesignable
class ProperlyShimmer: Shimmer {
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setValues()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setValues()
        
    }
    
    override init() {
        super.init()
        
        setValues()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            shimmerView.widthAnchor.constraint(equalToConstant: 114),
            shimmerView.heightAnchor.constraint(equalToConstant: 21),
            
            shimmerView.contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            shimmerView.contentView.heightAnchor.constraint(equalToConstant: 21),
            shimmerView.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            shimmerView.contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            tailImage.heightAnchor.constraint(equalToConstant: 0)
           
            ])
        
    }
    
    private func setValues() {
        self.shimmerView.layer.borderWidth = 0.5
        self.shimmerView.layer.borderColor = #colorLiteral(red: 0.1176470588, green: 0.1960784314, blue: 0.3098039216, alpha: 1)
        self.shimmerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner,. layerMinXMinYCorner]
        label.textColor = AppColors.textWhite
        let textStyle = TextStyle(_font: UIFont(name: GHFont.SEMI_BOLD, size: 10)!, _lineHeight: 0)

        textStyle.color = AppColors.textWhite
        label.attributedText = textStyle.applyToString(string: "  Managed by properly  ")
        label.backgroundColor = #colorLiteral(red: 0.1647058824, green: 0.2666666667, blue: 0.4117647059, alpha: 1)
        
    }
    
    
}
