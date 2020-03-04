//
//  RatingView.swift
//  GHTypography
//
//  Created by Avish Manocha on 20/05/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

class RatingView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var ratingView: CosmosView!
    
    let ratingCount: GHLabel = {
        let label = GHLabel()
        label.isOpaque = true
        label.numberOfLines = 1
        let textStyle = TextStyles.body2Semibold
        textStyle.color = AppColors.textSecondary
        label.textStyle = textStyle
        return label
        
    }()
    
    private func setup() {
        ratingView = CosmosView()
        ratingView.fillMode = 1
        ratingView.starSize = 16
        ratingView.starMargin = 4
        ratingView.totalStars = 5
        ratingView.rating = 3.5
        ratingView.updateOnTouch = false
        ratingView.emptyImage = UIImage(named: "star_empty")
        ratingView.filledImage = UIImage(named: "star_filled")
        
    }
    
    init() {
        super.init(frame: .zero)
        setup()
        addSubview(ratingView)
        addSubview(ratingCount)
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
        addSubview(ratingView)
        addSubview(ratingCount)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
     //  self.backgroundColor = UIColor.green
        setConstraints()
    }
    
    private func setConstraints() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        ratingCount.translatesAutoresizingMaskIntoConstraints = false
        
        
        
//        if ratingCount.text == "" {
//            print("Done")
//        } else {
//            print("Where")
//        }
        
        NSLayoutConstraint.activate([
            
            self.widthAnchor.constraint(greaterThanOrEqualToConstant: 0),
            self.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
            
            ratingView.topAnchor.constraint(equalTo: self.topAnchor),
            ratingView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            ratingView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ratingView.widthAnchor.constraint(equalToConstant: 96),
            
            ratingCount.topAnchor.constraint(equalTo: self.topAnchor),
            ratingCount.leadingAnchor.constraint(equalTo: ratingView.trailingAnchor, constant: (ratingCount.text == "" ? 0 : 8)),
            ratingCount.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ratingCount.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            
            ])
        self.layoutIfNeeded()
    }

}
