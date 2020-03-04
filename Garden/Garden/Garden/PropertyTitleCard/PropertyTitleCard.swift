//
//  PropertyTitleCard.swift
//  GHTypography
//
//  Created by Avish Manocha on 28/05/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

class PropertyTitleCard: UIView {
    
    var pairComponent: H2Body2!
    var ratingView: RatingView!
    
    let reviewCount: GHLabel = {
        let label = GHLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isOpaque = true
       let textStyle = TextStyles.captionMedium
       textStyle.color = AppColors.textSupporter
       label.textStyle = textStyle
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

        self.translatesAutoresizingMaskIntoConstraints = false

        pairComponent = H2Body2(type: .medium, numberofLines: 2)
        ratingView = RatingView()
        pairComponent.translatesAutoresizingMaskIntoConstraints = false
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        reviewCount.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pairComponent)
        addSubview(ratingView)
        addSubview(reviewCount)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setup()
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        pairComponent = H2Body2(type: .medium, numberofLines: 2)
        ratingView = RatingView()
        pairComponent.translatesAutoresizingMaskIntoConstraints = false
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        reviewCount.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pairComponent)
        addSubview(ratingView)
        addSubview(reviewCount)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    private func setup() {
        
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
            
            pairComponent.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            pairComponent.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            pairComponent.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            ratingView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            ratingView.topAnchor.constraint(equalTo: pairComponent.bottomAnchor, constant: 24),
            ratingView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24),
            
           reviewCount.leadingAnchor.constraint(equalTo: ratingView.trailingAnchor, constant: 8),
           reviewCount.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor),
           reviewCount.widthAnchor.constraint(lessThanOrEqualToConstant: 150),
           reviewCount.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
            
            ])
        
    }
    
}
