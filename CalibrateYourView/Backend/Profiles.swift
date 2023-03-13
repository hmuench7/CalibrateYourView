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

struct Profile: Identifiable {
    let id = UUID() // do not change
    
    // TODO: place data here
    // TODO: Emoji
    let name: String
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
