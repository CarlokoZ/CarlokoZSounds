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
    let buttonColourInterval = 0.1
    var whiteButton = UIImage(named: "button.png")
    var redButton = UIImage(named: "button_r.png")
    var greenButton = UIImage(named: "button_g.png")
    var yellowButton = UIImage(named: "button_y.png")
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
    var player_a1: AKAudioPlayer!
    var player_a2: AKAudioPlayer!
    var player_a3: AKAudioPlayer!
    var player_a4: AKAudioPlayer!
    var player_b1: AKAudioPlayer!
    var player_b2: AKAudioPlayer!
    var player_b3: AKAudioPlayer!
    var player_b4: AKAudioPlayer!
    var player_c1: AKAudioPlayer!
    var player_c2: AKAudioPlayer!
    var player_c3: AKAudioPlayer!
    var player_c4: AKAudioPlayer!
    var player_d1: AKAudioPlayer!
    var player_d2: AKAudioPlayer!
    var player_d3: AKAudioPlayer!
    var player_d4: AKAudioPlayer!
    var player_e1: AKAudioPlayer!
    var player_e2: AKAudioPlayer!
    var player_e3: AKAudioPlayer!
    var player_e4: AKAudioPlayer!
    var player_f1: AKAudioPlayer!
    var player_f2: AKAudioPlayer!
    var player_f3: AKAudioPlayer!
    var player_f4: AKAudioPlayer!
    var player_g1: AKAudioPlayer!
    var player_g2: AKAudioPlayer!
    var player_g3: AKAudioPlayer!
    var player_g4: AKAudioPlayer!
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
    
//    note pitches
    var note_c2 : Double!=0
    var note_b1 : Double!=0
    var note_a1Sharp : Double!=0
    var note_a1 : Double!=0
    var note_g1Sharp : Double!=0
    var note_g1 : Double!=0
    var note_f1Sharp : Double!=0
    var note_f1 : Double!=0
    var note_e1 : Double!=0
    var note_d1Sharp : Double!=0
    var note_d1 : Double!=0
    var note_c1Sharp : Double!=0
    var note_c1 : Double!=0
    var note_b0 : Double!=0
    var note_a0Sharp : Double!=0
    var note_a0 : Double!=0
    var note_g0Sharp : Double!=0
    var note_g0 : Double!=0
    var note_f0Sharp : Double!=0
    var note_f0 : Double!=0
    var note_e0 : Double!=0
    var note_d0Sharp : Double!=0
    var note_d0 : Double!=0
    var note_c0Sharp : Double!=0
    var note_c0 : Double!=0
    
//    test variables
    var akAudioFile : AKAudioFile!
    var avAudioFile : AVAudioFile!
    var avAudioPCMBuffer : AVAudioPCMBuffer!
    
    var avAudioEngine: AVAudioEngine!
    var avAudioFilePlayer: AVAudioPlayerNode!
    var playingStarted: Bool!
//    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ VIEW DID LOAD FUNCTION~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        avAudioEngine = AVAudioEngine()
//        avAudioFilePlayer = AVAudioPlayerNode()
        
        print("creating audio file...")
        marimba = try! AKAudioFile(readFileName: "marimba_c.wav", baseDir: .resources)
        
        
//        //        ~~~~~~~~~~~~~~~~CURRENTLY UNUSED~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//        print("adding all ImageViews to array...")
//        arrayOfImageViews = [a1image,a2image,a3image,a4image,b1image,b2image,b3image,b4image,c1image,c2image,c3image,c4image,d1image,d2image,d3image,d4image,f1image,f2image,f3image,f4image,g1image,g2image,g3image,g4image]
//        print("assigning white button to all IV's")
//        for  imageView in arrayOfImageViews {
//            tapColour(thisImage: imageView)
//        }
//        
//        print("putting all the note pitches into an array in incrementing order")
//        pitchVariation = Double(-1200)
//        arrayOfNotePitches = [note_c0, note_c0Sharp, note_d0, note_d0Sharp, note_e0, note_f0, note_f0Sharp, note_g0, note_g0Sharp, note_a0, note_a0Sharp, note_b0, note_c1, note_c1Sharp, note_d1, note_d1Sharp, note_e1, note_f1, note_f1Sharp, note_g1, note_g1Sharp, note_a1, note_a1Sharp, note_b1, note_c2]
//        
//        print("defining note increment")
//        let semitonesInNote : Double! = 100
//        
//        print("adding pitch values to each note in array in the same order...")
//        for i in 0 ..< arrayOfNotePitches.count {
//            arrayOfNotePitches[i] = pitchVariation
//            pitchVariation.add(semitonesInNote)
//            let debugString : String = "setting semitones for note:  " + String(i)
//            print(debugString)
//            print(arrayOfNotePitches[i].debugDescription)
//        }
//        
//        print("assigning audio player for each note...")
//        arrayOfAudioPlayers = [player_a1, player_a2, player_a3,  player_a4,player_b1, player_b2, player_b3,  player_b4, player_c1, player_c2, player_c3,  player_c4,player_d1, player_d2, player_d3,  player_d4,player_e1, player_e2, player_e3,  player_e4,player_f1, player_f2, player_f3,  player_f4,player_g1, player_g2, player_g3,  player_g4]
//        let numberOfAPs : String = "number of Audio Players in array: " + String(arrayOfAudioPlayers.count)
//        print(numberOfAPs)
//        
//        for i in 0..<arrayOfAudioPlayers.count {
//            arrayOfAudioPlayers[i] = try! AKAudioPlayer(file: self.marimba)
//        }
//        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        
//        sampler = AKSampler()
//        lastPressed = ""
//        eightOhEight = try! AKAudioFile(readFileName: "marimba_c.wav", baseDir: .resources)
//        audioPlayer = try! AKAudioPlayer(file: self.eightOhEight)
        
//        try! self.sampler.loadAudioFile(marimba)
        print("initializing mixer...")
//        let mixer = AKMixer(arrayOfAudioPlayers[0],arrayOfAudioPlayers[1])
        let mixer = AKMixer(audioPlayer)
        AudioKit.output = mixer
        AudioKit.start()
        
//        ~~~~~~~~~~~~~~~~~AV FILE CONVERSION TESTING~~~~~~~~~~~~~~~~~~~~~~~~
//        print("TESTING AudioFile conversion")
//        
//        akAudioFile = try! AKAudioFile(readFileName: "marimba_c.wav", baseDir: .resources)
//        avAudioFile = akAudioFile as AVAudioFile
//        let fileFormat = avAudioFile.processingFormat
//        let audioFrameCount = UInt32(avAudioFile.length)
//        avAudioPCMBuffer = AVAudioPCMBuffer(pcmFormat: fileFormat, frameCapacity: audioFrameCount)
//        try! avAudioFile.read(into: avAudioPCMBuffer)
//        print("TESTING AudioEngine")
//        let mainMixer = avAudioEngine.mainMixerNode
//        avAudioEngine.attach(avAudioFilePlayer)
//        avAudioEngine.connect(avAudioFilePlayer, to: mainMixer, format: avAudioPCMBuffer.format)
//        try! avAudioEngine.start()
        
//
//        audioFilePlayer.play()
//        audioFilePlayer.scheduleBuffer(audioFileBuffer, atTime: nil, options: nil, completionHandler: nil)

        
        print("viewDidLoad() complete...")
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
    @IBAction func tap_A1(_ sender: Any) {
        buttonBlink(identifier: "A1", buttonImageView: a1image)
        timePitch = AKTimePitch(audioPlayer)
        timePitch.pitch = 1000
        timePitch.rate = 1.0
        
    }

//    OLD CODE FOR A1
//    {
//    buttonBlink(identifier: "A1", buttonImageView: a1image)
//    
//    
//    //        AudioKit.output = audioPlayer
//    //        AudioKit.start()
//    //        audioPlayer.currentTime = 0
//    //        audioPlayer.play()
//    //        if audioPlayer != nil && audioPlayer.isPlaying{
//    //            audioPlayer.stop()
//    ////        }
//    //        if lastPressed != "A1"{
//    //            audioPlayer = arrayOfAudioPlayers[0]
//    //            player_a1 = try! AKAudioPlayer(file: marimba)
//    timePitch = AKTimePitch(arrayOfAudioPlayers[0])
//    timePitch.pitch = 0
//    timePitch.rate = 1.0
//    timePitch.overlap = 8.0
//    //            lastPressed = "A1"
//    //            }
//    
//    //            AudioKit.output = timePitch
//    //            AudioKit.start()
//    if arrayOfAudioPlayers[0].isPlaying{
//    arrayOfAudioPlayers[0].stop()
//    arrayOfAudioPlayers[0].play(from: 0.0)
//    }
//    arrayOfAudioPlayers[0].play(from: 0.0)
//    
//    //            AudioKit.output = sampler
//    //            AudioKit.start()
//    //            sampler.play()
//    //            lastPressed = "A1"
//    //        } else {
//    //            sampler.play()
//    //        }
//    }
    
    @IBAction func tap_A2(_ sender: Any) {
        buttonBlink(identifier: "A2", buttonImageView: a2image)

//        if audioPlayer != nil && audioPlayer.isPlaying{
//            audioPlayer.replace(file: )
//        }
        
//        if lastPressed !=  "A2"{
        
            timePitch = AKTimePitch(arrayOfAudioPlayers[1])
            timePitch.pitch = 1000
            timePitch.rate = 1.0
//            timePitch.overlap = 8.0
//            lastPressed = "A2"
//        }
//        
//        AudioKit.output = timePitch
//        AudioKit.start()
        if arrayOfAudioPlayers[1].isPlaying{
            arrayOfAudioPlayers[1].stop()
        }
        arrayOfAudioPlayers[1].play()
        
    }
    
    @IBAction func tap_A3(_ sender: Any) {
        buttonID = "A3"
        buttonBlink(identifier: buttonID, buttonImageView:  a3image)
//        pitchedSample(buttonName: "A3", buttonPitch: note_d1, audioFile: marimba, playerIndex: 2)
        avAudioFilePlayer.play()
    }
    
    @IBAction func tap_A4(_ sender: Any) {
        buttonID = "A4"
        buttonBlink(identifier: buttonID, buttonImageView:  a4image)
        
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
