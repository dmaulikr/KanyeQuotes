//
//  DraggableView.swift
//  KanyeQuotes
//
//  Created by Joe Nguyen on 11/04/2015.
//  Copyright (c) 2015 onyenjug. All rights reserved.
//

import UIKit

class DraggableView: UIView {
    
    var pan:UIPanGestureRecognizer?
    
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
        
        self.pan = UIPanGestureRecognizer(target: self, action: "didPan:")
        self.pan!.cancelsTouchesInView = false
        self.addGestureRecognizer(self.pan!)
    }
    
    func didPan(panGesture: UIPanGestureRecognizer?) {
        
        if let panGesture = panGesture {
            
            if panGesture.state == UIGestureRecognizerState.Began ||
                panGesture.state == UIGestureRecognizerState.Changed {
                    
                    let translation = panGesture.translationInView(self)
                    if (translation.y > GridContainerViewTopMargin) {
                        
                        var frame = self.frame
                        frame.origin.y = translation.y
                        self.frame = frame
                        
                    }
            }
            else if panGesture.state == UIGestureRecognizerState.Ended ||
                panGesture.state == UIGestureRecognizerState.Cancelled {
                    
                    var frame = self.frame
                    frame.origin.y = GridContainerViewTopMargin
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        
                        self.frame = frame
                    })
                    
            }
        }
    }
}
