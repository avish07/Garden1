//
//  ReviewUser.swift
//  GHTypography
//
//  Created by Avish Manocha on 06/06/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

public class HostedBy: UIView {
    
    var shimmer: ProperlyShimmer!
    var userImage: Icon!
    var pairComponent: LabelPair!
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
    }
    
   public override func awakeFromNib() {
        super.awakeFromNib()
        
        userImage = Icon(type: .medium)
        
        
        userImage.setImage("you") { (isTapp) -> (Bool?) in
            print(isTapp)
            return nil
        }
        userImage.setViewAttributes(radiusType: .small, borderWidth: 0.5)
        userImage.layer.cornerRadius = 22
       
        pairComponent = LabelPair(type: .small, numberofLines: 1)
       
       
        self.translatesAutoresizingMaskIntoConstraints = false
        userImage.translatesAutoresizingMaskIntoConstraints = false
        pairComponent.translatesAutoresizingMaskIntoConstraints = false
       
        addSubview(userImage)
        addSubview(pairComponent)
        
    }
    
    func addShimmer() {
        
         shimmer = ProperlyShimmer()
         shimmer.translatesAutoresizingMaskIntoConstraints = false
        addSubview(shimmer)
        
        NSLayoutConstraint.activate([
                
                shimmer.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                shimmer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 103),
                
        ])
            
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        userImage = Icon(type: .medium)
        pairComponent = LabelPair(type: .medium, numberofLines: 1)
    
        self.translatesAutoresizingMaskIntoConstraints = false
        userImage.translatesAutoresizingMaskIntoConstraints = false
        pairComponent.translatesAutoresizingMaskIntoConstraints = false
    
        addSubview(userImage)
        addSubview(pairComponent)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
   public override func layoutSubviews() {
        super.layoutSubviews()
        
        setConstraints()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            userImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            userImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            pairComponent.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            pairComponent.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            pairComponent.trailingAnchor.constraint(equalTo: userImage.leadingAnchor, constant: -16)
            ])
        
    }
    
}

