//
//  singleLineImageComponent.swift
//  GHTypography
//
//  Created by Avish Manocha on 20/05/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

public class Denoter: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    public var pair: LabelPair!
    public var image: Icon!
    var isSubTitleRequired: Bool = true
    var isImageLeftAlign: Bool = true
    var isImageCenterAlign: Bool = false
    
    func setup() {

        pair = H2Body2(type: .small, numberofLines: 2)
        image = Icon(type: .medium)
        
    }
    
    public init(componentType: Denoter.SingleLineImageComponentType ,imageType: Icon.CustomIconButtonType, pairSpacingType: LabelPair.PairComponentType, numberofLines: Int = 2, isImageLeftAlign: Bool = true, isImageCenterAlign: Bool = false) {
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
        
        image = Icon(type: imageType)
        self.isImageLeftAlign = isImageLeftAlign
        self.isImageCenterAlign = isImageCenterAlign
      //  setup()
        setConstraints()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    

    override public func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
        setConstraints()
    }
    

    func setConstraints() {
        
        addSubview(image)
        addSubview(pair)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        pair.translatesAutoresizingMaskIntoConstraints  = false
        
        if isImageLeftAlign {
          
            NSLayoutConstraint.activate([
                
                pair.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                pair.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
                pair.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
                pair.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
                
                image.centerYAnchor.constraint(equalTo: isImageCenterAlign ? self.centerYAnchor : pair.heading.centerYAnchor),
                image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
                
                ])
        } else {
            
            NSLayoutConstraint.activate([
                
                pair.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                pair.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
                pair.trailingAnchor.constraint(equalTo: image.leadingAnchor, constant: -16),
                pair.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
                
                image.centerYAnchor.constraint(equalTo: isImageCenterAlign ? self.centerYAnchor : pair.heading.centerYAnchor),
                
                image.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
                
                ])
        }
        
     
        
        
    }
    
}

public extension Denoter {
    
    
    enum SingleLineImageComponentType {
        case H1Body1, H2Body2, Body2Body1, Body2Mini, subtitleCaption, Body1Caption
    }
    
    
}
