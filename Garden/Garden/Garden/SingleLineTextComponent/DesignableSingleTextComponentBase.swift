//
//  DesignableSingleTextComponentBase.swift
//  SIngleLineComponent
//
//  Created by Avish Manocha on 18/03/19.
//  Copyright © 2019 Avish Manocha. All rights reserved.
//

import Foundation
import UIKit





enum TextFieldHeight: CGFloat {
    case Large = 64
    case Small = 60
}



@IBDesignable
class DesignableSingleTextComponentBase: UIView {

    var seperatorLine: SeperatorLine!
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setConstraint()
        
    }
    
    private func setConstraint() {
        
        self.layer.backgroundColor = UIColor.white.cgColor
        addControls()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        seperatorLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: ControlConstraintsPadding.PositiveSideConstraints.value),
         
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -18),
            
        //    label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
           seperatorLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
           seperatorLine.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
           seperatorLine.heightAnchor.constraint(equalToConstant: 1),
           seperatorLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
            
            ])
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setConstraint()
    }

    private func addControls() {
        addSubview(label)
        seperatorLine = SeperatorLine()
        addSubview(seperatorLine)
        
        seperatorLine.seperatorColor = SeperatorLine.EnumSeperatorColor(rawValue: 0)!
    }
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.layer.backgroundColor = UIColor.white.cgColor
        return lbl
        
    }()
    
}











