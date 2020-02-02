//
//  Audio.swift
//  InteractiveStory
//
//  Created by Francisco Ozuna on 2/2/20.
//  Copyright © 2020 Francisco Ozuna. All rights reserved.
//

import Foundation
import AudioToolbox

extension Story {
    var soundEffectName: String {
        switch self {
        case .droid, .home: return "Happy Ending"
        case .monster: return "Ominous"
        default: return "Page Turn"
        }
    }
    
    var soundEffectURL: URL {
        let path = Bundle.main.path(forResource: soundEffectName, ofType: "wav")!
        return URL(fileURLWithPath: path)
    }
}

class SoundEffectsPlayer {
    var sound: SystemSoundID = 0
    // this is just a type alias for UInt32 or unsigned 32 bit integer.
    
    func playSound(for story: Story) {
        let soundURL = story.soundEffectURL as CFURL
        AudioServicesCreateSystemSoundID(soundURL, &sound)
        //this is a C function (a global function in swift, not associated with any class), &sound refers to a variable to store the sound file, a pointer.
        
        AudioServicesPlaySystemSound(sound)
    }
}
