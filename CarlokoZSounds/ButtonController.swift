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

    @IBOutlet var a1Button: UIButton!
    @IBOutlet var a2Button: UIButton!
    @IBOutlet var a3Button: UIButton!
    @IBOutlet var a4Button: UIButton!
    
    @IBOutlet var b1Button: UIButton!
    @IBOutlet var b2Button: UIButton!
    @IBOutlet var b3Button: UIButton!
    @IBOutlet var b4Button: UIButton!
    
    @IBOutlet var c1Button: UIButton!
    @IBOutlet var c2Button: UIButton!
    @IBOutlet var c3Button: UIButton!
    @IBOutlet var c4Button: UIButton!
    
    @IBOutlet var d1Button: UIButton!
    @IBOutlet var d2Button: UIButton!
    @IBOutlet var d3Button: UIButton!
    @IBOutlet var d4Button: UIButton!
    
    @IBOutlet var e1Button: UIButton!
    @IBOutlet var e2Button: UIButton!
    @IBOutlet var e3Button: UIButton!
    @IBOutlet var e4Button: UIButton!
    
    @IBOutlet var f1Button: UIButton!
    @IBOutlet var f2Button: UIButton!
    @IBOutlet var f3Button: UIButton!
    @IBOutlet var f4Button: UIButton!
    
    
    @IBOutlet var tempoIndicator: UILabel!
    @IBOutlet var reverbLabel: UILabel!
    
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
        
    
        
        
//        print("adding all ImageViews to array...")
//        arrayOfImageViews = [a1image,a2image,a3image,a4image,b1image,b2image,b3image,b4image,c1image,c2image,c3image,c4image,d1image,d2image,d3image,d4image,f1image,f2image,f3image,f4image,g2image,g3image]
//        
//        print("assigning white button to all IV's")
//        for  imageView in arrayOfImageViews {
//            tapColour(thisImage: imageView)
//        }
//        g4image.image = backButton
//        
        print("initializing mixer...")
        
        mixer = AKMixer(a1Sampler, a2Sampler,a3Sampler,a4Sampler)
        mixer.volume = 5.0
        AudioKit.output = mixer
        AudioKit.start()
        
        
        tempoIndicator.text = String("Tempo")
        reverbLabel.text = String("Reverb")
        
        print("viewDidLoad() complete...")
    }

//    ==============================
//    Button Tap Colour Changer Function
//    ==============================
    
    func buttonBlink(identifier: String,  buttonImageView: UIButton){
        print(identifier + " has been tapped")
//        tapColour(thisImage: buttonImageView.imageView)
        buttonTimer = Timer.scheduledTimer(timeInterval: buttonColourInterval, target: self, selector: #selector(tapColour2), userInfo: buttonImageView, repeats: false)
    }
    
//    =============================
//    ROW A
//    =============================
    @IBAction func button_A1(_ sender: Any) {
//        buttonID = "A1"
//        buttonBlink(identifier: buttonID, buttonImageView: a1Button)
        //        marimbaSampler.play()
        a1Sampler.play(noteNumber: MIDINoteNumber(60))
    }
    
    @IBAction func button_A2(_ sender: Any) {
        a1Sampler.play(noteNumber: MIDINoteNumber(61))
    }
    
    @IBAction func button_A3(_ sender: Any) {
        a1Sampler.play(noteNumber: MIDINoteNumber(62))
    }
    
    @IBAction func button_A4(_ sender: Any) {
        a1Sampler.play(noteNumber: MIDINoteNumber(63))
    }
    
    @IBAction func button_B1(_ sender: Any) {
    }
    
    @IBAction func button_B2(_ sender: Any) {
    }
    
    @IBAction func button_B3(_ sender: Any) {
    }
    
    @IBAction func button_B4(_ sender: Any) {
    }
    
    @IBAction func button_C1(_ sender: Any) {
    }
    @IBAction func button_C2(_ sender: Any) {
    }
    @IBAction func button_C3(_ sender: Any) {
    }
    @IBAction func button_C4(_ sender: Any) {
    }
    
    @IBAction func button_D1(_ sender: Any) {
    }
    
    @IBAction func button_D2(_ sender: Any) {
    }
    
    @IBAction func button_D3(_ sender: Any) {
    }
    
    @IBAction func button_D4(_ sender: Any) {
    }
    
    
    @IBAction func button_E1(_ sender: Any) {
    }
    
    @IBAction func button_E2(_ sender: Any) {
    }
    
    @IBAction func button_E3(_ sender: Any) {
    }
    
    @IBAction func button_E4(_ sender: Any) {
    }
    
    @IBAction func button_F1(_ sender: Any) {
    }
    @IBAction func button_F2(_ sender: Any) {
    }
    @IBAction func button_F3(_ sender: Any) {
    }
    @IBAction func button_F4(_ sender: Any) {
    }
    
    
    
    
    @IBAction func button_G1(_ sender: Any) {
        a1Sampler.play(noteNumber: MIDINoteNumber(60))
    }
    
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
    
//    func tapColour( thisButton: UIButton){
//        print("changing button colour")
//        if (thisButton.backgroundImage(for: .normal) == whiteButton){
//            thisButton.backgroundImage(for: .normal) = redButton
//        } else {
//            thisButton.backgroundImage(for: .normal)  = whiteButton
//        }
//    }
    
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
    
    @IBAction func setTempo(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Enter text:"
            textField.isSecureTextEntry = true // for password input
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func testFunc(timer: Timer){
        print("test function")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
