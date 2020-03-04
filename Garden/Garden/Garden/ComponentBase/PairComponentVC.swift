//
//  PairComponentVC.swift
//  GHTypography
//
//  Created by Avish Manocha on 19/05/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

class PairComponentVC: UIViewController {

    var pair: LabelPair!
    var pair1: LabelPair!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pair = LabelPair(type: .medium)

        let pairTitleTextStyle = TextStyles.h2Regular
        pairTitleTextStyle.color = AppColors.textPrimary
        pair.heading.attributedText = pairTitleTextStyle.applyToString(string: "Heading Heading Heading Heading Heading Heading HeadingHeadingHeading")
        let pairsubTitleTextStyle = TextStyles.body2Medium
        pairsubTitleTextStyle.color = AppColors.textSupporter
        pair.subheading.attributedText = pairsubTitleTextStyle.applyToString(string: "Sub-headig subbbbb")
        self.view.addSubview(pair)
        
        pair1 = LabelPair(type: .small)
        let pair1TitleTextStyle = TextStyles.h2Regular
        pair1TitleTextStyle.color = AppColors.textPrimary
        pair1.heading.attributedText = pair1TitleTextStyle.applyToString(string: "Heading")
        let pair1subTitleTextStyle = TextStyles.body2Medium
        pair1subTitleTextStyle.color = AppColors.textSupporter
        pair1.subheading.attributedText = pair1subTitleTextStyle.applyToString(string: "Sub-headingggg")
        self.view.addSubview(pair1)

    }
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        pair.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            pair.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 70),
            pair.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 170),
            
            
            pair1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 70),
            pair1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 270)
            ])
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
