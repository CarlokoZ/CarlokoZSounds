//
//  Sound.swift
//  CarlokoZSounds
//
//  Created by Carlos Rado on 2017-04-14.
//  Copyright © 2017 Carlos Rado. All rights reserved.
//

import Foundation
import AVFoundation

class Sound {
    var marimbaURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: "marimba_c", ofType: "wav")!)
    var marimbaPlayer = AVAudioPlayer()
    
    func loadPlayer(){
        marimbaPlayer = try! AVAudioPlayer(contentsOf: marimbaURL as URL, fileTypeHint: "wav")
    }
    
    func playSound(){
        marimbaPlayer.stop()
        marimbaPlayer.currentTime = 0
        marimbaPlayer.play()
    }
}
