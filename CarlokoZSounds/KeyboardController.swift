//
//  KeyboardController.swift
//  CarlokoZSounds
//
//  Created by Carlos Rado on 2017-04-14.
//  Copyright © 2017 Carlos Rado. All rights reserved.
//

import UIKit
import AVFoundation

class KeyboardController: UIViewController {
    
    
    var audioURL_c2 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_c+1", ofType: "wav")!)
    var audioPlayer_c2 = AVAudioPlayer()
    
    var audioURL_b1 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_b", ofType: "wav")!)
    var audioPlayer_b1 = AVAudioPlayer()
    
    var audioURL_aSharp1 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_a#", ofType: "wav")!)
    var audioPlayer_aSharp1 = AVAudioPlayer()
    
    var audioURL_a1 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_a", ofType: "wav")!)
    var audioPlayer_a1 = AVAudioPlayer()
    
    var audioURL_gSharp1 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_g#", ofType: "wav")!)
    var audioPlayer_gSharp1 = AVAudioPlayer()
    
    var audioURL_g1 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_g", ofType: "wav")!)
    var audioPlayer_g1 = AVAudioPlayer()
    
    var audioURL_fSharp1 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_f#", ofType: "wav")!)
    var audioPlayer_fSharp1 = AVAudioPlayer()
    
    var audioURL_f1 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_f", ofType: "wav")!)
    var audioPlayer_f1 = AVAudioPlayer()
    
    var audioURL_e1 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_e", ofType: "wav")!)
    var audioPlayer_e1 = AVAudioPlayer()
    
    var audioURL_dSharp1 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_d#", ofType: "wav")!)
    var audioPlayer_dSharp1 = AVAudioPlayer()
    
    var audioURL_d1 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_d", ofType: "wav")!)
    var audioPlayer_d1 = AVAudioPlayer()
    
    var audioURL_cSharp1 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_c#", ofType: "wav")!)
    var audioPlayer_cSharp1 = AVAudioPlayer()
    
    var audioURL_c1 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_c", ofType: "wav")!)
    var audioPlayer_c1 = AVAudioPlayer()
    
    var audioURL_b0 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_b-1", ofType: "wav")!)
    var audioPlayer_b0 = AVAudioPlayer()
    
    var audioURL_aSharp0 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_a#-1", ofType: "wav")!)
    var audioPlayer_aSharp0 = AVAudioPlayer()
    
    var audioURL_a0 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_a-1", ofType: "wav")!)
    var audioPlayer_a0 = AVAudioPlayer()
    
    var audioURL_gSharp0 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_g#-1", ofType: "wav")!)
    var audioPlayer_gSharp0 = AVAudioPlayer()
    
    var audioURL_g0 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_g-1", ofType: "wav")!)
    var audioPlayer_g0 = AVAudioPlayer()
    
    var audioURL_fSharp0 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_f#-1", ofType: "wav")!)
    var audioPlayer_fSharp0 = AVAudioPlayer()
    
    var audioURL_f0 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_f-1", ofType: "wav")!)
    var audioPlayer_f0 = AVAudioPlayer()
    
    var audioURL_e0 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_e-1", ofType: "wav")!)
    var audioPlayer_e0 = AVAudioPlayer()
    
    var audioURL_dSharp0 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "808k_d", ofType: "wav")!)
    var audioPlayer_dSharp0 = AVAudioPlayer()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
