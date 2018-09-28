//
//  RoundButton.swift
//  Calculator
//
//  Created by Shubh Patel on 2018-09-13.
//  Copyright © 2018 Shubh Patel. All rights reserved.
//  STUDENT ID: 300977575
//  MADE FOR: iPhone6/7/8 and iPhone X/XS
import UIKit



@IBDesignable class RoundButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        refreshCorners(value: cornerRadius)
    }
    
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
}

