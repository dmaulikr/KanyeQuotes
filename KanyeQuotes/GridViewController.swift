//
//  GridViewController.swift
//  KanyeQuotes
//
//  Created by Joe Nguyen on 25/03/2015.
//  Copyright (c) 2015 onyenjug. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func yeezyBlackColor() -> UIColor {
        
        return UIColor(red: 25.0/255.0, green: 10.0/255.0, blue: 10.0/255.0, alpha: 1.0)
    }
}

let GridContainerViewTopMargin:CGFloat = 18.0

class GridViewController: UIViewController {
    
    var appInfoView = AppInfoView()
    var gridContainerView = DraggableView()
    var gridVideosViewController: GridVideosViewController = GridVideosViewController(collectionViewLayout: GridVideosFlowLayout())

    override func viewDidLoad() {
        
        super.viewDidLoad()

        setupViews()
    }
    
    func setupViews() {
        
        appInfoView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(appInfoView)
        self.view.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat(
                "V:|-0-[appInfoView]-0-|",
                options: nil,
                metrics: nil,
                views: ["appInfoView": appInfoView]))
        self.view.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat(
                "H:|-0-[appInfoView]-0-|",
                options: nil,
                metrics: nil,
                views: ["appInfoView": appInfoView]))
        
        gridContainerView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(gridContainerView)
        self.view.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat(
                "V:|-(topMargin)-[gridContainerView]-0-|",
                options: nil,
                metrics: ["topMargin": GridContainerViewTopMargin],
                views: ["gridContainerView": gridContainerView]))
        self.view.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat(
                "H:|-0-[gridContainerView]-0-|",
                options: nil,
                metrics: nil,
                views: ["gridContainerView": gridContainerView]))
        
        gridVideosViewController.view.frame = gridContainerView.bounds
        gridContainerView.addSubview(gridVideosViewController.view)
        
        self.addChildViewController(gridVideosViewController)
        
        gridVideosViewController.willMoveToParentViewController(self)
    }
}
