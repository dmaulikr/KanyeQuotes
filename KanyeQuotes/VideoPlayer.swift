//
//  VideoPlayer.swift
//  KanyeQuotes
//
//  Created by Joe Nguyen on 11/04/2015.
//  Copyright (c) 2015 onyenjug. All rights reserved.
//

import UIKit
import AVFoundation

class VideoPlayer: AVPlayer {
    
    var observer:AnyObject?
    
    override init() {
        
        super.init()
    }
    
    override init!(URL: NSURL!) {
        
        super.init(URL: URL)
        
        setup()
    }
    
    override init!(playerItem item: AVPlayerItem!) {
        
        super.init(playerItem: item)
        
        setup()
    }
    
    func setup() {
    }
    
    override func play() {
        
        if let
            currentItem = currentItem,
            asset = currentItem.asset {
                
                let duration = asset.duration
//                NSLog("duration: %@", CMTimeCopyDescription(nil, duration) as String)
                observer = addPeriodicTimeObserverForInterval(duration,
                    queue: nil,
                    usingBlock: { (time:CMTime) -> Void in
                        
//                        NSLog("time: %@", CMTimeCopyDescription(nil, time) as String)
                        if CMTimeCompare(time, duration) == 0 {
                            
                            self.seekToTime(kCMTimeZero)
                        }
                })
        }
        
        super.play()
    }
}
