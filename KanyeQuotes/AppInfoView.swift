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
    let yeezyImageView = UIImageView()
    
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
        
        self.backgroundColor = UIColor.yeezyBlackColor()
        
        yeezyImageView.image = UIImage(named: "yeezy_1024_transparent.png")
        yeezyImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        addSubview(yeezyImageView)
        let imageWidth:CGFloat = 50, imageHeight:CGFloat = 50, topMargin:CGFloat = 25
        addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat(
                "V:|-(topMargin)-[yeezyImageView(height)]",
                options: NSLayoutFormatOptions(0),
                metrics: ["topMargin": topMargin, "height": imageHeight],
                views: ["yeezyImageView": yeezyImageView]))
        addConstraint(NSLayoutConstraint(item: yeezyImageView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: yeezyImageView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: imageHeight))
    }

}
