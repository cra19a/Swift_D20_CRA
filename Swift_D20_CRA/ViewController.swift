//
//  ViewController.swift
//  Swift_D20_CRA
//
//  Created by Clayton Arnett on 11/15/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var diceImageView: UIImageView!
    @IBOutlet var criticalLabel: UILabel!
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonGotPressed() {
        rollDice()
        
        
    }
    
    func rollDice() {
        
        // print("They see me rollin... they hatin")
        
        let rolledNumber = Int.random(in: 1...20)
        let imageName = "d\(rolledNumber)"
        diceImageView.image = UIImage(named: imageName)
        
        switch imageName {
        case ("d1"):
            criticalLabel.isHidden = false
            criticalLabel.text = "Critical Miss!"
            let pathToSound = Bundle.main.path(forResource: "failwah", ofType: "mp3")!

            let url = URL(fileURLWithPath: pathToSound)
                    
            do
            {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
            catch
            {
                print("error")
            }
            
        case ("d20"):
            criticalLabel.isHidden = false
            criticalLabel.text = "Critical Hit!"
            let pathToSound = Bundle.main.path(forResource: "torpedo", ofType: "mp3")!

            let url = URL(fileURLWithPath: pathToSound)
                    
            do
            {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
            catch
            {
                print("error")
            }
            
        default:
            criticalLabel.isHidden = true
            let pathToSound = Bundle.main.path(forResource: "rolldice", ofType: "mp3")!
            
            let url = URL(fileURLWithPath: pathToSound)
            do
            {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
            catch
            {
                print("error")
            }
        }
        
        // need sounds for rolling, crit hit, and crit miss
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice()
    }
    
}

