//
//  ViewController.swift
//  Swift_D20_CRA
//
//  Created by Clayton Arnett on 11/15/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var diceImageView: UIImageView!
    @IBOutlet var criticalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonGotPressed() {
        rollDice()
    }
    
    func rollDice() {
        
        print("They see me rollin... they hatin")
        
        let rolledNumber = Int.random(in: 1...20)
        
        let imageName = "d\(rolledNumber)"
        
        diceImageView.image = UIImage(named: imageName)
        
    }

}

