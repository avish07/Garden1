//
//  CustomNavigationController.swift
//  GHTypography
//
//  Created by Avish Manocha on 15/05/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    /*
    let label: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 52, y: 0, width: 200, height: 44))
        lbl.isOpaque = true
        lbl.text = "Navigation bar"
        lbl.textColor = AppColors.textPrimary
        lbl.font = Typography.bodyMedium.value
        lbl.textAlignment = .center
        
        return lbl
        
    }()
    
    //
    let titleView: UIView = {
        let  view = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 44))
        view.backgroundColor = UIColor.gray
        view.isOpaque = true
        return view
        
    }()
    
    let backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.setImage(#imageLiteral(resourceName: "check"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
        button.isOpaque = true
        return button
    }()
    
    let rightButton1: UIButton = {
        let button = UIButton(frame: CGRect(x: 265, y: 0, width: 44, height: 44))
        button.setImage(#imageLiteral(resourceName: "check"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
        return button
    }()
    
    let rightButton2: UIButton = {
        let button = UIButton(frame: CGRect(x: 317, y: 0, width: 44, height: 44))
        button.setImage(#imageLiteral(resourceName: "check"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
        
        return button
    }()
    */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // navigationBar.barTintColor = UIColor.green
       // navigationBar.tintColor = UIColor.white
        navigationItem.hidesBackButton = true
        let label = UILabel(frame: CGRect(x: 52, y: 0, width: 200, height: 44))
        label.isOpaque = true
        label.text = "Navigation bar"
        label.textColor = AppColors.textPrimary
        label.font = Typography.bodyMedium.value
        label.textAlignment = .center
        
        let  titleView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 44))
       // titleView.backgroundColor = UIColor.gray
        titleView.isOpaque = true
        
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        backButton.setImage(#imageLiteral(resourceName: "check"), for: .normal)
        backButton.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
        backButton.isOpaque = true
        
        let rightButton1 = UIButton(frame: CGRect(x: 265, y: 0, width: 44, height: 44))
        rightButton1.setImage(#imageLiteral(resourceName: "check"), for: .normal)
        rightButton1.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
        
        let rightButton2 = UIButton(frame: CGRect(x: 317, y: 0, width: 44, height: 44))
        rightButton2.setImage(#imageLiteral(resourceName: "check"), for: .normal)
        rightButton2.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
        
        
        titleView.addSubview(label)
        titleView.addSubview(backButton)
        backButton.addTarget(self, action: #selector(pop), for: .touchUpInside)
        titleView.addSubview(rightButton1)
        titleView.addSubview(rightButton2)
        
      //   self.visibleViewController?.navigationItem.titleView = titleView
      //  self.visibleViewController?.navigationItem.titleView?.backgroundColor = UIColor.green
     }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print(self.visibleViewController?.navigationItem.titleView)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
      func settt() {
    
        CustomNavigationController().well()
    }
    
    @objc func pop() {
        
        self.visibleViewController?.navigationController?.popViewController(animated: true)
        
    }
    
    
    func well() {
        navigationItem.hidesBackButton = true
        
        let label = UILabel(frame: CGRect(x: 52, y: 0, width: 200, height: 44))
        label.isOpaque = true
        label.text = "Navigation bar"
        label.textColor = AppColors.textPrimary
        label.font = Typography.bodyMedium.value
        label.textAlignment = .center
        
        let  titleView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 44))
        // titleView.backgroundColor = UIColor.gray
        titleView.isOpaque = true
        
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        backButton.setImage(#imageLiteral(resourceName: "check"), for: .normal)
        backButton.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
        backButton.isOpaque = true
        
        let rightButton1 = UIButton(frame: CGRect(x: 265, y: 0, width: 44, height: 44))
        rightButton1.setImage(#imageLiteral(resourceName: "check"), for: .normal)
        rightButton1.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
        
        let rightButton2 = UIButton(frame: CGRect(x: 317, y: 0, width: 44, height: 44))
        rightButton2.setImage(#imageLiteral(resourceName: "check"), for: .normal)
        rightButton2.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
        
        
        titleView.addSubview(label)
        titleView.addSubview(backButton)
        backButton.addTarget(self, action: #selector(pop), for: .touchUpInside)
        titleView.addSubview(rightButton1)
        titleView.addSubview(rightButton2)
        
      //  self.visibleViewController?.navigationItem.titleView = titleView
        print(self.visibleViewController)
        print(self.viewControllers)
         print(self.visibleViewController)
      //  self.viewDidLoad()
        return
//        titleView.addSubview(label)
//        titleView.addSubview(backButton)
//        titleView.addSubview(rightButton1)
//        titleView.addSubview(rightButton2)
        
        print(self.visibleViewController?.navigationItem.titleView)
        print(self.viewControllers)
        print(self.visibleViewController)
     //   self.visibleViewController?.navigationItem.titleView = titleView

    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//
//        print(self.visibleViewController?.view!.topAnchor)
//        titleView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//
//            titleView.topAnchor.constraint(equalTo: (self.visibleViewController?.view!.topAnchor)!, constant: -20),
//
//            titleView.leadingAnchor.constraint(equalTo: (self.visibleViewController?.view!.leadingAnchor)!, constant: -100),
//
//            titleView.trailingAnchor.constraint(equalTo: (self.visibleViewController?.view!.trailingAnchor)!, constant: 0),
//
//
//            titleView.heightAnchor.constraint(equalToConstant: 44)
//
//
//
//            ])
//
//    }
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//         navigationBar.barTintColor = UIColor.green
//        navigationBar.tintColor = UIColor.white
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
//
//        self.navigationItem.title = "asksajkajsksjkjs"
//        return
//        navigationBar.isHidden = false
//       // navigationBar.frame.size.height = 100
//        navigationBar.barTintColor = UIColor.green
//        titleView.addSubview(label)
//        navigationItem.titleView = titleView
//        //navigationItem.titleView?.backgroundColor = UIColor.orange
//        navigationItem.titleView?.frame =  CGRect(x: 0, y: 0, width: 375, height: 44)
//       // navigationItem.title = "ssdsdsd"
////        navigationBar.isHidden = false
//
//
////
////        let color = UIColor(red: 81 / 255, green: 155 / 255, blue: 22 / 255, alpha: 1.0)
//
////        let image = UIImage(named: "logo")
////        let imageView = UIImageView(image: image)
////        imageView.contentMode = .scaleAspectFit
////        navigationItem.titleView = imageView
//    }
    
    private func imageView(imageName: String) -> UIImageView {
        let logo = UIImage(named: imageName)
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = logo
        logoImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return logoImageView
    }
    
    func barImageView(imageName: String) -> UIBarButtonItem {
        return UIBarButtonItem(customView: imageView(imageName: imageName))
    }
    
    func barButton(imageName: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.addTarget(self, action: selector, for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }


}
