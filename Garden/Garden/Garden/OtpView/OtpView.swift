//
//  OtpView.swift
//  GHTypography
//
//  Created by Avish Manocha on 20/12/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

//public protocol FloatingButtonDelegate: AnyObject {
//    func floatingButtonTapped()
//}
//
//extension FloatingButtonDelegate {
//  
//    func floatingButtonTapped() {
//        
//        
//    }
//}

public class OtpView: UIStackView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
   // public var floatingButton: ButtonWithIcon!
    
   // public var floatingDelegate: FloatingButtonDelegate?
    
//    private var keyboardInputAccessoryView: UIView = {
//        let keyboardInputAccessoryView = UIView(frame: CGRect(x: 0, y: 0, width: AppConstants.screenWidth, height: 100))
//        return keyboardInputAccessoryView
//
//    }()
    
   
    
    let otpStackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
        
    }()
    
    let randowSubview: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    
    let otpView1: UIView = {
        let view = UIView()
        
        // view.backgroundColor = UIColor.darkGray
       // view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
        
    }()
    
    let otpView2: UIView = {
        let view = UIView()
        
       // view.backgroundColor = UIColor.green
      //  view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
        
    }()

    let otpView3: UIView = {
        let view = UIView()
        
       // view.backgroundColor = UIColor.blue
       // view.translatesAutoresizingMaskIntoConstraints = false
       
        return view
        
        
    }()
    
    let otpView4: UIView = {
        let view = UIView()
        
//view.backgroundColor = UIColor.purple
       // view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
        
    }()

    
    public let textfield1: SmartTextfield = {
       let textField = SmartTextfield()
        textField.tag = 1
        return textField
        
    }()
    
    let textfield2: SmartTextfield = {
           let textField = SmartTextfield()
           textField.tag = 2
           return textField
        
    }()
    
    
    let textfield3: SmartTextfield = {
       let textField = SmartTextfield()
       textField.tag = 3
       return textField
        
    }()

    let textfield4: SmartTextfield = {
       let textField = SmartTextfield()
       textField.tag = 4
       return textField
    
    }()

    
    let errorLabel: GHLabel = {
        let label = GHLabel()
        label.text = "Wrong OTP, Try Again!"
        
        label.alpha = 0.0
       
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let textStyle = TextStyles.captionSemibold
        textStyle.color = AppColors.fillRed
        label.textStyle = textStyle

        label.textAlignment = .center
        return label
    
    }()
    
    
    private func updateTextfieldAttributes() {
        
//        floatingButton = ButtonWithIcon(imageName: "checkBox", actionHandler: { [weak self] (isTapped) -> (Bool?) in
//
//                  guard let self = self else { return false }
//
//                   if isTapped {
////                    self.floatingDelegate?.floatingButtonTapped()
//                   }
//                   return false
//            })
        
        for i in 1...4 {
            
            let textField = self.viewWithTag(i) as! SmartTextfield
            textField.backgroundColor = AppColors.applicationBackground
            textField.textAlignment = .center
            textField.translatesAutoresizingMaskIntoConstraints = false
           // textField.keyboardAppearance = .dark
            
           // textField.layer.cornerRadius = 4
            textField.setViewAttributes(radiusType: .small, borderWidth: 1, isShadowRequired: false)
            textField.layer.borderColor = AppColors.outlineSecondary.cgColor
            textField.keyboardType = .numberPad
            
            let textStyle = TextStyles.h1Medium
            textStyle.color = AppColors.textPrimary
            textField.font = textStyle.font
            textField.textColor = textStyle.color
                  
//            heading.textStyle = textStyle
                  
            
            textField.delegate = self
            textField.smartFieldDelegate = self
            
//              keyboardInputAccessoryView.addSubview(floatingButton)
//              textField.inputAccessoryView = keyboardInputAccessoryView
//              textField.inputAccessoryView?.autoresizingMask = .flexibleHeight
//              textField.inputAccessoryView?.frame.size.height = 62
            
        }
        
        
        
    }
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
        
        arrangedSubviews()
        updateTextfieldAttributes()

    }
    
    private func setup() {
        
        self.backgroundColor = UIColor.orange
        
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fill
        self.spacing = 8

      
        otpStackView1.axis = .horizontal
        otpStackView1.alignment = .fill
        otpStackView1.distribution = .fillEqually
        otpStackView1.spacing = 8

    }
    
    
    
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        setConstraints()
    }
    
    private func arrangedSubviews() {
        
        self.addArrangedSubview(otpStackView1)
        self.addArrangedSubview(errorLabel)
        
        otpView1.addSubview(textfield1)
        otpView2.addSubview(textfield2)
        otpView3.addSubview(textfield3)
        otpView4.addSubview(textfield4)
        
        otpStackView1.addArrangedSubview(otpView1)
        otpStackView1.addArrangedSubview(otpView2)
        otpStackView1.addArrangedSubview(otpView3)
        otpStackView1.addArrangedSubview(otpView4)
    }
    
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            self.centerXAnchor.constraint(equalTo: self.superview!.centerXAnchor),
           // self.topAnchor.constraint(equalTo: self.superview!.topAnchor, constant: 100),
            self.widthAnchor.constraint(equalToConstant: 264),
            self.heightAnchor.constraint(equalToConstant: 86),
            
            
            otpStackView1.topAnchor.constraint(equalTo: self.topAnchor),
            otpStackView1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            otpStackView1.widthAnchor.constraint(equalTo: self.widthAnchor),
            otpStackView1.heightAnchor.constraint(equalToConstant: 60),
            
            textfield1.heightAnchor.constraint(equalToConstant: 60),
            textfield1.widthAnchor.constraint(equalToConstant: 60),

            
            textfield2.heightAnchor.constraint(equalToConstant: 60),
            textfield2.widthAnchor.constraint(equalToConstant: 60),

            textfield3.heightAnchor.constraint(equalToConstant: 60),
            textfield3.widthAnchor.constraint(equalToConstant: 60),

            textfield4.heightAnchor.constraint(equalToConstant: 60),
            textfield4.widthAnchor.constraint(equalToConstant: 60),

            errorLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            errorLabel.heightAnchor.constraint(equalToConstant: 18),
            
//            floatingButton.bottomAnchor.constraint(equalTo: keyboardInputAccessoryView.bottomAnchor, constant: -15),
//            floatingButton.trailingAnchor.constraint(equalTo: keyboardInputAccessoryView.trailingAnchor, constant: -24)
            
        ])
        
        
    }
    
    private func amendTextColor(_ isError: Bool = false) {
        
        for i in 1...4 {
            
            let textField = self.viewWithTag(i) as! UITextField

            if isError {
                isShownError(true)
                textField.textColor = AppColors.fillRed
            } else {
                isShownError(false)
                textField.textColor = AppColors.textPrimary
            }
            
            
        }
    }
    
    
    public func isShownError(_ isShow: Bool) {
        
        if isShow {
            errorLabel.alpha = 1.0
        } else {
            errorLabel.alpha = 0.0
        }
        
    }
    
    //
    private func getOtpText() -> String {
        
        var otpText = ""
        
        for i in 1...4 {
            
            if let textField = self.viewWithTag(i) as? UITextField {
                
                print(textField.text!)
                otpText += "\(textField.text!)"
                
            }
            
           
        }
        
        print(otpText)
        return otpText
    }
    
    private func sendOtpText(_ value: String) {
        
        NotificationCenter.default.post(name: .otpTextNotification, object: nil, userInfo: ["otpText": value])
        
    }
    
}


extension OtpView: UITextFieldDelegate {
    
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let fieldValue = getOtpText()
               print(fieldValue)
        if fieldValue == "", textField.tag != 1 {
                   textField.resignFirstResponder()
                return true
               }
              return true
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
    
        
//        let fieldValue = getOtpText()
//        print(fieldValue)
//        if fieldValue == "" {
//            textField.resignFirstResponder()
//            textfield1.becomeFirstResponder()
//        }
        
    }
    
   public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print(string)
        if !string.isEmpty {
            textField.text = string
            sendOtpText(getOtpText())
           // let otpValue = getOtpText()
//            if textField.tag == 4 {
//                if otpValue.length == 4 {
//                     //amendTextColor(false)
//                     sendOtpText(otpValue)
//                }
               // return false
            //}
            
            let textField = self.viewWithTag(textField.tag + 1)
            textField?.becomeFirstResponder()
            return false
           
        } else {            
            if textField.text!.isEmpty {
                 let textField = self.viewWithTag(textField.tag - 1) as? UITextField
                textField?.text = ""
                 textField?.becomeFirstResponder()
                 return true
            }
            
            textField.text = ""
            
            
            amendTextColor()
           
            sendOtpText(getOtpText())
           // print(getOtpText())
            
            
            return false
            
        }
        
        
    }
  
    
}

extension OtpView: smartTextfieldDelegate {
    func textFieldDidDelete(textfield: UITextField) {
        
        if let textfield = self.viewWithTag(textfield.tag - 1) as? SmartTextfield {
        textfield.becomeFirstResponder()
        
        textfield.text = ""
           
        sendOtpText(getOtpText())
      
        print(getOtpText())
        }
    }
    
    
}

