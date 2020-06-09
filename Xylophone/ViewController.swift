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
    
    // creating a variable in which the AudioPlayer is an optional type
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(soundName: String) {
        guard let sound = Bundle.main.url(forResource: soundName, withExtension: "wav") else {return}
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: sound, fileTypeHint: AVFileType.wav.rawValue)
            guard let audioPlayer = audioPlayer else {return}
            audioPlayer.play()
        }
        catch {
            print(error)
        }
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {

//        print(sender.tag)
//        print(sender.backgroundColor ?? "background")
//        print(sender.titleLabel?.text ?? "title")
        // we're using force unwrap on the titleLable.text because we know each button has title label; if we were unsure, we'd coalesce it using ?? and provide a default value, i.e. play "C" if no title; we do this because titleLabel is an optional and could possibly not have a value
        // change bg color to .5 opacity on keydown and change back after 0.5 seconds
        sender.backgroundColor = sender.backgroundColor?.withAlphaComponent(0.5)
        UIView.animate(withDuration: 0.5, animations: {
            sender.backgroundColor = sender.backgroundColor?.withAlphaComponent(1.0)
        })
        playSound(soundName: (sender.titleLabel?.text)!)
    }
    @IBAction func keyPressedTwo(_ sender: UIButton) {
    }
}
    
//// simplified code
//    class ViewController: UIViewController {
//
//        var player: AVAudioPlayer!
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//        }
//
//        @IBAction func keyPressed(_ sender: UIButton) {
//            playSound()
//        }
//
//        func playSound() {
//            let url = Bundle.main.url(forResource: "C", withExtension: "wav")
//            player = try! AVAudioPlayer(contentsOf: url!)
//            player.play()
//
//        }
//    }
