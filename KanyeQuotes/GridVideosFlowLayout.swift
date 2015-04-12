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
        
        let margin:CGFloat = 2.0
        let squaresPerRow:CGFloat = 3.0
        let marginsPerRow:CGFloat = squaresPerRow - 1.0
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let squareItemSizeWidthFit = (screenWidth - margin*marginsPerRow)/squaresPerRow
        itemSize = CGSizeMake(squareItemSizeWidthFit, squareItemSizeWidthFit)
        minimumLineSpacing = margin
        minimumInteritemSpacing = margin/2
        self.sectionInset = UIEdgeInsetsZero
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
