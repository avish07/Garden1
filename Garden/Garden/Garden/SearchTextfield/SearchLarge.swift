//
//  SearchLarge.swift
//  GHTypography
//
//  Created by Avish Manocha on 02/04/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

public class SearchLarge: DesignableSearch {
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
    }
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        
        searchConstraint =  searchTextfield.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24 + 20)
               searchConstraint.isActive = true
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        searchConstraint =  searchTextfield.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24 + 20)
        searchConstraint.isActive = true
        
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        setConstraints()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.heightAnchor.constraint(equalToConstant: 64),
            searchImageView.widthAnchor.constraint(equalToConstant: 24),
            searchImageView.heightAnchor.constraint(equalToConstant: 24)
            
            ])
        
        
    }
    
}
