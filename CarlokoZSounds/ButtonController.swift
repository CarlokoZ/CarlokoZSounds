//
//  ButtonController.swift
//  CarlokoZSounds
//
//  Created by Carlos Rado on 2017-04-08.
//  Copyright © 2017 Carlos Rado. All rights reserved.
//

import UIKit
//import AVFoundation
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
    let buttonColourInterval = 0.1
    var whiteButton = UIImage(named: "button.png")
    var redButton = UIImage(named: "button_r.png")
    var greenButton = UIImage(named: "button_g.png")
    var yellowButton = UIImage(named: "button_y.png")
    var backButton = UIImage(named: "button_back.png")
    var arrayOfImageViews = [UIImageView]()
    var arrayOfNotePitches = [Double]()

//    AVFOUNDATION entities
//    808 kicks - hi C  to mid C (high octave)    //    AUDIOKIT entities
//    MOVED TO KEYBOARD CONTROLLER
    
//    AK Audio Player & Audio File
    var eightOhEight : AKAudioFile!
    var marimba : AKAudioFile!
    var audioPlayer : AKAudioPlayer!
    //    button players
    //    row a - g & columns 1 - 4
//    var player_a1: AKAudioPlayer!
//    var player_a2: AKAudioPlayer!
//    var player_a3: AKAudioPlayer!
//    var player_a4: AKAudioPlayer!
//    var player_b1: AKAudioPlayer!
//    var player_b2: AKAudioPlayer!
//    var player_b3: AKAudioPlayer!
//    var player_b4: AKAudioPlayer!
//    var player_c1: AKAudioPlayer!
//    var player_c2: AKAudioPlayer!
//    var player_c3: AKAudioPlayer!
//    var player_c4: AKAudioPlayer!
//    var player_d1: AKAudioPlayer!
//    var player_d2: AKAudioPlayer!
//    var player_d3: AKAudioPlayer!
//    var player_d4: AKAudioPlayer!
//    var player_e1: AKAudioPlayer!
//    var player_e2: AKAudioPlayer!
//    var player_e3: AKAudioPlayer!
//    var player_e4: AKAudioPlayer!
//    var player_f1: AKAudioPlayer!
//    var player_f2: AKAudioPlayer!
//    var player_f3: AKAudioPlayer!
//    var player_f4: AKAudioPlayer!
//    var player_g1: AKAudioPlayer!
//    var player_g2: AKAudioPlayer!
//    var player_g3: AKAudioPlayer!
//    var player_g4: AKAudioPlayer!
    //    array of the above audio players listed
    var arrayOfAudioPlayers = [AKAudioPlayer!]()
//    Sampler
    var sampler : AKSampler!
//    Time Pitch
    var timePitch : AKTimePitch!
    var pitchVariation : Double!
//    button function identifiers
    var beenPlayed: Bool!
    var lastPressed : String!
    var buttonID : String!
    
    var marimbaSampler : AKSampler!
    var eightOhEightSampler : AKSampler!
    
    var a1Sampler : AKSampler!
    var a2Sampler : AKSampler!
    var a3Sampler : AKSampler!
    var a4Sampler : AKSampler!
    
//    var samplerArray : [AnyObject]
    
    var mixer : AKMixer!
    
    //    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //   ~~~~~~~~~~~~~~~~~~~~~~~ VIEW DID LOAD FUNCTION~~~~~~~~~~~~~~~~~~
    //    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("creating audio files...")
//        marimba = try! AKAudioFile(readFileName: "marimba_c.wav", baseDir: .resources)
//        eightOhEight = try! AKAudioFile(readFileName: "808k_c+1.wav", baseDir: .resources)
        marimbaSampler = AKSampler()
        eightOhEightSampler = AKSampler()
        a1Sampler = AKSampler()
        a2Sampler = AKSampler()
        a3Sampler = AKSampler()
        a4Sampler = AKSampler()
        
//        try! marimbaSampler.loadWav("marimba_c")
//        try! eightOhEightSampler.loadWav("808k_c+1")
        try! a1Sampler.loadWav("marimba_c")
        try! a2Sampler.loadWav("marimba_c")
        try! a3Sampler.loadWav("marimba_c")
        try! a4Sampler.loadWav("marimba_c")
        
    
        
        
        print("adding all ImageViews to array...")
        arrayOfImageViews = [a1image,a2image,a3image,a4image,b1image,b2image,b3image,b4image,c1image,c2image,c3image,c4image,d1image,d2image,d3image,d4image,f1image,f2image,f3image,f4image,g1image,g2image,g3image]
        
        print("assigning white button to all IV's")
        for  imageView in arrayOfImageViews {
            tapColour(thisImage: imageView)
        }
        g4image.image = backButton
        
        print("initializing mixer...")
        
        mixer = AKMixer(a1Sampler, a2Sampler,a3Sampler,a4Sampler)
        mixer.volume = 5.0
        AudioKit.output = mixer
        AudioKit.start()
        
        
        print("viewDidLoad() complete...")
    }

//    ==============================
//    Button Tap Colour Changer Function
//    ==============================
    
    func buttonBlink(identifier: String,  buttonImageView: UIImageView){
        print(identifier + " has been tapped")
        tapColour(thisImage: buttonImageView)
        buttonTimer = Timer.scheduledTimer(timeInterval: buttonColourInterval, target: self, selector: #selector(tapColour2), userInfo: buttonImageView, repeats: false)
    }
    
//    =============================
//    ROW A
//    =============================
    @IBAction func tap_A1(_ sender: Any)
    {
        buttonID = "A1"
        buttonBlink(identifier: buttonID, buttonImageView: a1image)
//        marimbaSampler.play()
        a1Sampler.play(noteNumber: MIDINoteNumber(60))
    }
    @IBAction func tap_A2(_ sender: Any) {
        buttonID = "A2"
        buttonBlink(identifier:buttonID, buttonImageView: a2image)
        //        eightOhEightSampler.play()
        a1Sampler.play(noteNumber: MIDINoteNumber(61))
    }
    
    @IBAction func tap_A3(_ sender: Any) {
        buttonID = "A3"
        buttonBlink(identifier: buttonID, buttonImageView:  a3image)
        //        samplerArray[0].play(noteNumber: 1)
        a1Sampler.play(noteNumber: MIDINoteNumber(62))
    }
    
    @IBAction func tap_A4(_ sender: Any) {
        buttonID = "A4"
        buttonBlink(identifier: buttonID, buttonImageView:  a4image)
        //        samplerArray[1].play(noteNumber: 2)
        a1Sampler.play(noteNumber: MIDINoteNumber(63))
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
    
    
    //   ======================
    //    Pitched Sample Function
    //   ======================
    
    func pitchedSample(buttonName: String,  buttonPitch: Double , audioFile: AKAudioFile, playerIndex: Int) {
        //        let player =  try! AKAudioPlayer(file: audioFile)
        arrayOfAudioPlayers[playerIndex] = try! AKAudioPlayer(file: audioFile)
        if lastPressed !=  buttonName {
            timePitch = AKTimePitch(audioPlayer)
            timePitch.pitch = buttonPitch
            timePitch.rate = 1.0
            timePitch.overlap = 8.0
            //            beenPlayed = !beenPlayed
            lastPressed = buttonName
        }
        
        AudioKit.output = timePitch
        AudioKit.start()
        arrayOfAudioPlayers[playerIndex].play()
    }
    
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
    
    
    @IBAction func goingBack(_ sender: Any) {
        AudioKit.stop()
        AudioKit.engine.stop()
    }
    
    func testFunc(timer: Timer){
        print("test function")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
