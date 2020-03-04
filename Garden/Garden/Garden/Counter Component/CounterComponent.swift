//
//  CounterComponent.swift
//  GHTypography
//
//  Created by Shubham on 19/06/19.
//  Copyright © 2019 Guesthouser. All rights reserved.
//

import UIKit
@IBDesignable class CounterComponent: UIControl {
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var minVal: Int = 0
    var maxVal: Int = 10000
    var currentVal: Int = 0 {
        didSet {
            changeCounterLabel()
        }
    }
    var decrementButton: Icon = Icon(type: .medium)
    var incrementButton: Icon = Icon(type: .medium)
    var valueLabel: GHLabel = GHLabel()
    var longPressTimer: Timer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    
    func setUpView() {
        
        
        decrementButton.setImage("minus") { (success) -> (Bool?) in
            self.decrementCounter()
            return true
        }
        
        incrementButton.setImage("plus") { (success) -> (Bool?) in
            self.incrementCounter()
            return true
        }
        
        // TextStyle Setting
        let textStyle = TextStyles.subtitleMedium
        textStyle.color = AppColors.textPrimary
        textStyle.characterSpacing = 2
        textStyle.textAlignment = .center
        valueLabel.textStyle = textStyle
        valueLabel.text = "0"
        
        self.addSubview(decrementButton)
        self.addSubview(incrementButton)
        self.addSubview(valueLabel)
        setUpConstraints()
        addGesturesToButtons()
    }
    
    func setUpConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        incrementButton.translatesAutoresizingMaskIntoConstraints = false
        decrementButton.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([self.widthAnchor.constraint(equalToConstant: 182),self.heightAnchor.constraint(equalToConstant: 44)])
        
        NSLayoutConstraint.activate([decrementButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),decrementButton.topAnchor.constraint(equalTo: self.topAnchor)])
        
      NSLayoutConstraint.activate([incrementButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),incrementButton.topAnchor.constraint(equalTo: self.topAnchor)])
        NSLayoutConstraint.activate([valueLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),valueLabel.leadingAnchor.constraint(equalTo: decrementButton.trailingAnchor),valueLabel.trailingAnchor.constraint(equalTo: incrementButton.leadingAnchor)])
    }
    
    func addGesturesToButtons() {
        
        let decrementLongPress = UILongPressGestureRecognizer(target: self, action: #selector(handleDecrementGesture(longPressGesture:)))
        decrementLongPress.minimumPressDuration = 0.5
        decrementButton.addGestureRecognizer(decrementLongPress)
        
        let incrementLongPress = UILongPressGestureRecognizer(target: self, action: #selector(handleIncrementGesture(longPressGesture:)))
        incrementLongPress.minimumPressDuration = 0.5
        incrementButton.addGestureRecognizer(incrementLongPress)
    }
    
    @objc func handleDecrementGesture(longPressGesture: UILongPressGestureRecognizer) {
        
        if longPressGesture.state == .began {
            
            longPressTimer = Timer.scheduledTimer(timeInterval: TimeInterval(floatLiteral: 0.1), target: self, selector: #selector(decrementCounter), userInfo: nil, repeats: true)
        }
        else if(longPressGesture.state == .ended) {
            longPressTimer.invalidate()
        }
    }
    
    @objc func handleIncrementGesture(longPressGesture: UILongPressGestureRecognizer) {
        if longPressGesture.state == .began {
            longPressTimer = Timer.scheduledTimer(timeInterval: TimeInterval(floatLiteral: 0.1), target: self, selector: #selector(incrementCounter), userInfo: nil, repeats: true)
        }
        else if(longPressGesture.state == .ended) {
            longPressTimer.invalidate()
        }
    }
    
    @objc    func incrementCounter() {
        if currentVal < maxVal {
            currentVal += 1
            sendCallback()
        }
    }
    
   @objc func decrementCounter() {
        if currentVal > minVal {
            currentVal -= 1
            sendCallback()
        }
    }
    
    func changeCounterLabel() {
        valueLabel.text = "\(currentVal)"
    }
    
    func sendCallback() {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(valueChanged), object: nil)
        self.perform(#selector(valueChanged), with: nil, afterDelay: 0.5)
    }
    
    @objc func valueChanged() {
       self.sendActions(for: .valueChanged)
    }
}
