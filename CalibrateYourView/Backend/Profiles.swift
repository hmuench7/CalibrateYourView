//
//  Profiles.swift
//  CalibrateYourView
//
//  Contributors:   Nick Matthews
//                  Nate Taylor
//

import Foundation
import SwiftUI

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
    
    // 3 sample, 4 font, 5 bold, 6 dys, 7 larger, 8 speakSel, 9 speakScr, 10 highlight
    let sample = profileArray[3]
    let font: Float = Float(profileArray[4]) ?? defaultFontSize
    let bold: Bool = Bool(profileArray[5]) ?? defaultIsBold
    let dys: Bool = Bool(profileArray[6]) ?? defaultUseDyslexieFont
    let larger = Bool(profileArray[7]) ?? defaultLargerText
    let speakSel = Bool(profileArray[8]) ?? defaultSpeakSelection
    let speakScr = Bool(profileArray[9]) ?? defaultSpeakScreen
    let highlight = Bool(profileArray[10]) ?? defaultHighlightContent
    
    // 11 dark, 12 trueTone, 13 zoom, 14 labels, 15 transp, 16 contrast, 17 diff, 18 whitepoint, 19 autoBright
    let dark = Bool(profileArray[11]) ?? defaultDarkMode
    let trueTone = Bool(profileArray[12]) ?? defaultTrueTone
    let zoom = Bool(profileArray[13]) ?? defaultdisplayZoom
    let labels = Bool(profileArray[14]) ?? defaultonOffLabels
    let transp = Bool(profileArray[15]) ?? defaultreduceTransparency
    let contrast = Bool(profileArray[16]) ?? defaultincreaseContrast
    let diff = Bool(profileArray[17]) ?? defaultdifferentiateWithoutColor
    let whitepoint = Bool(profileArray[18]) ?? defaultreduceWhitePoint
    let autoBright = Bool(profileArray[19]) ?? defaultonOffAutoBrightness
    
    // 20 motion, 21 msgs, 22 flashes, 23 previews, 24 limitfps
    let motion = Bool(profileArray[20]) ?? defaultreduceMotion
    let msgs = Bool(profileArray[21]) ?? defaultautoPlayMessageEffects
    let flashes = Bool(profileArray[22]) ?? defaultdimFlashingLights
    let previews = Bool(profileArray[23]) ?? defaultautoPlayVideoPreviews
    let limitfps = Bool(profileArray[24]) ?? defaultlimitFramerate
    
    return Profile(customID: customID, name: name, symbol: symbol, sampleText: sample, fontSize: font, isBold: bold, useDyslexieFont: dys, largerText: larger,
                   speakSelection: speakSel, speakScreen: speakScr, highlightContent: highlight,
                   darkmode: dark, trueTone: trueTone, displayZoom: zoom, onOffLabels: labels, reduceTransparency: transp, increaseContrast: contrast,
                   differentiateWithoutColor: diff, reduceWhitePoint: whitepoint, onOffAutoBrightness: autoBright,
                   reduceMotion: motion, autoPlayMessageEffects: msgs, dimFlashingLights: flashes, autoPlayVideoPreviews: previews, limitFramerate: limitfps)
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
    
    // Text Settings Bools
    var sampleText: String = defaultSampleText
    var fontSize: Float = defaultFontSize
    var isBold: Bool = defaultIsBold
    var useDyslexieFont: Bool = defaultUseDyslexieFont
    var largerText: Bool = defaultLargerText
    var speakSelection: Bool = defaultSpeakSelection
    var speakScreen: Bool = defaultSpeakScreen
    var highlightContent: Bool = defaultHighlightContent
    // Display Settings Bools
    var darkmode: Bool = defaultDarkMode
    var trueTone: Bool = defaultTrueTone
    var displayZoom: Bool = defaultdisplayZoom
    var onOffLabels: Bool = defaultonOffLabels
    var reduceTransparency: Bool = defaultreduceTransparency
    var increaseContrast: Bool = defaultincreaseContrast
    var differentiateWithoutColor: Bool = defaultdifferentiateWithoutColor
    var reduceWhitePoint: Bool = defaultreduceWhitePoint
    var onOffAutoBrightness: Bool = defaultonOffAutoBrightness
    // Motion settings Bools
    var reduceMotion: Bool = defaultreduceMotion
    var autoPlayMessageEffects: Bool = defaultautoPlayMessageEffects
    var dimFlashingLights: Bool = defaultdimFlashingLights
    var autoPlayVideoPreviews: Bool = defaultautoPlayVideoPreviews
    var limitFramerate: Bool = defaultlimitFramerate
    
    // TODO: insert setting declarations here
    
    var description: String {
        let userSettings = [sampleText, fontSize, isBold, useDyslexieFont, largerText, speakSelection, speakScreen, highlightContent,
                            darkmode, trueTone, displayZoom, onOffLabels, reduceTransparency, increaseContrast, differentiateWithoutColor,
                            reduceWhitePoint, onOffAutoBrightness,
                            reduceMotion, autoPlayMessageEffects, dimFlashingLights, autoPlayVideoPreviews, limitFramerate
                            ] as [Any]
        var str: String = ""
        
        userSettings.forEach { setting in
            str.append("|\(setting)")
        }
        
        return str
    }
}

// default text settings
let defaultFontSize: Float = 22.0
let defaultIsBold: Bool = false
let defaultSampleText: String = "The quick brown fox jumps over the lazy dog."
let defaultUseDyslexieFont: Bool = false
let defaultLargerText = false
let defaultSpeakSelection = false
let defaultSpeakScreen = false
let defaultHighlightContent = false

// default display settings
let defaultDarkMode = false
let defaultTrueTone = true
let defaultdisplayZoom = false
let defaultonOffLabels = false
let defaultreduceTransparency = false
let defaultincreaseContrast = false
let defaultdifferentiateWithoutColor = false
let defaultreduceWhitePoint = false
let defaultonOffAutoBrightness = true

// Motion settings Bools
let defaultreduceMotion = false
let defaultautoPlayMessageEffects = true
let defaultdimFlashingLights = false
let defaultautoPlayVideoPreviews = true
let defaultlimitFramerate = false
