//
//  AppInfoView.swift
//  KanyeQuotes
//
//  Created by Joe Nguyen on 11/04/2015.
//  Copyright (c) 2015 onyenjug. All rights reserved.
//

import UIKit

class AppInfoView: UIView {

    let appNameLabel = UILabel()
    
    // MARK: Init
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.setup()
    }
    
    func setup() {
        
        self.backgroundColor = UIColor.blackColor()
        
        self.appNameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 24.0)
        self.appNameLabel.backgroundColor = UIColor.clearColor()
        self.appNameLabel.text = "YEEZY SPEAKS"
        self.appNameLabel.textColor = UIColor.whiteColor()
        self.appNameLabel.textAlignment = NSTextAlignment.Center
        self.appNameLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(self.appNameLabel)
        self.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat(
                "V:|-(topMargin)-[appNameLabel(height)]",
                options: NSLayoutFormatOptions(0),
                metrics: ["topMargin": 30, "height": 30],
                views: ["appNameLabel": self.appNameLabel]))
        self.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat(
                "H:|-0-[appNameLabel]-0-|",
                options: NSLayoutFormatOptions(0),
                metrics: nil,
                views: ["appNameLabel": self.appNameLabel]))
        
    }

}
