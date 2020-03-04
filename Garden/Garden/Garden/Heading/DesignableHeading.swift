//
//  DesignableHeading.swift
//  SIngleLineComponent
//
//  Created by Avish Manocha on 22/03/19.
//  Copyright © 2019 Avish Manocha. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable
class DesignableHeading: UIView {
    
    var seperatorLine: SeperatorLine!
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        addSubview()
        setConstraint()
    }
    
    private func addSubview() {
        
        addSubview(headingLabel)
        addSubview(headingSublabel)
        addSubview(righAlignedLabel)
        
        seperatorLine = SeperatorLine()
        seperatorLine.seperatorColor = SeperatorLine.EnumSeperatorColor.dividerPrimary
       addSubview(seperatorLine)
     
        
    }
    
    init() {
        super.init(frame: .zero)
        addSubview()
        setConstraint()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setConstraint()
    }
    
    private func setConstraint() {
        
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        headingSublabel.translatesAutoresizingMaskIntoConstraints = false
        righAlignedLabel.translatesAutoresizingMaskIntoConstraints = false
        seperatorLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
        headingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: ControlConstraintsPadding.PositiveSideConstraints.value),
        headingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
        
        headingLabel.trailingAnchor.constraint(equalTo: righAlignedLabel.leadingAnchor, constant: ControlConstraintsPadding.SpacingBetweenControls.value),
        
        headingSublabel.leadingAnchor.constraint(equalTo: headingLabel.leadingAnchor),
        headingSublabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: ControlConstraintsPadding.verticalSpacingBetweenControls.value),
        headingSublabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
        headingSublabel.widthAnchor.constraint(equalTo: headingLabel.widthAnchor),
        
        righAlignedLabel.topAnchor.constraint(equalTo: headingLabel.topAnchor),
        righAlignedLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: ControlConstraintsPadding.NegativeSideConstraints.value),
        righAlignedLabel.heightAnchor.constraint(equalTo: headingLabel.heightAnchor),
        righAlignedLabel.leadingAnchor.constraint(equalTo: headingLabel.trailingAnchor, constant: -(ControlConstraintsPadding.SpacingBetweenControls.rawValue)),
        
            seperatorLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            seperatorLine.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            seperatorLine.heightAnchor.constraint(equalToConstant: 1),
            seperatorLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
            
            ])
        
    }
    
    
    let headingLabel: GHLabel = {
        let label = GHLabel()
        label.textColor = AppColors.textPrimary
       // label.layer.backgroundColor = UIColor.white.cgColor
        return label
        
    }()
    
    let headingSublabel: UILabel = {
        let label = UILabel()
       //label.backgroundColor = UIColor.blue
        label.textColor = AppColors.textSecondary
        //label.layer.backgroundColor = UIColor.white.cgColor
        return label
        
    }()
    
    
    let righAlignedLabel: UILabel = {
        let label = UILabel()
      //  label.text = ""
        label.textColor = AppColors.textSecondary
        label.textAlignment = .right
     //   label.layer.backgroundColor = UIColor.white.cgColor
        return label
        
    }()
    
}






