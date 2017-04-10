//
//  ButtonController.swift
//  CarlokoZSounds
//
//  Created by Carlos Rado on 2017-04-08.
//  Copyright © 2017 Carlos Rado. All rights reserved.
//

import UIKit

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
    var whiteButton = UIImage(named: "button.png")
    var redButton = UIImage(named: "button_r.png")
    var greenButton = UIImage(named: "button_g.png")
    var yellowButton = UIImage(named: "button_y.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    @IBAction func tap_A1(_ sender: Any) {
        print("A1 has been tapped")
        tapColour(thisImage: a1image)
    }

    @IBAction func tap_A2(_ sender: Any) {
        print("A2 has been tapped")
        buttonTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tapColour), userInfo: 50, repeats: true)
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
