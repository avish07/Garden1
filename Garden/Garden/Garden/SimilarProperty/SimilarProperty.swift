//
//  SimilarProperty.swift
//  GHTypography
//
//  Created by Avish Manocha on 03/06/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

final class SimilarProperty: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var pairComponent: LabelPair!
    var ratingView: RatingView!
    
    let propertyImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 4
        image.clipsToBounds = true
        image.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        image.backgroundColor = UIColor.white
        image.image = #imageLiteral(resourceName: "3")
        return image
        
    }()
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setViewAttributes(radiusType: .small, isShadowRequired: true)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = AppColors.fillSecondary
        pairComponent = LabelPair(type: .small, numberofLines: 2)
        ratingView = RatingView()
       
        propertyImage.translatesAutoresizingMaskIntoConstraints = false
        pairComponent.translatesAutoresizingMaskIntoConstraints = false
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(propertyImage)
        addSubview(pairComponent)
        addSubview(ratingView)
        propertyImage.backgroundColor = UIColor.blue
       setConstraints()
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        setConstraints()
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)

        self.setViewAttributes(radiusType: .small, isShadowRequired: true)
        self.translatesAutoresizingMaskIntoConstraints = false
        pairComponent = LabelPair(type: .medium, numberofLines: 1)
        ratingView = RatingView()
        propertyImage.translatesAutoresizingMaskIntoConstraints = false
        pairComponent.translatesAutoresizingMaskIntoConstraints = false
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(propertyImage)
        addSubview(pairComponent)
        addSubview(ratingView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            propertyImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            propertyImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            propertyImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            propertyImage.heightAnchor.constraint(equalToConstant: 140),
            
            pairComponent.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            pairComponent.topAnchor.constraint(equalTo: propertyImage.bottomAnchor, constant: 16),
            pairComponent.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            ratingView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            ratingView.topAnchor.constraint(equalTo: pairComponent.bottomAnchor, constant: 12),
            ratingView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
 
            ])
    }
    
}

