//
//  ApplyView.swift
//  CalibrateYourView
//
//  Created by Hunter Muench on 4/10/23.
//

import SwiftUI
import MediaAccessibility

struct ApplyView: View {
    
    @Environment(\.openURL) var openURL
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
    @State var url = URL(string: UIApplication.openSettingsURLString)
    
    
    var body: some View {
        ZStack {
            // Set Background
            Colors.SetBackground(isDarkmode: colorScheme == .dark)
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Colors.GetBackground2(isDarkmode: colorScheme == .dark))
                    // Scrollable Settings Section
                    ScrollView(.vertical, showsIndicators: false) {
                        Text("How To Apply Settings")
                            .font(.system(size: 20, weight: .bold))
                        Text("Some settings may disappear as the settings are updated; others are persistent and not disappear")
                        Divider()
                        // Text Settings
                        TextSettings
                        // Display Settings
                        DisplaySettings
                        // Motion Settings
                        MotionSettings
                    }
                    .padding()
                }
                
                SingleNavButton(label: "Back to Profiles",
                                destination: { ProfilesView() },
                                action: { },
                                isDarkmode: colorScheme == .dark)
            }
            .padding()
        }
    }

    var TextSettings: some View {
        VStack {
            if currentProfile.isBold != boldText {
                Text("To Enable Bold Text")
                Link("Navigate to \"Settings > Display and Brightness\"",
                     destination: url!)
                Text("Select the toggle next to \"Bold Text\"")
                Divider()
            }
            if currentProfile.largerText {
                Text("To Enable Larger Text Sizes")
                Link("Navigate to Settings > Accessibility > Display & Text Size > Larger Text",
                     destination: url!)
                Text("Enable the toggle at the top of the page")
                Text("and then change the slider at the bottom")
                Text("to the desired size")
                Divider()
            }
            if currentProfile.speakSelection != speakSelection {
                Text("To Enable Speak Selection")
                Link("Navigate to Settings > Accessibility > Spoken Content",
                     destination: url!)
                Text("Select the toggle next to ")
                Text("\"Speak Selection\"")
                Divider()
            }
            if currentProfile.speakScreen != speakScreen {
                Text("To Enable Speak Screen")
                Link("Navigate to Settings > Accessibility > Spoken Content",
                     destination: url!)
                Text("Select the toggle next to \"Speak Screen\"")
                Divider()
            }
            if (currentProfile.highlightContent && (currentProfile.speakSelection || currentProfile.speakScreen)) {
                Text("To Enable Highlight Content")
                Link("Navigate to Settings > Accessibility > Spoken Content > Highlight Content",
                     destination: url!)
                Text("Select the toggle next to")
                Text("\"Highlight Content\"")
                Divider()
            }
        }
    }
    var DisplaySettings: some View {
        VStack {
            if currentProfile.darkmode != (colorScheme == .dark) {
                Text("To Enable Dark Mode")
                Link("Navigate to Settings > Display and Brightness",
                     destination: url!)
                Text("Select \"Dark\" in the Appearance Header")
                Divider()
            }
            if currentProfile.trueTone {
                Text("To Enable True Tone")
                Link("Navigate to Settings > Display and Brightness",
                     destination: url!)
                Text("Select the toggle next to")
                Text("\"True Tone\" under Brightness")
                Divider()
            }
            if currentProfile.displayZoom {
                Text("To Enable Display Zoom")
                Link("Navigate to Settings > Display and Brightness > Display Zoom",
                     destination: url!)
                Text("Select the desired view")
                Divider()
            }
            if currentProfile.onOffLabels != onOffLabels {
                Text("To Enable On/Off Labels")
                Link("Navigate to Settings > Accessibility > Display & Text Size",
                     destination: url!)
                Text("Select the toggle next to \"On/Off Labels\"")
                Divider()
            }
            if currentProfile.reduceTransparency != reduceTransparency {
                Text("To Enable Reduce Transparency")
                Link("Navigate to Settings > Accessibility > Display & Text Size",
                     destination: url!)
                Text("Select the toggle next to \"Reduce Transparency\"")
                Divider()
            }
            if currentProfile.increaseContrast != increaseContrast {
                Text("To Enable Increase Contrast")
                Link("Navigate to Settings > Accessibility > Display & Text Size",
                     destination: url!)
                Text("Select the toggle next to \"Increase Contrast\"")
                Divider()
            }
            if currentProfile.differentiateWithoutColor != differentiateWithoutColor {
                Text("To Enable Differentiate Without Color")
                Link("Navigate to Settings > Accessibility > Display & Text Size",
                     destination: url!)
                Text("Select the toggle next to \"Differentiate Without Color\"")
                Divider()
            }
            if currentProfile.reduceWhitePoint {
                Text("To Enable Reduce White Point")
                Link("Navigate to Settings > Accessibility > Display & Text Size",
                     destination: url!)
                Text("Select the toggle next to \"Reduce White Point\"")
                Divider()
            }
            if currentProfile.onOffAutoBrightness {
                Text("To Enable Auto Brightness")
                Link("Navigate to Settings > Accessibility > Display & Text Size",
                     destination: url!)
                Text("Select the toggle next to \"Auto-Brightness\"")
                Divider()
            }
        }
    }
    var MotionSettings: some View {
        VStack {
            if currentProfile.reduceMotion != reduceMotion {
                Text("To Enable Reduce Motion")
                Link("Navigate to Settings > Accessibility > Motion",
                     destination: url!)
                Text("Select the toggle next to \"Reduce Motion\"")
                Divider()
            }
            if currentProfile.autoPlayMessageEffects {
                Text("To Enable Auto-Play Message Effects")
                Link("Navigate to Settings > Accessibility > Motion",
                     destination: url!)
                Text("Select the toggle next to \"Auto-Play Message Effects\"")
                Divider()
            }
            if currentProfile.dimFlashingLights {
                Text("To Enable Dim Flashing Lights")
                Link("Navigate to Settings > Accessibility > Motion",
                     destination: url!)
                Text("Select the toggle next to \"Dim Flashing Lights\"")
                Divider()
            }
            if currentProfile.autoPlayMessageEffects != autoPlayVideoPreviews {
                Text("To Enable Auto-Play Video Previews")
                Link("Navigate to Settings > Accessibility > Motion",
                     destination: url!)
                Text("Select the toggle next to \"Auto-Play Video Previews\"")
                Divider()
            }
            if currentProfile.limitFramerate {
                Text("To Enable Limit Framerate")
                Link("Navigate to Settings > Accessibility > Motion",
                     destination: url!)
                Text("Select the toggle next to \"Limit Framerate\"")
                Divider()
            }
        }
    }
}

struct ApplyView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyView(currentProfile: Profile(name:"New Profile", symbol:"👾"))
    }
}
