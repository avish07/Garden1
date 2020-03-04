//
//  LabelPair.swift
//  GHTypography
//
//  Created by Avish Manocha on 19/05/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

public class LabelPair: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    
    public let heading: GHLabel = {
        let label = GHLabel()
        label.numberOfLines = 2
        return label
        
    }()
    
    
    public let subheading: GHLabel = {
        let label = GHLabel()
        label.numberOfLines = 0
        return label
        
    }()
    
    public enum PairComponentType {

        case small, medium
    }
    
    var typee: PairComponentType!
    private(set) var size: CGFloat!
    
    
    var headingLines: Int = 2 {
        
        didSet {
            heading.numberOfLines = headingLines > 2 ? 2 : headingLines
        }
    }
    
    
    init(type: PairComponentType = .medium, numberofLines: Int = 2) {
        super.init(frame: .zero)
        self.typee = type
         heading.numberOfLines = numberofLines
        
        switch self.typee {
        case .small?:
            size = 2
        case .medium?:
            size = 4
            
        case .none:
            size = 2
        }
        
        addSubview(heading)
        addSubview(subheading)
        setConstraints()
     
    }

 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    private func setConstraints() {
        
        heading.translatesAutoresizingMaskIntoConstraints = false
        subheading.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
            
            heading.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            heading.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            heading.bottomAnchor.constraint(equalTo: subheading.topAnchor, constant: -size),

            heading.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            subheading.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subheading.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: size),
            subheading.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            subheading.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            ])
        
    }
}


/*
    override init(frame: CGRect) {
        super.init(frame: frame)
        print(sizeee)
        self.backgroundColor = UIColor.green
        sizeee = 0
          print(sizeee)
        setConstraints()
    }
func setComponent(_ type: PairComponentType = .small) {
    self.typee = .small
    switch self.typee {
    case .small?:
        sizeee = 4
    case .medium?:
        sizeee = 8

    case .none:
        sizeee = 4
    }
    self.backgroundColor = UIColor.green

}
*/
