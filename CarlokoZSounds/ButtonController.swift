//
//  ButtonController.swift
//  CarlokoZSounds
//
//  Created by Carlos Rado on 2017-04-08.
//  Copyright © 2017 Carlos Rado. All rights reserved.
//

import UIKit
import AVFoundation
import AudioKit

class ButtonController: UIViewController {
    
    @IBOutlet var a1image: UIImageView!
    @IBOutlet var a2image: UIImageView!
    @IBOutlet var a3image: UIImageView!
    @IBOutlet var a4image: UIImageView!
    @IBOutlet var b1image: UIImageView!
    @IBOutlet var b2image: UIImageView!
    @IBOutlet var b3image: UIImageView!
    @IBOutlet var b4image: UIImageView!
    @IBOutlet var c1image: UIImageView!
    @IBOutlet var c2image: UIImageView!
    @IBOutlet var c3image: UIImageView!
    @IBOutlet var c4image: UIImageView!
    @IBOutlet var d1image: UIImageView!
    @IBOutlet var d2image: UIImageView!
    @IBOutlet var d3image: UIImageView!
    @IBOutlet var d4image: UIImageView!
    @IBOutlet var e1image: UIImageView!
    @IBOutlet var e2image: UIImageView!
    @IBOutlet var e3image: UIImageView!
    @IBOutlet var e4image: UIImageView!
    @IBOutlet var f1image: UIImageView!
    @IBOutlet var f2image: UIImageView!
    @IBOutlet var f3image: UIImageView!
    @IBOutlet var f4image: UIImageView!
    @IBOutlet var g1image: UIImageView!
    @IBOutlet var g2image: UIImageView!
    @IBOutlet var g3image: UIImageView!
    @IBOutlet var g4image: UIImageView!
    
    var buttonTimer = Timer()
    var buttonColourInterval = 0.1
    var whiteButton = UIImage(named: "button.png")
    var redButton = UIImage(named: "button_r.png")
    var greenButton = UIImage(named: "button_g.png")
    var yellowButton = UIImage(named: "button_y.png")
    var arrayOfImageViews = [UIImageView]()

//    AVFOUNDATION entities
//    808 kicks - hi C  to mid C (high octave)
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
    
    //    AUDIOKIT entities
//    Audio Player
    var eightOhEight : AKAudioFile!
    var marimba : AKAudioFile!
    var audioPlayer : AKAudioPlayer!
//    Sampler
    var sampler : AKSampler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("adding all ImageViews to array...")
        arrayOfImageViews = [a1image,a2image,a3image,a4image,b1image,b2image,b3image,b4image,c1image,c2image,c3image,c4image,d1image,d2image,d3image,d4image,f1image,f2image,f3image,f4image,g1image,g2image,g3image,g4image]
        print("assigning white button to all IV's")
        for  imageView in arrayOfImageViews {
            tapColour(thisImage: imageView)
        }
        
        sampler = AKSampler()
//        eightOhEight = try! AKAudioFile(readFileName: "marimba_c.wav", baseDir: .resources)
        marimba = try! AKAudioFile(readFileName: "marimba_c.wav", baseDir: .resources)
//        audioPlayer = try! AKAudioPlayer(file: self.eightOhEight)
        try! self.sampler.loadAudioFile(marimba)
        print("viewDidLoad() complete...")
    }
   
//    ROW A
    
    @IBAction func tap_A1(_ sender: Any) {
        print("A1 has been tapped")
        tapColour(thisImage: a1image)
        buttonTimer = Timer.scheduledTimer(timeInterval: buttonColourInterval, target: self, selector: #selector(tapColour2), userInfo: a1image, repeats: false)
        
        
//        AudioKit.output = audioPlayer
//        AudioKit.start()
//        audioPlayer.currentTime = 0
//        audioPlayer.play()
        AudioKit.output = sampler
        AudioKit.start()
        sampler.play()
        
    }
    @IBAction func tap_A2(_ sender: Any) {
        print("A2 has been tapped")
        tapColour(thisImage: a2image)
        buttonTimer = Timer.scheduledTimer(timeInterval: buttonColourInterval, target: self, selector: #selector(tapColour2), userInfo: a2image, repeats: false)
    }
    @IBAction func tap_A3(_ sender: Any) {
        print("A3 has been tapped")
        tapColour(thisImage: a3image)
        buttonTimer = Timer.scheduledTimer(timeInterval: buttonColourInterval, target: self, selector: #selector(tapColour2), userInfo: a3image, repeats: false)
    }
    @IBAction func tap_A4(_ sender: Any) {
        print("A4 has been tapped")
        tapColour(thisImage: a4image)
        buttonTimer = Timer.scheduledTimer(timeInterval: buttonColourInterval, target: self, selector: #selector(tapColour2), userInfo: a4image, repeats: false)
    }
    
//    ROW B
    
    @IBAction func tap_B1(_ sender: Any) {
        print("B1 has been tapped")
        tapColour(thisImage: b1image)
        buttonTimer = Timer.scheduledTimer(timeInterval: buttonColourInterval, target: self, selector: #selector(tapColour2), userInfo: b1image, repeats: false)
    }
    @IBAction func tap_B2(_ sender: Any) {
        print("B2 has been tapped")
        tapColour(thisImage: b2image)
        buttonTimer = Timer.scheduledTimer(timeInterval: buttonColourInterval, target: self, selector: #selector(tapColour2), userInfo: b2image, repeats: false)
    }
    @IBAction func tap_B3(_ sender: Any) {
        print("B3 has been tapped")
        tapColour(thisImage: b3image)
        buttonTimer = Timer.scheduledTimer(timeInterval: buttonColourInterval, target: self, selector: #selector(tapColour2), userInfo: b3image, repeats: false)
    }
    @IBAction func tap_B4(_ sender: Any) {
        print("B4 has been tapped")
        tapColour(thisImage: b4image)
        buttonTimer = Timer.scheduledTimer(timeInterval: buttonColourInterval, target: self, selector: #selector(tapColour2), userInfo: b4image, repeats: false)
    }
//    ROW C
    
    @IBAction func tap_C1(_ sender: Any) {
        print("C1 has been tapped")
        tapColour(thisImage: c1image)
    }
    @IBAction func tap_C2(_ sender: Any) {
        print("C2 has been tapped")
        tapColour(thisImage: c2image)
    }
    @IBAction func tap_C3(_ sender: Any) {
        print("C3 has been tapped")
        tapColour(thisImage: c3image)
    }
    @IBAction func tap_C4(_ sender: Any) {
        print("C4 has been tapped")
        tapColour(thisImage: c4image)
    }
    
//    ROW D
    
    @IBAction func tap_D1(_ sender: Any) {
        print("D1 has been tapped")
        tapColour(thisImage: d1image)
    }
    @IBAction func tap_D2(_ sender: Any) {
        print("D2 has been tapped")
        tapColour(thisImage: d2image)
    }
    @IBAction func tap_D3(_ sender: Any) {
        print("D3 has been tapped")
        tapColour(thisImage: d3image)
    }
    @IBAction func tap_D4(_ sender: Any) {
        print("D4 has been tapped")
        tapColour(thisImage: d4image)
    }
    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches{
//                tapColour(thisImage: )
//        }
//    }
    
    func tapColour( thisImage: UIImageView){
        print("changing button colour")
        if (thisImage.image == whiteButton){
            thisImage.image = redButton
        } else {
            thisImage.image = whiteButton
        }
    }
    
    func tapColour2( timer:Timer){
        let thisImage: UIImageView = timer.userInfo as! UIImageView
        print("changing button colour back...")
        if (thisImage.image == whiteButton){
            thisImage.image = redButton
        } else {
            thisImage.image = whiteButton
        }
    }
    
    
    
    func testFunc(timer: Timer){
        print("test function")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
