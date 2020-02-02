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
    
}
