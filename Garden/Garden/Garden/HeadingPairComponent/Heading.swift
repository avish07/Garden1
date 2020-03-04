//
//  singleLineImageComponent.swift
//  GHTypography
//
//  Created by Avish Manocha on 20/05/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

public class Heading: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    public var pair: LabelPair!
  
    
    let  righAlignedLabel: GHLabel = {
        let label = GHLabel()
        let textStyle = TextStyles.miniSemibold
        textStyle.color = AppColors.textSupporter
        label.textStyle = textStyle
        label.textAlignment = .right
        label.backgroundColor = UIColor.gray
        return label
        
    }()
    
    
   public init(componentType: Heading.HeadingPairComponentType, pairSpacingType: LabelPair.PairComponentType, numberofLines: Int = 1) {
       super.init(frame: .zero)
       
        switch componentType {
        case .Body1Caption:
            pair = Body1Caption(type: pairSpacingType, numberofLines: numberofLines)
        
        case .H2Body2:
            pair = H2Body2(type: pairSpacingType, numberofLines: numberofLines)
            
        case .Body2Mini:
            pair = Body2Mini(type: pairSpacingType, numberofLines: numberofLines)
            
        case .Body2Body1:
            pair = Body2Body1(type: pairSpacingType, numberofLines: numberofLines)
            
        case .H1Body1:
            pair = H1Body1(type: pairSpacingType, numberofLines: numberofLines)
            
        case .subtitleCaption:
            pair = subtitleCaption(type: pairSpacingType, numberofLines: numberofLines)
      
        }
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

       
    }
    

    override public func awakeFromNib() {
        super.awakeFromNib()
        
        setConstraints()
    }
    

    func setConstraints() {
        
        addSubview(pair)
        addSubview(righAlignedLabel)
        
        pair.translatesAutoresizingMaskIntoConstraints  = false
        righAlignedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        pair.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
        pair.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
        pair.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
        pair.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
        
        //pair.trailingAnchor.constraint(equalTo: righAlignedLabel.leadingAnchor, constant: (righAlignedLabel.text?.isEmpty ?? true) ? -24 : -16),
        
       // pair.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
        
//        righAlignedLabel.topAnchor.constraint(equalTo: pair.heading.topAnchor,constant: 5),
//        righAlignedLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
//        righAlignedLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
//        righAlignedLabel.leadingAnchor.constraint(equalTo: pair.trailingAnchor, constant: 16)
     ])
        
        
    }
    
}

public extension Heading {
    
    
    enum HeadingPairComponentType {
        case H1Body1, H2Body2, Body2Body1, Body2Mini, subtitleCaption, Body1Caption
    }
    
    
}
