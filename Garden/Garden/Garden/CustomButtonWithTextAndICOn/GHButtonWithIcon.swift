//
//  GHButtonWithIcon.swift
//  GHTypography
//
//  Created by Shubham on 17/05/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

@IBDesignable class GHButtonWithIcon: UIControl {
    
    var textButton: TextButtonBlack = TextButtonBlack()
    var iconImg:UIImageView   = UIImageView()
    
    @IBInspectable var text: String = "View all properties"   {
        
        didSet {
            populateControl()
        }
    }
    
    @IBInspectable var img: UIImage = UIImage(named: "go")!
        {
        didSet {
            populateControl()
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    // MARK: Custom Fuctions Creation
    func setUpView() {
        textButton.setTitle("View all properties", for: .normal)
        iconImg.image = UIImage(named: "go")
        self.addSubview(textButton)
        self.addSubview(iconImg)
        addConstraints()
    }
    
    func addConstraints() {
        
        iconImg.translatesAutoresizingMaskIntoConstraints = false
        textButton.translatesAutoresizingMaskIntoConstraints = false
        
        // constraints for Control
         NSLayoutConstraint.activate([self.widthAnchor.constraint(equalTo: textButton.widthAnchor, constant: 24),self.heightAnchor.constraint(equalTo: textButton.heightAnchor, constant: 0)])
        
        // Constraints for Icon Image
        NSLayoutConstraint.activate([textButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),textButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),iconImg.widthAnchor.constraint(equalToConstant: 16),iconImg.heightAnchor.constraint(equalToConstant: 16),iconImg.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),iconImg.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)])
    }
    
    func populateControl() {
        textButton.setTitle(text, for: .normal)
        iconImg.image = img
    }
}
