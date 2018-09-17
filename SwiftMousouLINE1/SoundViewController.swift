//
//  SoundViewController.swift
//  SwiftMousouLINE1
//
//  Created by 舟木正憲 on 2018/09/17.
//  Copyright © 2018年 masanori. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {

    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var imageView2: UIImageView!
    
    var audioPlayer: AVAudioPlayer!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView2.isHidden = true
        
        timeLabel.isHidden = true
        
        if let url = Bundle.main.url(forResource: "callMusic", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                audioPlayer = nil
            }
        } else {
            fatalError("Url is nil.")
        }
        
    }

    @IBAction func tap(_ sender: Any) {
        
        imageView2.isHidden = false
        
        timeLabel.isHidden = false
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCountUp), userInfo: nil, repeats: true)
        
        playBabySound()
        
    }
    
    @objc func timerCountUp(){
        
        count = count + 1
        timeLabel.text = String(count)
        
    }
    
    func playBabySound(){
        if let url = Bundle.main.url(forResource: "baby", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                audioPlayer = nil
            }
        } else {
            fatalError("Url is nil.")
        }
    }
    
    @IBAction func deny(_ sender: Any) {
        
        audioPlayer?.stop()
        
        dismiss(animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    

}
