//

//  FilterTagComponent.swift
//  GHTypography
//
//  Created by Shubham on 15/05/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

class FilterTagComponent: BaseTagComponent {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    var iconView: UIView = UIView()
    let iconImgView: UIImageView = UIImageView(image: UIImage(named: "tagCross"))
    
    @IBInspectable var text:String = "Tag 1" {
        didSet {
            configureTag()
        }
    }
    
    override var isSelected:Bool {
        didSet {
            configureTag()
        }
    }
    
    func setSelected(selected:Bool) {
        isSelected = selected;
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    /// configuration of Basic Tag View
    func configureView() {
        
        iconView.addSubview(iconImgView)
        iconImgView.translatesAutoresizingMaskIntoConstraints = false
        // Configuring Color
        self.backgroundColor = AppColors.fillPrimary
        addSubview(iconView)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        // Adding Constraints
        NSLayoutConstraint.activate([textLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),self.widthAnchor.constraint(equalTo: self.textLbl.widthAnchor, multiplier: 1.0, constant: 32 + 16),self.heightAnchor.constraint(equalTo: self.textLbl.heightAnchor, multiplier: 1.0, constant: 16)])
        
        NSLayoutConstraint.activate([textLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),textLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),iconView.widthAnchor.constraint(equalToConstant: 32),iconView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 0),iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),iconView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),iconImgView.widthAnchor.constraint(equalToConstant: 12),iconImgView.heightAnchor.constraint(equalToConstant: 12),iconImgView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor, constant: 0),iconImgView.centerXAnchor.constraint(equalTo: iconView.centerXAnchor, constant: 0)])
        
        self.layer.cornerRadius = 4
        configureTag()
        addTapGesture()
    }
    
    func addTapGesture() {
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(removeFilter))
        iconView.addGestureRecognizer(tapGesture)
    }
    
    @objc func removeFilter() {
        
       self.removeFromSuperview()
        
    }
    
    
    
    
    /// Adding Target to Tag
    ///
    /// - Parameters:
    ///   - target: listner of Action
    ///   - action: Selector action to be triggered
    func addTarget(target: Any?, action: Selector?) {
        let gestureRecogniser = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(gestureRecogniser)
    }
    
    /// Managing Tag State
    func configureTag() {
        self.textLbl.text = text
        self.backgroundColor = AppColors.dividerPrimary
        self.layer.borderWidth = 0
        self.layer.borderColor  = UIColor.clear.cgColor
        let textStyle = self.textLbl.textStyle
        textStyle?.color = AppColors.textSecondary
        self.textLbl.textStyle = textStyle
    }
}
