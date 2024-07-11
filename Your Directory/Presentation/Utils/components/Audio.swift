//
//  Audio.swift
//  Your Directory
//
//  Created by LuanNT29 on 21/06/2024.
//

import Foundation
import AVFoundation
import AVFAudio

class SoundManager {
    static let shared = SoundManager()
    var audioPlayer: AVPlayer?

    func playSound(sound: String){
        if let url = URL(string: sound) {
            self.audioPlayer = AVPlayer(url: url)
        }
    }
}
