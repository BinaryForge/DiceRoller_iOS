//
//  ViewController.swift
//  DiceRoller
//
//  Created by Alexey Kuznetsov on 6/15/18.
//  Copyright © 2018 Alexey Kuznetsov. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayer: AVAudioPlayer!
    var diceViewL:Int = 0
    var diceViewR:Int = 0
    let diceImgCollection: Array = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    
    //Initialize Dice View
    //IBoutlet = Interface Builder Outlet
    //Sidebar Filled Circle = Connection Exists
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    //Does things when app opens
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDiceImgs()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //IBaction = Interface Builder Action
    @IBAction func rollButtonPress(_ sender: UIButton) {
        playSound()
        updateDiceImgs()
    }
    //Phone Shake Motion rolls Dice
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        playSound()
        updateDiceImgs()
    }
    
    //Updates the Dice Images
    func updateDiceImgs(){
        diceViewL = Int(arc4random_uniform(6))
        diceViewR = Int(arc4random_uniform(6))
        
        diceImageView1.image = UIImage(named: diceImgCollection[diceViewL])
        diceImageView2.image = UIImage(named: diceImgCollection[diceViewR])
    }
    //Plays a sound
    func playSound(){
        let soundUrl = Bundle.main.url(forResource: "diceROLL", withExtension: "mp3")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl!)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
        
    }
    
}

