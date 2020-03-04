//
//  SearchLarge.swift
//  GHTypography
//
//  Created by Avish Manocha on 02/04/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

public class SearchSmall: DesignableSearch {
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
    }
    
    public override init(frame: CGRect) {
           super.init(frame: .zero)
           
           searchConstraint =  searchTextfield.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18 + 20)
           searchConstraint.isActive = true
        
    }
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
       }
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        searchConstraint =  searchTextfield.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18 + 20)
        searchConstraint.isActive = true
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        setConstraints()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.heightAnchor.constraint(equalToConstant: 52),
            searchImageView.widthAnchor.constraint(equalToConstant: 18),
            searchImageView.heightAnchor.constraint(equalToConstant: 18)
            
            ])
        
        
    }
    
}
