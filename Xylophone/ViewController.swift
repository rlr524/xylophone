//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
//
//    // creating a variable in which the AudioPlayer is an optional type
//    var audioPlayer: AVAudioPlayer?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    func playSound() {
//        guard let cSound = Bundle.main.url(forResource: "C", withExtension: "wav") else {return}
//
//        do {
//            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//            try AVAudioSession.sharedInstance().setActive(true)
//            audioPlayer = try AVAudioPlayer(contentsOf: cSound, fileTypeHint: AVFileType.wav.rawValue)
//            guard let audioPlayer = audioPlayer else {return}
//            audioPlayer.play()
//            }
//        catch {
//            print(error)
//            }
//    }
//
//    @IBAction func keyPressed(_ sender: UIButton) {
//        playSound()
//    }
    
// simplified code
    class ViewController: UIViewController {
        
        var player: AVAudioPlayer!

        override func viewDidLoad() {
            super.viewDidLoad()
        }

        @IBAction func keyPressed(_ sender: UIButton) {
            playSound()
        }
        
        func playSound() {
            let url = Bundle.main.url(forResource: "C", withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
                    
        }
    }
}
