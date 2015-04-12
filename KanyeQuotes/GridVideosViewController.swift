//
//  GridVideosViewController.swift
//  KanyeQuotes
//
//  Created by Joe Nguyen on 25/03/2015.
//  Copyright (c) 2015 onyenjug. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

let CellIdentifier = "CellIdentifier"

class GridVideosViewController: UICollectionViewController {
    
    let videoList:[String] = [
        "impactful_artist_square.mp4",
        "bigger_than_walmart_square.mp4",
        "kim_kardijon_square.mp4",
        "shakespeare_square.mp4",
        "in_paris_square.mp4",
        "george_bush_square.mp4",
        "rap_new_rock_square.mp4",
        "fan_of_yourself_square.mp4",
        "biggest_rockstar_square.mp4",
        "no_ralph_square.mp4",
        "jordans_on_the_beach_square.mp4",
        "answers_sway_square.mp4",
        "leather_jogging_pant2_square.mp4",
        "a_god_square.mp4",
        "warhol_square.mp4"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        
        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifier)
        
        self.setupViews()
    }
    
    func setupViews() {
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return self.videoList.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CellIdentifier, forIndexPath: indexPath) as! UICollectionViewCell
    
        // Configure the cell
        cell.contentView.backgroundColor = UIColor.clearColor()
    
        // remove any existing player/player layers
        var layerToRemove:AVPlayerLayer?
        if let sublayers = cell.contentView.layer.sublayers {
            
            for layer in sublayers {
                
                if layer is AVPlayerLayer {
                    
                    layerToRemove = layer as? AVPlayerLayer
                }
            }
            if let layerToRemove = layerToRemove {
                layerToRemove.removeFromSuperlayer()
            }
        }
        
        // add player and player layer
        let videoPath: String = self.videoList[indexPath.row]
        if let
            player = VideoPlayer(URL: self.fileURLFromVideoPath(videoPath)),
            layer = AVPlayerLayer() {

                layer.player = player
                layer.frame = cell.bounds
                layer.backgroundColor = UIColor.whiteColor().CGColor
                layer.videoGravity = AVLayerVideoGravityResizeAspectFill
                
                cell.contentView.layer.addSublayer(layer)
        }
        
        return cell
    }
    
    func fileURLFromVideoPath(videoPath: String) -> NSURL? {
        
        if let
            name = videoPath.componentsSeparatedByString(".").first,
            ext = videoPath.componentsSeparatedByString(".")[1] as String?,
            path = NSBundle.mainBundle().pathForResource(name, ofType: ext) {
                
                return NSURL(fileURLWithPath: path, isDirectory: false)
        }
        return nil
    }
    
    func generateThumnail(url : NSURL) -> UIImage? {
        
        var asset : AVAsset = AVAsset.assetWithURL(url) as! AVAsset
        var assetImgGenerate : AVAssetImageGenerator = AVAssetImageGenerator(asset: asset)
        assetImgGenerate.appliesPreferredTrackTransform = true
        var error       : NSError? = nil
        var time        : CMTime = CMTimeMake(1, 30)
        var img         : CGImageRef = assetImgGenerate.copyCGImageAtTime(time, actualTime: nil, error: &error)
        var frameImg    : UIImage = UIImage(CGImage: img)!
        
        return frameImg
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = collectionView.cellForItemAtIndexPath(indexPath) {
            
            for layer in cell.contentView.layer.sublayers {
                
                if layer is AVPlayerLayer {
                    
                    if let
                        playerLayer = layer as? AVPlayerLayer,
                        player = playerLayer.player {
                            
                            player.seekToTime(kCMTimeZero)
                            player.play()
                            break
                    }
                }
            }
        }
    }
}
