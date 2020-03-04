//
//  SearchTextfield.swift
//  GHTypography
//
//  Created by Avish Manocha on 27/03/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import Foundation
import UIKit


public protocol SearchTappedDelegate: class {
    var isCancelTapped: Bool { get set }
    
}

@IBDesignable
public class DesignableSearch: UIView {
    
    var layoutTapped: Bool = false
    var containerConstraint: NSLayoutConstraint!
    var searchConstraint: NSLayoutConstraint!
    var cancelConstraint: NSLayoutConstraint!
    
    public weak var delegate: SearchTappedDelegate?
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        addSubview()
        setConstraint()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.backgroundColor = AppColors.applicationBackground.cgColor
        addSubview()
        
    }
    
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview()
        setConstraint()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        if !layoutTapped {
            setConstraint()
            
        }
        
    }
    
    
    
    private func addSubview() {
        addSubview(containerView)
        addSubview(containerMaskView)
        addSubview(cancelButton)
        containerView.addSubview(searchImageView)
        containerView.addSubview(searchTextfield)
        containerView.addSubview(searchButton)
        
    }
    
    private func setConstraint() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        searchImageView.translatesAutoresizingMaskIntoConstraints = false
        searchTextfield.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        containerMaskView.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        containerConstraint =  containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
        containerConstraint.isActive = true
        
        cancelConstraint =  cancelButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 80)
        cancelConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            
            // self.heightAnchor.constraint(equalToConstant: 64),
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            
            searchImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            searchImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            //searchImageView.widthAnchor.constraint(equalToConstant: 24),
            //searchImageView.heightAnchor.constraint(equalToConstant: 24),
            
            searchTextfield.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            searchTextfield.heightAnchor.constraint(equalToConstant: 20),
            searchTextfield.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            searchButton.topAnchor.constraint(equalTo: containerView.topAnchor),
            searchButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            searchButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            searchButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            containerMaskView.topAnchor.constraint(equalTo: containerView.topAnchor),
            containerMaskView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            containerMaskView.trailingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -2),
            containerMaskView.heightAnchor.constraint(equalTo: containerView.heightAnchor),
            
            cancelButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cancelButton.heightAnchor.constraint(equalTo: containerView.heightAnchor),
            cancelButton.widthAnchor.constraint(equalToConstant: 48)
            
            
            ])
        
    }
    
    
    let containerView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = AppColors.applicationBackgroundSecondary.cgColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 0.0
        view.layer.borderColor = UIColor(r: 237, g: 237, b: 237, alpha: 1.0).cgColor
        view.layer.shadowColor = UIColor(r: 223, g: 223, b: 223, alpha: 1.0).cgColor
        view.layer.shadowOpacity = 0.15
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 16
        view.layer.masksToBounds = false
        return view
        
    }()
    
    
    let searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image =  UIImage(named: "search", in: Bundle(for: DesignableSearch.self), compatibleWith: nil)
              
        return imageView
        
    }()
    
    public let searchTextfield: UITextField = {
        let textField = UITextField()
        
        let placeHolderAttributed: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: AppColors.textPlaceholder, NSAttributedString.Key.font: Typography.body2Medium.value]
        
        textField.attributedPlaceholder = NSAttributedString(string: ControlsText.searchPlaceholder.rawValue, attributes: placeHolderAttributed)
        textField.borderStyle = .bezel
       // textField.backgroundColor = AppColors.applicationBackground
        textField.tintColor = AppColors.fillPrimary 
        textField.returnKeyType = .search
        textField.textColor = AppColors.textPrimary
        textField.font = Typography.body2Medium.value
       // textField.clearButtonMode = .whileEditing
        textField.borderStyle = .none
        return textField
        
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
        return button
        
    }()
    
    let containerMaskView: UIView = {
        let view = UIView()
      //  view.layer.backgroundColor = AppColors.applicationBackground.cgColor
        return view
        
    }()
    
    let cancelButton: UIButton = {
            let button = UIButton()
            let textStyle = TextStyles.body1Medium;
        
            textStyle.applyToString(string: "eferfr")
    
       
        
        
    
        // button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        button.contentHorizontalAlignment = .right
        let buttonAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: Typography.body2Medium.value, NSAttributedString.Key.foregroundColor: AppColors.textPrimary]
        button.setAttributedTitle(NSAttributedString(string: ControlsText.cancel.rawValue, attributes: buttonAttribute), for: .normal)
        return button
        
    }()
    
    @objc func searchTapped() {
        
        layoutTapped = true
        searchTextfield.becomeFirstResponder()
        //   searchButton.isUserInteractionEnabled = false
        // searchButton.isHidden = true
        searchButton.isEnabled = false
        
        containerConstraint.isActive = false
        cancelConstraint.isActive = false
        searchConstraint.isActive = false
        
        containerConstraint = containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -78)
        
        searchConstraint =  searchTextfield.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16)
        
        cancelConstraint = cancelButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
        
        containerConstraint.isActive = true
        cancelConstraint.isActive = true
        searchConstraint.isActive = true
        
       
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.layoutIfNeeded()
            
            self.searchImageView.frame.origin.x
                = -40
            self.searchImageView.alpha = 0.0
            self.cancelButton.alpha = 1.0
        }, completion: nil)
        
        
    }
    
    @objc func cancelTapped() {
        
        
        searchTextfield.resignFirstResponder()
        searchButton.isEnabled = true
        containerConstraint.isActive = false
        cancelConstraint.isActive = false
        searchConstraint.isActive = false
        
        
        containerConstraint =  containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
        containerConstraint.isActive = true
        
        searchConstraint =  searchTextfield.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: searchImageView.bounds.size.width + 20)
        searchConstraint.isActive = true
        
        cancelConstraint =  cancelButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 80)
        cancelConstraint.isActive = true
        
         delegate?.isCancelTapped = true
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            
            
            self.layoutIfNeeded()
            
            self.searchImageView.frame.origin.x
                = 16
            self.searchImageView.alpha = 1.0
            self.cancelButton.alpha = 0.0
        }, completion: nil)
        
        
    }
}






