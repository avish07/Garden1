//
//  CustomTextViewController.swift
//  GHTypography
//
//  Created by Shubham on 31/05/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

class CustomTextViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let textView = ReadMoreTextView()
        textView.center = self.view.center
        
        textView.text = "Lorem ipsum dolor ..."
        textView.shouldTrim = true
        textView.maximumNumberOfLines = 4
        textView.attributedReadMoreText = NSAttributedString(string: "... Read more")
        textView.attributedReadLessText = NSAttributedString(string: " Read less")
        self.view.addSubview(textView)
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
