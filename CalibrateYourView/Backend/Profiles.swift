//
//  Profiles.swift
//  CalibrateYourView
//
//  Contributors:   Nick Matthews
//

import Foundation
import SwiftUI

// defaults
var defaultFontSize: Float = 22.0
var defaultIsBold: Bool = false
var defaultSampleText: String = "The quick brown fox jumps over the lazy dog."
// auto play & auto brightness default on

public var profiles: [Profile] = []

// loads array of Profiles
struct ProfileArray {
    let profiles: [Profile] = LoadProfiles()
}

// turns single Profile into string format
func ProfileToString(p: Profile) -> String {
    return "\(p.name)|\(p.symbol)\(p.description)"
}

// turns single string-formatted profile into Profile
func StringToProfile(str: String) -> Profile {
    // current format: name|symbol|sampleText|
    let profileArray = str.components(separatedBy: "|")
    
    let name = profileArray[0]
    let symbol = profileArray[1].first!
    let sampleText = profileArray[2]
    let fontSize: Float = Float(profileArray[3]) ?? defaultFontSize
    let isBold: Bool = Bool(profileArray[4]) ?? defaultIsBold
    
    return Profile(name: name, symbol: symbol, sampleText: sampleText,
                   fontSize: fontSize, isBold: isBold)
}

// stores entire array of Profiles into UserDefaults
func StoreProfiles()
{
    let defaults = UserDefaults.standard
    let pa = profiles
    
    // turn ProfileArray into array of strings
    var profilesToString = [String]()
    for p in pa {
        profilesToString.append(ProfileToString(p: p))
    }
    
    // store array of strings into defaults
    defaults.set(profilesToString, forKey: "profiles")
}

// loads entire array of Profiles from userdefaults
func LoadProfiles() -> [Profile] {
    let defaults = UserDefaults.standard
    
    // load array of strings from defaults
    let profileStrings = defaults.stringArray(forKey: "profiles") ?? []
    var profileArray = [Profile]()
    
    // turn profilesToString into array of Profiles
    for str in profileStrings {
        profileArray.append(StringToProfile(str: str))
    }
    
    // return array of Profiles
    profiles = profileArray
    return profileArray
}

// TODO: find specific profile from ProfileArray
func FindProfileInfo(id: UUID) -> Profile {
    return Profile(name: "n", symbol: "s" )
}

public struct Profile: Identifiable {
    public let id = UUID() // do not change
    var name: String
    var symbol: Character // emoji symbol
    
    // User settings
    var sampleText: String = defaultSampleText
    var fontSize: Float = defaultFontSize
    var isBold: Bool = defaultIsBold
    
    // TODO: insert setting declarations here
    
    var description: String {
        let userSettings = [sampleText, fontSize, isBold
                            // TODO: insert setting keywords here
                            ] as [Any]
        var str: String = ""
        
        userSettings.forEach { setting in
            str.append("|\(setting)")
        }
        
        print(str)
        return str
    }
}
