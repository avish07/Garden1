//
//  GHTextFieldWithTitle.swift
//  GHTypography
//
//  Created by Shubham on 3/22/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit

public enum TextFieldType: Int {
    case normal = 0
    case success
    case error
}

@objc protocol TitleTextFieldDelegate: class {
    func textFieldBeginEditing(textFieldComponent: TitleTextField)
    func textFieldEndEditing(textFieldComponent: TitleTextField)
}

@IBDesignable public class TitleTextField: UIView {
    
    var seperator: SeperatorLine = SeperatorLine()
     var titleLbl: GHLabel!
    var heightConstraint: NSLayoutConstraint!
    public var textField: TextField!
    var statusLbl: GHLabel!
    var optionalLbl: GHLabel!
    var checkmark: UIImageView!
    var textFieldTrailingConstraint: NSLayoutConstraint!;
    @IBOutlet weak var delegate: TitleTextFieldDelegate?
  //  private var keyboardInputAccessoryView: UIView!
    
   // public var floatingButton: ButtonWithIcon!
    
   // public var floatingDelegate: FloatingButtonDelegate?
    
    @IBInspectable public var titleString: String = "" {
        didSet{
            renderView()
        }
    }
    
    @IBInspectable public var placeholder: String = "" {
        didSet{
            renderView()
        }
    }
    
    
    @IBInspectable public var textFieldText: String = "" {
        didSet{
            renderView()
        }
    }
    
    @IBInspectable public var optional: Bool = false {
        didSet{
            renderView()
        }
    }
    
    @IBInspectable public var fieldType: Int = 0 {
        didSet{
            self.textFieldType = TextFieldType(rawValue: fieldType) ?? .normal
        }
    }
    
    public var textFieldType:TextFieldType = .normal {
        
        didSet {
            renderView()
        }
    }
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override public func prepareForInterfaceBuilder() {
        
        super.prepareForInterfaceBuilder()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    
    func renderView() {
        
      //  textField.placeholder = "Type Something"
      //  textField.delegate = self
        
        
        titleLbl.text = titleString
        
        if titleString.length > 0 {
            heightConstraint.constant = 73;
        }
        else {
            heightConstraint.constant = 46;
        }
        
        statusLbl.text = "There seems to be an error"
        
        if textFieldType == .error {
            textFieldTrailingConstraint.constant = 0
            statusLbl.isHidden = false
            checkmark.isHidden = true
            seperator.seperatorColor = .dividerTertiary
        }
        else if textFieldType == .success {
            textFieldTrailingConstraint.constant = -24
            statusLbl.isHidden = true
            seperator.seperatorColor = .dividerSecondary
            checkmark.isHidden = false
        }
        else {
            textFieldTrailingConstraint.constant = 0
            checkmark.isHidden = true
            statusLbl.isHidden = true
            seperator.seperatorColor = .dividerPrimary
        }
        
        optionalLbl.text = "Optional"
        optionalLbl.isHidden = !optional
    }
    
    
    func setupView() {
        
        checkmark = UIImageView(image: UIImage(named: "checkmark"))
        checkmark.contentMode = .scaleAspectFit
        addSubview(checkmark)
        
        checkmark.isHidden = true
        
//        floatingButton = ButtonWithIcon(imageName: "checkBox", actionHandler: { [weak self] (isTapped) -> (Bool?) in
//
//            guard let self = self else { return nil }
//
//            if isTapped {
//
//                self.floatingDelegate?.floatingButtonTapped()
//            }
//            return false
//        })
     
        
        textField =  TextField()
        textField.clearButtonMode = .whileEditing
        let textStyle = TextStyles.body1Regular
        textStyle.color = AppColors.textPrimary
       // textField.keyboardAppearance = .dark
        textField.autocorrectionType = .no
        
        
//        keyboardInputAccessoryView = UIView(frame: CGRect(x: (AppConstants.screenWidth - 100), y: 0, width: (AppConstants.screenWidth - 100), height: 32))
//
//        keyboardInputAccessoryView.addSubview(floatingButton)
//
//        //keyboardInputAccessoryView.backgroundColor = UIColor.orange
//        textField.inputAccessoryView = keyboardInputAccessoryView
//
//        textField.inputAccessoryView?.autoresizingMask = .flexibleHeight
//      //  textField.inputAccessoryView?.backgroundColor = UIColor.green
//        textField.inputAccessoryView?.frame.size.height = 32
        
        
        let placeholderStyle = TextStyles.body1Regular
        placeholderStyle.color = AppColors.textPlaceholder
        textField.placeholderTextStyle = placeholderStyle
        addSubview(textField)
        
        titleLbl = GHLabel()
        let titleTextStyle =  TextStyles.body2Semibold
        titleTextStyle.color = AppColors.textPrimary
        titleLbl.textStyle = titleTextStyle
        
        addSubview(titleLbl)
        
        print(titleLbl.text ?? "Where")
        
        seperator = SeperatorLine()
        seperator.seperatorColor = .dividerPrimary
        addSubview(seperator)
        
        statusLbl = GHLabel()
        let statusFieldStyle = TextStyles.overlineSemibold
        statusFieldStyle.color = AppColors.fillRed
        statusLbl.textStyle = statusFieldStyle
        addSubview(statusLbl)
        
        statusLbl.isHidden = true
        
        optionalLbl = GHLabel()
        let optionStyle = TextStyles.miniMedium
        optionStyle.color = AppColors.textSupporter
        optionalLbl.textStyle = optionStyle
        
        addSubview(optionalLbl)
        
        addConstraints()
    }
    
    func addConstraints() {
        
        heightConstraint = self.heightAnchor.constraint(equalToConstant: 73)
        heightConstraint.isActive = true;
        
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        seperator.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        statusLbl.translatesAutoresizingMaskIntoConstraints = false;
        optionalLbl.translatesAutoresizingMaskIntoConstraints = false
        checkmark.translatesAutoresizingMaskIntoConstraints = false
        textFieldTrailingConstraint =   textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        
        NSLayoutConstraint.activate([
            
            titleLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            titleLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            
            optionalLbl.leadingAnchor.constraint(equalTo: titleLbl.trailingAnchor, constant: 8),
            optionalLbl.topAnchor.constraint(equalTo: self.topAnchor , constant: 5),
            
            seperator.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            seperator.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            seperator.heightAnchor.constraint(equalToConstant: 1),
            seperator.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -21),
            
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            textFieldTrailingConstraint,
            textField.heightAnchor.constraint(equalToConstant:24),
            textField.bottomAnchor.constraint(equalTo: seperator.bottomAnchor, constant: 0),
            
            statusLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            statusLbl.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 4),
            
            checkmark.heightAnchor.constraint(equalToConstant: 16),
            checkmark.widthAnchor.constraint(equalToConstant: 16),
            checkmark.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            checkmark.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
//            floatingButton.bottomAnchor.constraint(equalTo: keyboardInputAccessoryView.bottomAnchor, constant: -15),
//            floatingButton.trailingAnchor.constraint(equalTo: keyboardInputAccessoryView.trailingAnchor, constant: -24)

            
        ])
    }
    
    public func showErrorView(message  : String) {
        self.textFieldType = .error;
        statusLbl.text = message;
    }
    
    public func showSuccessState() {
        self.textFieldType = .success;
    }
}


extension TitleTextField: UITextFieldDelegate {
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.textFieldType = .normal
        return true
    }
    
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // For Checking
        delegate?.textFieldEndEditing(textFieldComponent: self)
        return true
    }
}

