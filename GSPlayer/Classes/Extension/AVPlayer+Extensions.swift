//
//  AVPlayer+Extensions.swift
//  GSPlayer
//
//  Created by Gesen on 2019/4/21.
//  Copyright © 2019 Gesen. All rights reserved.
//

import AVFoundation
#if !os(macOS)
import UIKit
#else
import AppKit
#endif

public extension AVPlayer {
    
    var bufferProgress: Double {
        guard let item = currentItem,
              !item.isPlaybackBufferEmpty else {
            return -1
        }
        return item.bufferProgress
    }
    
    var currentBufferDuration: Double {
        guard let item = currentItem,
              !item.isPlaybackBufferEmpty else {
            return -1
        }
        return item.currentBufferDuration
    }
    
    var currentDuration: Double {
        guard let item = currentItem,
              !item.isPlaybackBufferEmpty else {
            return -1
        }
        return item.currentDuration
    }
    
    #if !os(macOS)
    var currentImage: UIImage? {
        guard
            let playerItem = currentItem,
            let cgImage = try? AVAssetImageGenerator(asset: playerItem.asset).copyCGImage(at: currentTime(), actualTime: nil)
            else { return nil }

        return UIImage(cgImage: cgImage)
    }
    #else
    var currentImage: NSImage? {
        guard
            let playerItem = currentItem,
            let cgImage = try? AVAssetImageGenerator(asset: playerItem.asset).copyCGImage(at: currentTime(), actualTime: nil)
        else {
            return nil
        }
        let width: CGFloat = CGFloat(cgImage.width)
        let height: CGFloat = CGFloat(cgImage.height)
        return NSImage(cgImage: cgImage, size: NSMakeSize(width, height))
    }
    #endif
    
    var playProgress: Double {
        guard let item = currentItem,
              !item.isPlaybackBufferEmpty else {
            return -1
        }
        return item.playProgress
    }
    
    var totalDuration: Double {
        guard let item = currentItem,
              !item.isPlaybackBufferEmpty else {
            return -1
        }
        return item.totalDuration
    }
    
    convenience init(asset: AVURLAsset) {
        self.init(playerItem: AVPlayerItem(asset: asset))
    }
    
}
