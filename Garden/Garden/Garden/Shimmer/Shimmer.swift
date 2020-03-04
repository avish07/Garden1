//
//  Shimmer.swift
//  Animation
//
//  Created by Avish Manocha on 04/04/19.
//  Copyright © 2019 Avish Manocha. All rights reserved.
//

import UIKit

@IBDesignable
class Shimmer: UIView {

    var shimmerView: FBShimmeringView!
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setup()
        setConstraints()
       
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
      //  setConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
       setConstraints()
        
    }
    
    init() {
        super.init(frame: .zero)
        setup()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
    }
    
    
    let tailImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.clear
        image.contentMode = .scaleAspectFit
        return image
        
    }()
    
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.font = TextStyles.overlineSemibold.font
        lbl.lineBreakMode = .byCharWrapping
        return lbl
        
    }()
    
    /*
    let shimmerView: FBShimmeringView = {
        let view = FBShimmeringView()
        view.backgroundColor = UIColor.white
        view.isShimmering = true
        
        view.shimmeringPauseDuration = 0.1
        view.shimmeringAnimationOpacity = 0.5
        view.shimmeringOpacity = 1.0
        view.shimmeringSpeed = 100
        view.shimmeringHighlightLength = 1.0
        view.shimmeringDirection = .right
        
        view.clipsToBounds = true
        view.layer.cornerRadius = 2
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMinYCorner]
      
        
        return view
        
    }()
    */
    private func setup() {
      
            shimmerView = FBShimmeringView()
            shimmerView.backgroundColor = UIColor.white
            shimmerView.isShimmering = true
            
            shimmerView.shimmeringPauseDuration = 0.1
            shimmerView.shimmeringAnimationOpacity = 0.5
            shimmerView.shimmeringOpacity = 1.0
            shimmerView.shimmeringSpeed = 100
            shimmerView.shimmeringHighlightLength = 1.0
            shimmerView.shimmeringDirection = .right
            
            shimmerView.clipsToBounds = true
            shimmerView.layer.cornerRadius = 2
            shimmerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
    }
    
    private func setConstraints() {
        backgroundColor = UIColor.white
        addSubview(shimmerView)
        addSubview(tailImage)
        shimmerView.contentView = label
        shimmerView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        tailImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            shimmerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            shimmerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            shimmerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            shimmerView.bottomAnchor.constraint(equalTo: self.tailImage.topAnchor, constant: 0),

            shimmerView.widthAnchor.constraint(greaterThanOrEqualToConstant: 0),
            shimmerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
            
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            label.heightAnchor.constraint(equalToConstant: 20),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
            tailImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            tailImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            tailImage.widthAnchor.constraint(equalToConstant: 16),
            tailImage.heightAnchor.constraint(equalToConstant: 10)
            
                ])

    }
    
  
}





