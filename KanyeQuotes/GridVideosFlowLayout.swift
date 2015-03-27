//
//  GridVideosFlowLayout.swift
//  KanyeQuotes
//
//  Created by Joe Nguyen on 25/03/2015.
//  Copyright (c) 2015 onyenjug. All rights reserved.
//

import UIKit

class GridVideosFlowLayout: UICollectionViewFlowLayout {
   
    override init() {
        
        super.init()
        
        let margin: CGFloat = 10.0
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        
        itemSize = CGSizeMake(screenWidth/2 - margin*3/2, screenWidth/2 - margin*3/2)
        minimumLineSpacing = margin
        minimumInteritemSpacing = margin/2
        self.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
