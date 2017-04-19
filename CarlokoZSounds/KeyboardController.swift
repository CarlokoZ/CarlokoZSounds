//
//  KeyboardController.swift
//  CarlokoZSounds
//
//  Created by Carlos Rado on 2017-04-14.
//  Copyright © 2017 Carlos Rado. All rights reserved.
//

import UIKit
//import AVFoundation
import AudioKit

class KeyboardController: UIViewController {
    
    var key_c : AKSampler!
    var key_cSharp :AKSampler!
    var key_d : AKSampler!
    var key_dSharp :AKSampler!
    var key_e : AKSampler!
    var key_f : AKSampler!
    var key_fSharp :AKSampler!
    var key_g : AKSampler!
    var key_gSharp :AKSampler!
    var key_a : AKSampler!
    var key_aSharp :AKSampler!
    var key_b : AKSampler!
    var key_c2 : AKSampler!
    
    var arrayOfSamplers : [AKSampler] = []
    var keyboardMixer : AKMixer!
    
    let c = 60
    let cSharp = 61
    let d = 62
    let dSharp = 63
    let e = 64
    let f = 65
    let fSharp = 66
    let g = 67
    let gSharp = 68
    let a = 69
    let aSharp = 70
    let b = 71
    let c2 = 72
    
    override func viewDidLoad() {
        super.viewDidLoad()
        key_c = AKSampler()
        key_cSharp = AKSampler()
        key_d = AKSampler()
        key_dSharp = AKSampler()
        key_e  = AKSampler()
        key_f = AKSampler()
        key_fSharp = AKSampler()
        key_g = AKSampler()
        key_gSharp = AKSampler()
        key_a = AKSampler()
        key_aSharp = AKSampler()
        key_b = AKSampler()
        key_c2 = AKSampler()
        
        arrayOfSamplers = [key_c,key_cSharp,key_d,key_dSharp,key_e,key_f,key_fSharp,key_g,key_gSharp,key_a,key_aSharp,key_b,key_c2]
        
        for i in 0..<arrayOfSamplers.count{
            noteSetup(noteSample: arrayOfSamplers[i])
        }

        keyboardMixer = AKMixer(arrayOfSamplers[0],arrayOfSamplers[1],arrayOfSamplers[2],arrayOfSamplers[3],arrayOfSamplers[4],arrayOfSamplers[5],arrayOfSamplers[6],arrayOfSamplers[7],arrayOfSamplers[8],arrayOfSamplers[9],arrayOfSamplers[10],arrayOfSamplers[11],arrayOfSamplers[12])
        keyboardMixer.volume = 5.0
        AudioKit.output = keyboardMixer
        AudioKit.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func noteSetup(noteSample: AKSampler){
        try! noteSample.loadWav("marimba_c")
    }
    
    func playNote(note: Int){
            let sampleIndex = Int(note - 60)
            arrayOfSamplers[sampleIndex].play(noteNumber: MIDINoteNumber(note))
    }

    @IBAction func noteC(_ sender: Any) {
        playNote(note:c)
    }

    @IBAction func noteCs(_ sender: Any) {
        playNote(note: cSharp)
    }
    
    @IBAction func noteD(_ sender: Any) {
        playNote(note: d)
    }
    @IBAction func noteDs(_ sender: Any) {
        playNote(note: dSharp)
    }
    @IBAction func noteE(_ sender: Any) {
        playNote(note: e)
    }
    @IBAction func noteF(_ sender: Any) {
        playNote(note: f)
    }
    @IBAction func noteFs(_ sender: Any) {
        playNote(note: fSharp)
    }
    @IBAction func noteG(_ sender: Any) {
        playNote(note: g)
    }
    @IBAction func noteGs(_ sender: Any) {
        playNote(note: gSharp)
    }
    @IBAction func noteA(_ sender: Any) {
        playNote(note: a)
    }
    @IBAction func noteAs(_ sender: Any) {
        playNote(note: aSharp)
    }
    @IBAction func noteB(_ sender: Any) {
         playNote(note: b)
    }
    
    @IBAction func noteC2(_ sender: Any) {
        playNote(note: c2)
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
