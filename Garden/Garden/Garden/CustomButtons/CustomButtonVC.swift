//
//  CustomButtonVC.swift
//  GHTypography
//
//  Created by Avish Manocha on 17/05/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

final class CustomButtonVC: UIViewController {

    var mediumButton: Icon!
    var smallButton: Icon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        mediumButton = Icon(type: .small)
        
        mediumButton.setImage("checkBox") { (isTapped) -> Bool in
            print(isTapped)
            return isTapped
        }
        self.view.addSubview(mediumButton)
        
        smallButton = Icon(type: .medium)
        
        smallButton.setImage("small") { (isTApped) -> (Bool) in
            print(isTApped)
            return isTApped
        }
       // smallButton.setImage("check")
        self.view.addSubview(smallButton)
        
    }
    
    private func setConstraints() {
        
        mediumButton.translatesAutoresizingMaskIntoConstraints = false
        smallButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            mediumButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 70),
            mediumButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70),
            smallButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 170),
            smallButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 170)

            
            ])
        
        
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setConstraints()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
