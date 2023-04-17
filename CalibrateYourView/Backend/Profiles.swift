//
//  Profiles.swift
//  CalibrateYourView
//
//  Contributors:   Nick Matthews
//                  Nate Taylor
//

import Foundation
import SwiftUI

// defaults
let defaultFontSize: Float = 22.0
let defaultIsBold: Bool = false
let defaultSampleText: String = "The quick brown fox jumps over the lazy dog."
let defaultUseDyslexieFont: Bool = false
let defaultDarkMode = false
let defaultLargerText = false

// auto play & auto brightness default on

// turns single Profile into string format
func ProfileToString(p: Profile) -> String {
    return "\(p.customID)|\(p.name)|\(p.symbol)\(p.description)"
}

// turns single string-formatted profile into Profile
func StringToProfile(str: String) -> Profile {
    // current format: name|symbol|sampleText|
    let profileArray = str.components(separatedBy: "|")
    
    let customID = UUID(uuidString: profileArray[0]) ?? UUID()
    let name = profileArray[1]
    let symbol = profileArray[2].first!
    let sampleText = profileArray[3]
    let fontSize: Float = Float(profileArray[4]) ?? defaultFontSize
    let isBold: Bool = Bool(profileArray[5]) ?? defaultIsBold
    let dys: Bool = Bool(profileArray[6]) ?? defaultUseDyslexieFont
    let darkmode = Bool(profileArray[7]) ?? defaultDarkMode
    let larger = Bool(profileArray[8]) ?? defaultLargerText
    
    return Profile(customID: customID, name: name, symbol: symbol, sampleText: sampleText,
                   fontSize: fontSize, isBold: isBold, useDyslexieFont: dys, darkmode: darkmode,
                   largerText: larger)
}

// stores entire array of Profiles into UserDefaults
func StoreProfiles(_ profiles: [Profile])
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
    return profileArray
}

public struct Profile: Identifiable {
    public var id = UUID() // do not change
    var customID = UUID() // temporarily jank fix for replacing
    var name: String
    var symbol: Character // emoji symbol
    
    // User settings
    var sampleText: String = defaultSampleText
    var fontSize: Float = defaultFontSize
    var isBold: Bool = defaultIsBold
    var useDyslexieFont: Bool = defaultUseDyslexieFont
    var darkmode: Bool = defaultDarkMode
    var largerText: Bool = defaultLargerText
    
    // TODO: insert setting declarations here
    
    var description: String {
        let userSettings = [sampleText, fontSize, isBold, useDyslexieFont,
                            darkmode, largerText // TODO: insert setting keywords here
                            ] as [Any]
        var str: String = ""
        
        userSettings.forEach { setting in
            str.append("|\(setting)")
        }
        
        return str
    }
}
