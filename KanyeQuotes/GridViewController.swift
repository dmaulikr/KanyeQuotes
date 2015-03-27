//
//  GridViewController.swift
//  KanyeQuotes
//
//  Created by Joe Nguyen on 25/03/2015.
//  Copyright (c) 2015 onyenjug. All rights reserved.
//

import UIKit

class GridViewController: UIViewController {
    
    var headerView: UIView?
    var gridContainerView: UIView?
    var gridVideosViewController: GridVideosViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    func setupViews() {
        
        let headerViewHeight:CGFloat = 60.0
        self.headerView = UIView()
        if let headerView = self.headerView {
            
            let headerLabel = UILabel()
            headerLabel.text = "Pick a yeezy quote"
            headerLabel.textAlignment = NSTextAlignment.Center
            headerLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
            headerView.addSubview(headerLabel)
            headerView.addConstraints(
                NSLayoutConstraint.constraintsWithVisualFormat(
                    "V:|-20-[headerLabel]|",
                    options: nil,
                    metrics: nil,
                    views: ["headerLabel":headerLabel]))
            headerView.addConstraints(
                NSLayoutConstraint.constraintsWithVisualFormat(
                    "H:|[headerLabel]|",
                    options: nil,
                    metrics: nil,
                    views: ["headerLabel":headerLabel]))
            
            
            headerView.backgroundColor = UIColor.whiteColor()
            headerView.setTranslatesAutoresizingMaskIntoConstraints(false)
            
            self.view.addSubview(headerView)
            
            let metrics = ["headerViewHeight": headerViewHeight]
            let views = ["headerView": headerView]
            
            self.view.addConstraints(
                NSLayoutConstraint.constraintsWithVisualFormat(
                    "V:|-0-[headerView(headerViewHeight)]",
                    options: nil,
                    metrics: metrics,
                    views: views))
            
            self.view.addConstraints(
                NSLayoutConstraint.constraintsWithVisualFormat(
                    "H:|-0-[headerView]-0-|",
                    options: nil,
                    metrics: metrics,
                    views: views))
        }
        
        self.gridContainerView = UIView()
        if let gridContainerView = self.gridContainerView {
            
            gridContainerView.setTranslatesAutoresizingMaskIntoConstraints(false)
            self.view.addSubview(gridContainerView)
            self.view.addConstraints(
                NSLayoutConstraint.constraintsWithVisualFormat(
                    "V:|-(headerViewHeight)-[gridContainerView]-0-|",
                    options: nil,
                    metrics: ["headerViewHeight": headerViewHeight],
                    views: ["gridContainerView": gridContainerView]))
            self.view.addConstraints(
                NSLayoutConstraint.constraintsWithVisualFormat(
                    "H:|-0-[gridContainerView]-0-|",
                    options: nil,
                    metrics: nil,
                    views: ["gridContainerView": gridContainerView]))
        }
        
        self.gridVideosViewController = GridVideosViewController(collectionViewLayout: GridVideosFlowLayout())
        
        if let gridVideosViewController = self.gridVideosViewController,
            gridContainerView = self.gridContainerView {
                
                println("gridContainerView.bounds: %@", NSStringFromCGRect(gridContainerView.bounds))
                
                gridVideosViewController.view.frame = gridContainerView.bounds
                gridContainerView.addSubview(gridVideosViewController.view)
                
                self.addChildViewController(gridVideosViewController)
                
                gridVideosViewController.willMoveToParentViewController(self)
        }
    }
}
