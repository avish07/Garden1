//
//  Message.swift
//  GHTypography
//
//  Created by Avish Manocha on 20/12/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

class Message: UIView {
    
    typealias viewParams = (title: String, subtitile: String, titleColor: UIColor, subtitleColor: UIColor,viewType: LabelPair, imageName: String, backgroundColor: UIColor, onTouch: tapClosure)
       
    typealias tapClosure = ((Bool) -> ())?
    private var refTapClosure: ((Bool) -> ())?
    
    private static let shared = Message()
    private var rightAlignImage: Icon!
    private var isImageThere: Bool = false
    private var pair: LabelPair!
    
    let messageToolbarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.tag = 1
        view.setViewAttributes(radiusType: .medium)
        
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        
        return view
        
    }()
    
    
    let dragViewIndicator: UIView = {
        let view = UIView()
        
        view.backgroundColor = AppColors.textWhite
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.cornerRadius = 2
        view.alpha = 0.3
        
        return view
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       
    }
    
    
    private func setup() {
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(hideMessageToolbarView))
        swipeGesture.direction = [.up]
        messageToolbarView.addGestureRecognizer(swipeGesture)
        
    }
    
    static func showMessageToolbar(viewParams: viewParams) {
        
        self.shared.setupView(with: viewParams)
    }
    
    
    func setupView(with viewParams: viewParams) {
        
        messageToolbarView.backgroundColor = viewParams.backgroundColor
        
        messageToolbarView.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        
        
        refTapClosure = viewParams.onTouch
        
        pair = nil
        pair = viewParams.viewType
        pair.subheading.numberOfLines = 2
        pair.translatesAutoresizingMaskIntoConstraints = false
       
        pair.heading.text = viewParams.title
        pair.heading.textColor = viewParams.titleColor
               
        pair.subheading.text = viewParams.subtitile
        pair.subheading.textColor = viewParams.subtitleColor
               
        messageToolbarView.addSubview(pair)
        
        isImageThere = !(viewParams.imageName.isEmpty)
        
        if isImageThere {
            
            rightAlignImage = Icon(type: .medium)
            rightAlignImage.setImage(viewParams.imageName) { [weak self] (tap) -> (Bool?) in
                
                guard let weakSelf = self else { return false }
                
               // if tap {
                    
                if let tapClosure = weakSelf.refTapClosure {
                    tapClosure(true)
                    return true
                }
                    
                    print("Do some action!")
                    
                //}
                return false
            }
            
            rightAlignImage.isUserInteractionEnabled = true
            
            rightAlignImage.translatesAutoresizingMaskIntoConstraints = false
            messageToolbarView.addSubview(rightAlignImage)
            
        }
        
        messageToolbarView.addSubview(dragViewIndicator)
        UIApplication.shared.keyWindow?.addSubview(messageToolbarView)
        setConstraints()
        showMessageToolbarView()
       
    }
    
    private func setConstraints() {
        
        let view = UIApplication.shared.visibleViewController?.view
        guard let currentView = view else {
            return
        }
        if isImageThere {
            NSLayoutConstraint.activate([
                
                
                messageToolbarView.topAnchor.constraint(equalTo: currentView.topAnchor, constant: -250),
                messageToolbarView.leadingAnchor.constraint(equalTo: currentView.leadingAnchor, constant: 8),
                messageToolbarView.trailingAnchor.constraint(equalTo: currentView.trailingAnchor, constant: -8),
                //statusVieww.heightAnchor.constraint(equalToConstant: 64),
                messageToolbarView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
                
                pair.topAnchor.constraint(equalTo: messageToolbarView.topAnchor, constant: 16),
                pair.leadingAnchor.constraint(equalTo: messageToolbarView.leadingAnchor, constant: 16),
                pair.bottomAnchor.constraint(equalTo: messageToolbarView.bottomAnchor, constant: -16),
                pair.trailingAnchor.constraint(equalTo: rightAlignImage.leadingAnchor, constant: -4),
                rightAlignImage.centerYAnchor.constraint(equalTo: messageToolbarView.centerYAnchor),
                rightAlignImage.trailingAnchor.constraint(equalTo: messageToolbarView.trailingAnchor, constant: -6),
                
                dragViewIndicator.centerXAnchor.constraint(equalTo: messageToolbarView.centerXAnchor),
                dragViewIndicator.widthAnchor.constraint(equalToConstant: 50),
                dragViewIndicator.heightAnchor.constraint(equalToConstant: 3),
                dragViewIndicator.bottomAnchor.constraint(equalTo: messageToolbarView.bottomAnchor, constant: -4)
                
                
            ])
        } else {
            NSLayoutConstraint.activate([
                
                messageToolbarView.topAnchor.constraint(equalTo: currentView.topAnchor, constant: -250),
                messageToolbarView.leadingAnchor.constraint(equalTo: currentView.leadingAnchor, constant: 8),
                messageToolbarView.trailingAnchor.constraint(equalTo: currentView.trailingAnchor, constant: -8),
                messageToolbarView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
                
                pair.topAnchor.constraint(equalTo: messageToolbarView.topAnchor, constant: 16),
                pair.leadingAnchor.constraint(equalTo: messageToolbarView.leadingAnchor, constant: 16),
                pair.bottomAnchor.constraint(equalTo: messageToolbarView.bottomAnchor, constant: -16),
                pair.trailingAnchor.constraint(equalTo: messageToolbarView.trailingAnchor, constant: -16),
                dragViewIndicator.centerXAnchor.constraint(equalTo: messageToolbarView.centerXAnchor),
                dragViewIndicator.widthAnchor.constraint(equalToConstant: 50),
                dragViewIndicator.heightAnchor.constraint(equalToConstant: 3),
                dragViewIndicator.bottomAnchor.constraint(equalTo: messageToolbarView.bottomAnchor, constant: -4)
                
            ])
        }
        
    }
    
    
    
    private func showMessageToolbarView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            UIView.animate(withDuration: 0.6, delay: 0.0, options: [.curveEaseInOut, .allowUserInteraction], animations: { [weak self] in
                
                guard let weakSelf = self else { return }
                weakSelf.messageToolbarView.frame.origin.y = 24
                
            }) { (_) in
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { [weak self] in
                    
                    guard let weakSelf = self else { return }
                    
                    weakSelf.hideMessageToolbarView()
                    
                    
                }
            }
        }
    }
    
    
    @objc private func hideMessageToolbarView() {
        
        
        if messageToolbarView.frame.origin.y < 0 {
            return
        }
        
        
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: [.curveEaseInOut, .allowUserInteraction], animations: { [weak self] in
            
            guard let weakSelf = self else { return }
            weakSelf.messageToolbarView.frame.origin.y = -(weakSelf.messageToolbarView.frame.height)
            
        }) { [weak self] (_) in
            
            guard let weakSelf = self else { return }
            
//            weakSelf.pair.titleLabel.text = ""
//            weakSelf.pair.subheading.text = ""
//
//            weakSelf.rightAlignImage?.setImage("")
            weakSelf.refTapClosure = nil
           
            UIApplication.shared.keyWindow?.subviews.forEach({ (view) in
                if view.tag == 1 {
                    view.removeFromSuperview()
                }
            })
            
        }
    }
    
}
