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
    // current format: name|symbol
    return (p.name + "|" + String(p.symbol))
}

// turns single string-formatted profile into Profile
func StringToProfile(str: String) -> Profile {
    // current format: name|symbol
    let profileArray = str.components(separatedBy: "|")
    let name = profileArray[0]
    let symbol = profileArray[1]
    return Profile(name: name, symbol: symbol.first!)
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
    let name: String
    let symbol: Character // emoji symbol
    
    // TODO: place data here
    
}


func SetFontSize(fontSize: Float)
{
    let defaults = UserDefaults.standard
    defaults.set(fontSize, forKey: "fontSize")
}

func FontSize() -> Float
{
    let defaults = UserDefaults.standard
    if (isKeyPresentInUserDefaults(key: "fontSize"))
    {
        return defaults.float(forKey: "fontSize")
    }
    else
    {
        return defaultFontSize
    }
}

func SetIsBold(isBold: Bool)
{
    let defaults = UserDefaults.standard
    defaults.set(isBold, forKey: "isBold")
}

func IsBold() -> Bool
{
    let defaults = UserDefaults.standard
    if (isKeyPresentInUserDefaults(key: "isBold"))
    {
        return defaults.bool(forKey: "isBold")
    }
    else
    {
        return defaultIsBold
    }
}

func SetSampleText(sampleText: String)
{
    let defaults = UserDefaults.standard
    defaults.set(sampleText, forKey: "sampleText")
}

func SampleText() -> String
{
    let defaults = UserDefaults.standard
    return ((defaults.string(forKey: "sampleText") ?? defaultSampleText))
}

func isKeyPresentInUserDefaults(key: String) -> Bool {
    return UserDefaults.standard.object(forKey: key) != nil
}
