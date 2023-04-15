//
//  ApplyView.swift
//  CalibrateYourView
//
//  Created by Hunter Muench on 4/10/23.
//

import SwiftUI
import MediaAccessibility

struct ApplyView: View {
    
    @State var currentProfile: Profile
    
    @State var boldText = UIAccessibility.isBoldTextEnabled;
    //@State var dyslexieFont = false;
    @State var speakSelection = UIAccessibility.isSpeakSelectionEnabled;
    @State var speakScreen = UIAccessibility.isSpeakScreenEnabled;
    //@State var highlightContent = false; Display with speakSelection or speakScreen
    @Environment(\.colorScheme) private var colorScheme;
    //@State var trueTone = UIAccessibility.;
    //@State var displayZoom = UIAccessibility;
    @State var onOffLabels = UIAccessibility.isOnOffSwitchLabelsEnabled;
    @State var reduceTransparency = UIAccessibility.isReduceTransparencyEnabled;
    @State var increaseContrast = UIAccessibility.isDarkerSystemColorsEnabled;
    @Environment(\.accessibilityDifferentiateWithoutColor) private var differentiateWithoutColor
    //@State var reduceWhitePoint = UIAccessibility;
    //@State var onOffAutoBrightness = ;
    @Environment(\.accessibilityReduceMotion) private var reduceMotion;
    //@State var autoPlayMessageEffects = ;
    //@State var dimFlashingLights = ;
    @State var autoPlayVideoPreviews = UIAccessibility.isVideoAutoplayEnabled;
    //@State var limitFramerate = false;
    
    
    
    var body: some View {
        ZStack {
            // Set Background
            Colors.SetBackground(isDarkmode: colorScheme == .dark)
            SettingsToApply
        }
    }
    
    var SettingsToApply: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Colors.GetBackground2(isDarkmode: colorScheme == .dark))

            // Scrollable Settings Section
            ScrollView(.vertical, showsIndicators: false) {
                Text("How To Apply Settings")
                    .font(.system(size: 20, weight: .bold))
                if true {
                    Text("Setting")
                }
            }
            .padding()
        }
        .padding()
    }
}

struct ApplyView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyView(currentProfile: Profile(name:"New Profile", symbol:"👾"))
    }
}
