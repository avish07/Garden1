//
//  CustomNavigation.swift
//  GHTypography
//
//  Created by Avish Manocha on 16/05/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

public class CustomNavigation: UINavigationItem {

    public enum NavigationBarType {
        case noBarItem, OnlyLeftBarItem, onlyLeftBarTitle, leftAndOneRightBarItem, leftAndOneRightBarTitle, leftAndBothRightBarItem
    }
    
    // MARK: Handlers
   private typealias itemHandler = ((Bool) -> ())?
   private var leftItemHandler: ((Bool) -> ())?
   private var firstRightItemHandler: ((Bool) -> ())?
   private var secondRightItemHandler: ((Bool) -> ())?
    
    //MARK: Selectors
    private let leftItemSelector = #selector(pop)
    private let firstRightItemSelector = #selector(firstRIghtItemTapped)
    private let secondRightItemSelector = #selector(secondRIghtItemTapped)
    
   // Baritem Attributed title.
    
 
    override private init(title: String) {
      super.init(title: title)
    
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    
    public func setNavigationItemTitle(_ title: String, barType: NavigationBarType, letBarButtonItem leftImage: String? = nil, leftBarButtonItemColor: UIColor = AppColors.textWhite, firstRIghtButtonItem firstRightImage: String? = nil, secondRIghtButtonItem secondRightImage: String? = nil,  backItemHandler: ((Bool) -> ())?, rightMostItemHandler: ((Bool) -> ())?, rightItemHandler: ((Bool) -> ())?) {
        
        self.hidesBackButton = true
        let  containerView = UIView(frame: CGRect(x: 0, y: 0, width: (AppConstants.screenWidth - 28), height: AppConstants.navigationBarHeight))
       // containerView.backgroundColor = UIColor.gray
        containerView.isOpaque = true
        
        let navigationTitle = UILabel()
        navigationTitle.isOpaque = true
        navigationTitle.text = title
        navigationTitle.textColor = AppColors.textPrimary
        navigationTitle.font = Typography.bodyMedium.value
        navigationTitle.textAlignment = .center
        
        containerView.addSubview(navigationTitle)
        
        switch barType {
            
        case .noBarItem:
            navigationTitle.frame =   CGRect(x: AppConstants.navigationBarInterItemSpacing + AppConstants.navigationBarInterItemSpacing, y: 0, width: (containerView.frame.width -  (2 * AppConstants.navigationBarInterItemSpacing)), height: containerView.frame.height)
            
        case .OnlyLeftBarItem:
            let leftBarItem = self.addLeftBarItem(leftImage!, leftBarButtonItemColor, in: containerView, backItemHandler)
            let firstRightBarItem = self.addFirstRightBarItem("Demo", in: containerView, rightMostItemHandler, .onlyLeftBarTitle)
            
            navigationTitle.frame =   CGRect(x: leftBarItem.frame.width + AppConstants.navigationBarInterItemSpacing, y: 0, width: (containerView.frame.width - (leftBarItem.frame.width + 2 * AppConstants.navigationBarInterItemSpacing + firstRightBarItem.frame.width)), height: containerView.frame.height)
            
        case .onlyLeftBarTitle:
            let leftBarItem = self.addLeftBarTitle(leftImage!, in: containerView, backItemHandler)
            let firstRightBarItem = self.addFirstRightBarItem("Demo", in: containerView, rightMostItemHandler, .onlyLeftBarTitle)
            
            navigationTitle.frame =   CGRect(x: leftBarItem.frame.width + AppConstants.navigationBarInterItemSpacing, y: 0, width: (containerView.frame.width - (leftBarItem.frame.width + 2 * AppConstants.navigationBarInterItemSpacing + firstRightBarItem.frame.width)), height: containerView.frame.height)
            
            
        case .leftAndOneRightBarTitle:
            
           let leftBarItem = self.addLeftBarTitle(leftImage!, in: containerView, backItemHandler)
           let firstRightBarItem = self.addFIrstRightBarTitle(firstRightImage!, in: containerView, rightMostItemHandler)
            
            navigationTitle.frame =   CGRect(x: leftBarItem.frame.width + AppConstants.navigationBarInterItemSpacing, y: 0, width: (containerView.frame.width - (leftBarItem.frame.width + 2 * AppConstants.navigationBarInterItemSpacing + firstRightBarItem.frame.width)), height: containerView.frame.height)

            
        case .leftAndOneRightBarItem:
            
            let leftBarItem = self.addLeftBarItem(leftImage!, leftBarButtonItemColor, in: containerView, backItemHandler)
            let firstRightBarItem = self.addFirstRightBarItem(firstRightImage!, in: containerView, rightMostItemHandler, .leftAndOneRightBarItem)

            navigationTitle.frame =   CGRect(x: leftBarItem.frame.width + AppConstants.navigationBarInterItemSpacing, y: 0, width: (containerView.frame.width - (leftBarItem.frame.width + 2 * AppConstants.navigationBarInterItemSpacing + firstRightBarItem.frame.width)), height: containerView.frame.height)
            
        case .leftAndBothRightBarItem:
            
            let leftBarItem = self.addLeftBarItem(leftImage!, leftBarButtonItemColor, in: containerView, backItemHandler)
            let firstRightBarItem = self.addFirstRightBarItem(firstRightImage!, in: containerView, rightMostItemHandler, .leftAndBothRightBarItem)
            let secondRightBarItem = self.addSecondRightBarItem(secondRightImage!, in: containerView, rightItemHandler, firstRightBarItem)
           
           navigationTitle.frame =   CGRect(x: leftBarItem.frame.width + AppConstants.navigationBarInterItemSpacing, y: 0, width: (containerView.frame.width - (leftBarItem.frame.width + 3 * AppConstants.navigationBarInterItemSpacing + firstRightBarItem.frame.width + secondRightBarItem.frame.width)), height: containerView.frame.height)
        }
        
        self.titleView = containerView
        self.titleView?.frame.size.width = containerView.frame.width
        
    }
    
    
    private func addLeftBarTitle(_ leftTitle: String,in containerView: UIView, _ backItemHandler: itemHandler) -> UIButton {
       
        let textStyle = TextStyles.body2Semibold
        let width = leftTitle.width(withConstrainedHeight: AppConstants.buttonHeight, font: textStyle.font)
     
        let leftBarItem = UIButton(frame: CGRect(x: 0, y: 0, width: width, height: AppConstants.buttonHeight))
        
        let btnAttributedString = textStyle.applyToString(string: leftTitle)
        leftBarItem.setAttributedTitle(btnAttributedString, for: .normal)
        leftBarItem.titleEdgeInsets = UIEdgeInsets(top: AppConstants.buttonTextUpDownEdgeInsets, left: AppConstants.buttonTextSidingEdgeInsets, bottom: AppConstants.buttonTextUpDownEdgeInsets, right: AppConstants.buttonTextSidingEdgeInsets)
        leftBarItem.isOpaque = true
        containerView.addSubview(leftBarItem)
        leftBarItem.addTarget(self, action: leftItemSelector, for: .touchUpInside)
        leftItemHandler = backItemHandler
        return leftBarItem
        
    }
    
    private func addFIrstRightBarTitle(_ rightTitle: String,in containerView: UIView, _ backItemHandler: itemHandler) -> UIButton {
        
        let textStyle = TextStyles.body2Semibold
        let width = rightTitle.width(withConstrainedHeight: AppConstants.buttonHeight, font: textStyle.font)
        
        let firstRightBarItem = UIButton(frame: CGRect(x: containerView.frame.width - width, y: 0, width: width, height: AppConstants.buttonHeight))
        
        
        let btnAttributedString = textStyle.applyToString(string: rightTitle)
        firstRightBarItem.setAttributedTitle(btnAttributedString, for: .normal)
        
        firstRightBarItem.titleEdgeInsets = UIEdgeInsets(top: AppConstants.buttonTextUpDownEdgeInsets, left: AppConstants.buttonTextSidingEdgeInsets, bottom: AppConstants.buttonTextUpDownEdgeInsets, right: AppConstants.buttonTextSidingEdgeInsets)
        firstRightBarItem.isOpaque = true
        containerView.addSubview(firstRightBarItem)
        firstRightBarItem.addTarget(self, action: leftItemSelector, for: .touchUpInside)
        firstRightItemHandler = backItemHandler
        return firstRightBarItem
        
    }
    
    
    private func addLeftBarItem(_ leftImage: String,_ tintColor: UIColor, in containerView: UIView, _ backItemHandler: itemHandler) -> UIButton {
        let leftBarItem = UIButton(frame: CGRect(x: 0, y: 0, width: AppConstants.buttonWidth, height: AppConstants.buttonHeight))
        leftBarItem.setImage(UIImage(named: leftImage, in: Bundle(for: CustomNavigation.self), compatibleWith: nil)?.withRenderingMode(.alwaysTemplate), for: .normal)
            
        leftBarItem.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi)
        leftBarItem.tintColor = tintColor
        //  leftBarItem.setImage(UIImage(named: leftImage), for: .normal)
        leftBarItem.imageEdgeInsets = UIEdgeInsets(top: AppConstants.buttonEdgeInsets, left: AppConstants.buttonEdgeInsets, bottom: AppConstants.buttonEdgeInsets, right: AppConstants.buttonEdgeInsets)
        leftBarItem.isOpaque = true
        containerView.addSubview(leftBarItem)
        leftBarItem.addTarget(self, action: leftItemSelector, for: .touchUpInside)
        leftItemHandler = backItemHandler
        return leftBarItem
        
    }
    
    private func addFirstRightBarItem(_ rightImage: String,in containerView: UIView, _ rightMostItemHandler: itemHandler, _ buttonType: NavigationBarType) -> UIButton {
        let firstRightBarItem = UIButton(frame: CGRect(x: containerView.frame.width - AppConstants.buttonWidth, y: 0, width: AppConstants.buttonWidth, height: AppConstants.buttonHeight))
        
        switch buttonType {
        case .OnlyLeftBarItem:
             break
            
        case .leftAndOneRightBarItem, .leftAndBothRightBarItem:
           
            firstRightBarItem.setImage(UIImage(named: rightImage, in: Bundle(for: CustomNavigation.self), compatibleWith: nil), for: .normal)
               // firstRightBarItem.setImage(UIImage(named: rightImage), for: .normal)
                firstRightBarItem.imageEdgeInsets = UIEdgeInsets(top: AppConstants.buttonEdgeInsets, left: AppConstants.buttonEdgeInsets, bottom: AppConstants.buttonEdgeInsets, right: AppConstants.buttonEdgeInsets)
         
        default:
            break
        }
        
        
       containerView.addSubview(firstRightBarItem)
        firstRightBarItem.addTarget(self, action: firstRightItemSelector, for: .touchUpInside)
        firstRightItemHandler = rightMostItemHandler
        return firstRightBarItem
        
    }
    
    private func addSecondRightBarItem(_ secondRightImage: String,in containerView: UIView, _ rightItemHandler: itemHandler, _
        firstRightBarItem: UIButton) -> UIButton {
        let secondRightBarItem = UIButton(frame: CGRect(x: firstRightBarItem.frame.origin.x - (AppConstants.buttonWidth + AppConstants.navigationBarInterItemSpacing), y: 0, width: AppConstants.buttonWidth, height: AppConstants.buttonHeight))
        secondRightBarItem.setImage(UIImage(named: secondRightImage, in: Bundle(for: CustomNavigation.self), compatibleWith: nil), for: .normal)
                
       // secondRightBarItem.setImage(UIImage(named: secondRightImage), for: .normal)
        secondRightBarItem.imageEdgeInsets = UIEdgeInsets(top: AppConstants.buttonEdgeInsets, left: AppConstants.buttonEdgeInsets, bottom: AppConstants.buttonEdgeInsets, right: AppConstants.buttonEdgeInsets)
        containerView.addSubview(secondRightBarItem)
        secondRightBarItem.addTarget(self, action: secondRightItemSelector, for: .touchUpInside)
        secondRightItemHandler = rightItemHandler
        return secondRightBarItem
        
    }
    
    @objc private func pop() {
        
        if (leftItemHandler != nil) {
            leftItemHandler?(true)
        }
        print("Nothing")
    }
    
    @objc private func firstRIghtItemTapped() {
        
        if (firstRightItemHandler != nil) {
            firstRightItemHandler?(true)
        }
        print("Nothing1")
    }
    
    @objc private func secondRIghtItemTapped() {
        
        if (secondRightItemHandler != nil) {
            secondRightItemHandler?(true)
        }
        print("Nothing2")
    }
    
}












/*
    func abc1() {
        
        self.hidesBackButton = true
        //(frame: CGRect(x: 52, y: 0, width: 200, height: 44))
        let label = UILabel(frame: CGRect(x: 52, y: 0, width: 200, height: 44))
        label.isOpaque = true
        label.text = "Navigation "
        label.textColor = AppColors.textPrimary
        label.font = Typography.bodyMedium.value
        label.textAlignment = .center
        //frame: CGRect(x: 0, y: 0, width: 375, height: 44)
        let  containerView = UIView(frame: CGRect(x: 12, y: 0, width: 375, height: 44))
         containerView.backgroundColor = UIColor.gray
        containerView.isOpaque = true
        
        //frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        backButton.setImage(#imageLiteral(resourceName: "check"), for: .normal)
        backButton.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
        backButton.isOpaque = true
        
        //(frame: CGRect(x: 265, y: 0, width: 44, height: 44))
        let rightButton1 = UIButton(frame: CGRect(x: 265, y: 0, width: 44, height: 44))
        rightButton1.setImage(#imageLiteral(resourceName: "check"), for: .normal)
        // rightButton1.backgroundColor = UIColor.darkGray
        rightButton1.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
        
        //frame: CGRect(x: 317, y: 0, width: 44, height: 44)
        let rightButton2 = UIButton(frame: CGRect(x: 317, y: 0, width: 44, height: 44))
        rightButton2.setImage(#imageLiteral(resourceName: "check"), for: .normal)
        //   rightButton2.backgroundColor = UIColor.orange
        rightButton2.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
        
        containerView.addSubview(label)
        containerView.addSubview(backButton)
        backButton.addTarget(self, action: #selector(pop), for: .touchDown)
        containerView.addSubview(rightButton1)
        containerView.addSubview(rightButton2)
        
        self.titleView = containerView
        print(self.titleView?.frame)
        self.titleView?.frame.size.width = 347
       // self.titleView?.frame = CGRect(x: 20, y: 0, width: 347, height: 44)
        return
            
            containerView.translatesAutoresizingMaskIntoConstraints  = false
        label.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton1.translatesAutoresizingMaskIntoConstraints = false
        rightButton2.translatesAutoresizingMaskIntoConstraints = false
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0000000000000000000000001) {
            let currentView =  containerView.superview!
            NSLayoutConstraint.activate([
                
                containerView.topAnchor.constraint(equalTo: currentView.topAnchor),
                containerView.bottomAnchor.constraint(equalTo: currentView.bottomAnchor),
                
                containerView.leadingAnchor.constraint(equalTo: currentView.leadingAnchor),
                containerView.trailingAnchor.constraint(equalTo: currentView.trailingAnchor),
                
                backButton.leadingAnchor.constraint(equalTo: currentView.leadingAnchor, constant: 14),
                backButton.topAnchor.constraint(equalTo: currentView.topAnchor, constant: 0),
                backButton.bottomAnchor.constraint(equalTo: currentView.bottomAnchor),
                backButton.widthAnchor.constraint(equalToConstant: 44),
                
                
                rightButton2.trailingAnchor.constraint(equalTo: currentView.trailingAnchor, constant: -14),
                rightButton2.topAnchor.constraint(equalTo: currentView.topAnchor),
                rightButton2.bottomAnchor.constraint(equalTo: currentView.bottomAnchor),
                rightButton2.widthAnchor.constraint(equalToConstant: 44),
                
                rightButton1.trailingAnchor.constraint(equalTo: rightButton2.leadingAnchor, constant: -8),
                rightButton1.topAnchor.constraint(equalTo: currentView.topAnchor),
                rightButton1.bottomAnchor.constraint(equalTo: currentView.bottomAnchor),
                rightButton1.widthAnchor.constraint(equalToConstant: 44),
                
                
                label.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 8),
                label.topAnchor.constraint(equalTo: currentView.topAnchor),
                label.bottomAnchor.constraint(equalTo: currentView.bottomAnchor),
                label.trailingAnchor.constraint(equalTo: rightButton1.leadingAnchor, constant: -8),
                ])
            
        }
        
        
    }
 
    func abc(handler: @escaping (Bool) -> ()) {

        self.hidesBackButton = true
        //(frame: CGRect(x: 52, y: 0, width: 200, height: 44))
        let label = UILabel()
        label.isOpaque = true
        label.text = "Navigation "
        label.textColor = AppColors.textPrimary
        label.font = Typography.bodyMedium.value
        label.textAlignment = .center
        //frame: CGRect(x: 0, y: 0, width: 375, height: 44)
        let  containerView = UIView()
      // containerView.backgroundColor = UIColor.gray
        containerView.isOpaque = true

        //frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        let backButton = UIButton()
        backButton.setImage(#imageLiteral(resourceName: "check"), for: .normal)
        backButton.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
        backButton.isOpaque = true

        //(frame: CGRect(x: 265, y: 0, width: 44, height: 44))
        let rightButton1 = UIButton()
        rightButton1.setImage(#imageLiteral(resourceName: "check"), for: .normal)
       // rightButton1.backgroundColor = UIColor.darkGray
        rightButton1.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)

        //frame: CGRect(x: 317, y: 0, width: 44, height: 44)
        let rightButton2 = UIButton()
        rightButton2.setImage(#imageLiteral(resourceName: "check"), for: .normal)
     //   rightButton2.backgroundColor = UIColor.orange
        rightButton2.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)

        containerView.addSubview(label)
        containerView.addSubview(backButton)
        backButton.addTarget(self, action: #selector(pop), for: .touchDown)
        containerView.addSubview(rightButton1)
        containerView.addSubview(rightButton2)

        self.titleView = containerView
        self.titleView?.frame.size.width = 327
        self.titleView?.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints  = false
        label.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton1.translatesAutoresizingMaskIntoConstraints = false
        rightButton2.translatesAutoresizingMaskIntoConstraints = false


        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0000000000000000000000001) {
             let currentView =  containerView.superview!
            NSLayoutConstraint.activate([

                
                self.titleView!.leadingAnchor.constraint(equalTo: currentView.leadingAnchor, constant: 0),
                self.titleView!.topAnchor.constraint(equalTo: currentView.topAnchor),
                self.titleView!.bottomAnchor.constraint(equalTo: currentView.bottomAnchor),
                self.titleView!.trailingAnchor.constraint(equalTo: currentView.trailingAnchor),
                containerView.topAnchor.constraint(equalTo: currentView.topAnchor),
                containerView.bottomAnchor.constraint(equalTo: currentView.bottomAnchor),

                containerView.leadingAnchor.constraint(equalTo: currentView.leadingAnchor),
                 containerView.trailingAnchor.constraint(equalTo: currentView.trailingAnchor),

                 backButton.leadingAnchor.constraint(equalTo: currentView.leadingAnchor, constant: 14),
                 backButton.topAnchor.constraint(equalTo: currentView.topAnchor, constant: 0),
                 backButton.bottomAnchor.constraint(equalTo: currentView.bottomAnchor),
                 backButton.widthAnchor.constraint(equalToConstant: 44),


                 rightButton2.trailingAnchor.constraint(equalTo: currentView.trailingAnchor, constant: -14),
                 rightButton2.topAnchor.constraint(equalTo: currentView.topAnchor),
                 rightButton2.bottomAnchor.constraint(equalTo: currentView.bottomAnchor),
                 rightButton2.widthAnchor.constraint(equalToConstant: 44),

                 rightButton1.trailingAnchor.constraint(equalTo: rightButton2.leadingAnchor, constant: -8),
                 rightButton1.topAnchor.constraint(equalTo: currentView.topAnchor),
                 rightButton1.bottomAnchor.constraint(equalTo: currentView.bottomAnchor),
                 rightButton1.widthAnchor.constraint(equalToConstant: 44),


                 label.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 8),
                 label.topAnchor.constraint(equalTo: currentView.topAnchor),
                 label.bottomAnchor.constraint(equalTo: currentView.bottomAnchor),
                 label.trailingAnchor.constraint(equalTo: rightButton1.leadingAnchor, constant: -8),
             ])

        }

        backHandler = handler
       }

    func abc1() {

        self.hidesBackButton = true
        //
        let label = UILabel()
        label.isOpaque = true
        label.text = "Navigation bar"
        label.textColor = AppColors.textPrimary
        label.font = Typography.bodyMedium.value
        label.textAlignment = .center
        label.backgroundColor = UIColor.green
       // label.numberOfLines = 1
       // label.sizeToFit()
        //(frame: CGRect(x: 0, y: 0, width: 375, height: 44))
        let  containerView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 44))
        containerView.backgroundColor = UIColor.gray
        containerView.isOpaque = true

        let backButton = UIButton()
        backButton.setImage(#imageLiteral(resourceName: "check"), for: .normal)
        backButton.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
        backButton.isOpaque = true

        let rightButton1 = UIButton()
        rightButton1.setImage(#imageLiteral(resourceName: "check"), for: .normal)
        rightButton1.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)

        let rightButton2 = UIButton()
        rightButton2.setImage(#imageLiteral(resourceName: "check"), for: .normal)
        rightButton2.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)

        containerView.addSubview(label)
        containerView.addSubview(backButton)
        backButton.addTarget(self, action: #selector(pop), for: .touchDown)
        containerView.addSubview(rightButton1)
        containerView.addSubview(rightButton2)

        self.titleView = containerView
        self.titleView?.frame.size.width = 327
        containerView.translatesAutoresizingMaskIntoConstraints  = false
        label.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton1.translatesAutoresizingMaskIntoConstraints = false
        rightButton2.translatesAutoresizingMaskIntoConstraints = false

        let currentView =  containerView.superview!
//        let prio = rightButton2.trailingAnchor.constraint(equalTo: currentView.trailingAnchor, constant: -34)
//        prio.isActive = true
//        prio.priority = UILayoutPriority

    //  DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {

            NSLayoutConstraint.activate([
                containerView.topAnchor.constraint(equalTo: currentView.topAnchor),
                containerView.bottomAnchor.constraint(equalTo: currentView.bottomAnchor),

                containerView.leadingAnchor.constraint(equalTo: currentView.leadingAnchor),
                containerView.trailingAnchor.constraint(equalTo: currentView.trailingAnchor),


                backButton.leadingAnchor.constraint(equalTo: currentView.leadingAnchor, constant: 14),
                backButton.topAnchor.constraint(equalTo: currentView.topAnchor, constant: 0),
                backButton.heightAnchor.constraint(equalToConstant: 44),
               // backButton.bottomAnchor.constraint(equalTo: currentView.bottomAnchor),
                backButton.widthAnchor.constraint(equalToConstant: 44),


                rightButton2.trailingAnchor.constraint(equalTo: currentView.trailingAnchor, constant: -34),
                rightButton2.topAnchor.constraint(equalTo: currentView.topAnchor),
                rightButton2.heightAnchor.constraint(equalToConstant: 44),
                rightButton2.widthAnchor.constraint(equalToConstant: 44),

             //    rightButton1.leadingAnchor.constraint(greaterThanOrEqualTo: backButton.trailingAnchor, constant: 8),
                rightButton1.trailingAnchor.constraint(equalTo: rightButton2.leadingAnchor, constant: -8),
                rightButton1.topAnchor.constraint(equalTo: currentView.topAnchor),
                rightButton1.heightAnchor.constraint(equalToConstant: 44),
                rightButton1.widthAnchor.constraint(equalToConstant: 44),

                label.leadingAnchor.constraint(greaterThanOrEqualTo: backButton.trailingAnchor, constant: 24),
              //  label.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 8),
                label.topAnchor.constraint(equalTo: currentView.topAnchor),
               label.heightAnchor.constraint(equalToConstant: 44),
                label.trailingAnchor.constraint(lessThanOrEqualTo: rightButton1.leadingAnchor, constant: -8),

 ])

      //  }

    }


   */


