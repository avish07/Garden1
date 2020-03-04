//
//  ReviewUser.swift
//  GHTypography
//
//  Created by Avish Manocha on 06/06/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

final class ReviewUser: UIView {
    
    
    var userImage: Icon!
    var pairComponent: LabelPair!
    var ratingView: RatingView!
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImage = Icon(type: .medium)
        userImage.setViewAttributes(radiusType: .small, borderWidth: 0.5)
        userImage.layer.cornerRadius = 22
        
        pairComponent = LabelPair(type: .small, numberofLines: 1)
        ratingView = RatingView()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        userImage.translatesAutoresizingMaskIntoConstraints = false
        pairComponent.translatesAutoresizingMaskIntoConstraints = false
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(userImage)
        addSubview(pairComponent)
        addSubview(ratingView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        userImage = Icon(type: .medium)
        userImage.setImage("checkBox") { (isTapp) -> (Bool) in
            print(isTapp)
            return isTapp
        }
        pairComponent = LabelPair(type: .medium, numberofLines: 1)
        ratingView = RatingView()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        userImage.translatesAutoresizingMaskIntoConstraints = false
        pairComponent.translatesAutoresizingMaskIntoConstraints = false
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(userImage)
        addSubview(pairComponent)
        addSubview(ratingView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
       setConstraints()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
            
            userImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            userImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            
            pairComponent.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 8),
            pairComponent.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            pairComponent.trailingAnchor.constraint(equalTo: ratingView.leadingAnchor, constant: -24),
            
            ratingView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ratingView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            ratingView.widthAnchor.constraint(equalToConstant: 96)
            ])
        
    }
    
}
