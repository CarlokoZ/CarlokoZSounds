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
    var buttonID : String!
//    
//    var marimbaSampler : AKSampler!
//    var eightOhEightSampler : AKSampler!
    
    var a1Sampler : AKSampler!
    var a2Sampler : AKSampler!
    var a3Sampler : AKSampler!
    var a4Sampler : AKSampler!
    var b1Sampler : AKSampler!
    var b2Sampler : AKSampler!
    var b3Sampler : AKSampler!
    var b4Sampler : AKSampler!
    var c1Sampler : AKSampler!
    var c2Sampler : AKSampler!
    var c3Sampler : AKSampler!
    var c4Sampler : AKSampler!
    var d1Sampler : AKSampler!
    var d2Sampler : AKSampler!
    var d3Sampler : AKSampler!
    var d4Sampler : AKSampler!
    var e1Sampler : AKSampler!
    var e2Sampler : AKSampler!
    var e3Sampler : AKSampler!
    var e4Sampler : AKSampler!
    var f1Sampler : AKSampler!
    var f2Sampler : AKSampler!
    var f3Sampler : AKSampler!
    var f4Sampler : AKSampler!
    var g1Sampler : AKSampler!
//    var g2Sampler : AKSampler!
//    var g3Sampler : AKSampler!
//    var g4Sampler : AKSampler!
    
//    var samplerArray : [AnyObject]
    
    var mixer : AKMixer!
    
    //    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //   ~~~~~~~~~~~~~~~~~~~~~~~ VIEW DID LOAD FUNCTION~~~~~~~~~~~~~~~~~~
    //    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    override func viewDidLoad() {
        super.viewDidLoad()
        beenPlayed = false
        
        print("creating audio files...")
//        marimba = try! AKAudioFile(readFileName: "marimba_c.wav", baseDir: .resources)
////        eightOhEight = try! AKAudioFile(readFileName: "808k_c+1.wav", baseDir: .resources)
//        marimbaSampler = AKSampler()
//        eightOhEightSampler = AKSampler()
        a1Sampler = AKSampler()
//        a2Sampler = AKSampler()
//        a3Sampler = AKSampler()
//        a4Sampler = AKSampler()
        b1Sampler = AKSampler()
//        b2Sampler = AKSampler()
        b3Sampler = AKSampler()
//        b4Sampler = AKSampler()
        c1Sampler = AKSampler()
        c2Sampler = AKSampler()
        c3Sampler = AKSampler()
//        c4Sampler = AKSampler()
        d1Sampler = AKSampler()
//        d2Sampler = AKSampler()
//        d3Sampler = AKSampler()
//        d4Sampler = AKSampler()
//        e1Sampler = AKSampler()
//        e2Sampler = AKSampler()
//        e3Sampler = AKSampler()
//        e4Sampler = AKSampler()
        f1Sampler = AKSampler()
        f2Sampler = AKSampler()
//        f3Sampler = AKSampler()
//        f4Sampler = AKSampler()
        g1Sampler = AKSampler()
        
        try! a1Sampler.loadWav("marimba_c")
//        try! a2Sampler.loadWav("marimba_c")
//        try! a3Sampler.loadWav("marimba_c")
//        try! a4Sampler.loadWav("marimba_c")
        
        try! b1Sampler.loadWav("hat")
//        try! b2Sampler.loadWav("hat")
        try! b3Sampler.loadWav("snare")
//        try! b4Sampler.loadWav("shat")
        
        try! c1Sampler.loadWav("SL_808K_C4")
        try! c2Sampler.loadWav("kick")
        try! c3Sampler.loadWav("digibell")
//        try! c4Sampler.loadWav("SL_808K_C4")
//        
        try! d1Sampler.loadWav("ph")
//        try! d2Sampler.loadWav("snare")
//        try! d3Sampler.loadWav("clave")
//        try! d4Sampler.loadWav("clave")
//        
//        try! e1Sampler.loadWav("kick")
//        try! e2Sampler.loadWav("kick")
//        try! e3Sampler.loadWav("kick")
//        try! e4Sampler.loadWav("kick")
//        
        try! f1Sampler.loadWav("weh_choir_cMinor5th")
        try! f2Sampler.loadWav("weh_choir_cMajor5th")
//        try! f3Sampler.loadWav("blown_tm_a")
//        try! f4Sampler.loadWav("blown_tm_b")
//        
        try! g1Sampler.loadWav("2k11")
        
    
        
        
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
        
        mixer = AKMixer(a1Sampler, a2Sampler,a3Sampler,a4Sampler,b1Sampler,b2Sampler,b3Sampler,b4Sampler,c1Sampler,c2Sampler,c3Sampler,c4Sampler,d1Sampler,d2Sampler,d3Sampler,d4Sampler,e1Sampler,e2Sampler,e3Sampler,e4Sampler,f1Sampler,f2Sampler,f3Sampler,f4Sampler,g1Sampler)
        mixer.volume = 5.0
        AudioKit.output = mixer
        AudioKit.start()
        
        
//        tempoIndicator.text = String("Tempo")
//        reverbLabel.text = String("Reverb")
        
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
        b1Sampler.play(noteNumber: MIDINoteNumber(60))
    }
    
    @IBAction func button_B2(_ sender: Any) {
        b1Sampler.play(noteNumber: MIDINoteNumber(62))
    }
    
    @IBAction func button_B3(_ sender: Any) {
        b3Sampler.play(noteNumber: MIDINoteNumber(60))
    }
    
    @IBAction func button_B4(_ sender: Any) {
        b3Sampler.play(noteNumber: MIDINoteNumber(62))
    }
    
    @IBAction func row_C(_ sender: Any) {
        c1Sampler.stop()
//        c1 only for now
    }
    
    @IBAction func button_C1(_ sender: Any) {
        c1Sampler.play()
    }
    
    @IBAction func button_C2(_ sender: Any) {
        c2Sampler.play()
    }
    @IBAction func button_C3(_ sender: Any) {
        c3Sampler.play(noteNumber:MIDINoteNumber(60))
    }
    @IBAction func button_C4(_ sender: Any) {
        c3Sampler.play(noteNumber:MIDINoteNumber(62))
    }
    
    @IBAction func button_D1(_ sender: Any) {
        d1Sampler.play(noteNumber:MIDINoteNumber(60))
    }
    
    @IBAction func button_D2(_ sender: Any) {
        d1Sampler.play(noteNumber:MIDINoteNumber(62))
    }
    
    @IBAction func button_D3(_ sender: Any) {
        d1Sampler.play(noteNumber:MIDINoteNumber(64))
    }
    
    @IBAction func button_D4(_ sender: Any) {
        d1Sampler.play(noteNumber:MIDINoteNumber(65))
    }
    
    
    @IBAction func button_E1(_ sender: Any) {
        d1Sampler.play(noteNumber:MIDINoteNumber(59))
    }
    
    @IBAction func button_E2(_ sender: Any) {
        d1Sampler.play(noteNumber:MIDINoteNumber(57))
    }
    
    @IBAction func button_E3(_ sender: Any) {
        d1Sampler.play(noteNumber:MIDINoteNumber(55))
    }
    
    @IBAction func button_E4(_ sender: Any) {
        d1Sampler.play(noteNumber:MIDINoteNumber(53))
    }
    
    @IBAction func button_F1(_ sender: Any) {
        f1Sampler.play(noteNumber: MIDINoteNumber(60))
    }
    @IBAction func button_F2(_ sender: Any) {
        f2Sampler.play(noteNumber: MIDINoteNumber(60))
    }
    @IBAction func button_F3(_ sender: Any) {
        f1Sampler.play(noteNumber: MIDINoteNumber(64))
    }
    @IBAction func button_F4(_ sender: Any) {
        f2Sampler.play(noteNumber: MIDINoteNumber(64))
    }
    
    
    
    
    @IBAction func button_G1(_ sender: Any) {
        if beenPlayed == false {
            beenPlayed = true
            g1Sampler.play(noteNumber: MIDINoteNumber(60))
        } else{
            beenPlayed = false
            g1Sampler.stop()
        }
    }
    
    @IBAction func button_G2(_ sender: Any) {
        //reverb()
    }
    
    @IBAction func button_G3(_ sender: Any) {
        setTempo()
    }
    
    @IBAction func button_G4(_ sender: Any) {
        goingBack()
    }
    
    
    
    //   ======================
    //    Pitched Sample Function
    //   ======================
    
//    func pitchedSample(buttonName: String,  buttonPitch: Double , audioFile: AKAudioFile, playerIndex: Int) {
//        //        let player =  try! AKAudioPlayer(file: audioFile)
//        arrayOfAudioPlayers[playerIndex] = try! AKAudioPlayer(file: audioFile)
//        if lastPressed !=  buttonName {
//            timePitch = AKTimePitch(audioPlayer)
//            timePitch.pitch = buttonPitch
//            timePitch.rate = 1.0
//            timePitch.overlap = 8.0
//            //            beenPlayed = !beenPlayed
//            lastPressed = buttonName
//        }
//        
//        AudioKit.output = timePitch
//        AudioKit.start()
//        arrayOfAudioPlayers[playerIndex].play()
//    }
    
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
    
    
func goingBack() {
        AudioKit.stop()
        AudioKit.engine.stop()
    }
    
    func setTempo() {
        let alert = UIAlertController(title: "Sequencer Tempo", message: "Enter sequencer tempo:", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Set", style: UIAlertActionStyle.default, handler: nil))
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Enter tempo:"
            textField.isSecureTextEntry = false // for password input
            textField.keyboardType = UIKeyboardType.numberPad
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
