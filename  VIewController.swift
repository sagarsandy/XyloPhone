//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var arrPlayer: [AVAudioPlayer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
        let url = Bundle.main.url(forResource: "note\(sender.tag)", withExtension: "wav")!
        
        do
        {
            let player = try AVAudioPlayer(contentsOf: url)
            
            arrPlayer.append(player)
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
            
            arrPlayer.last?.prepareToPlay()
            arrPlayer.last?.play()
        }
            
        catch let error
        {
            print(error.localizedDescription)
        }
    }
    
  

}

