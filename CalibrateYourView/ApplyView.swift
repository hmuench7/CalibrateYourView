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
//    @State var speakSelection = UIAccessibility.isSpeakSelectionEnabled;
//    @State var speakScreen = UIAccessibility.isSpeakScreenEnabled;
    //@State var highlightContent = false; Display with speakSelection or speakScreen
    @Environment(\.colorScheme) private var colorScheme;
    //@State var trueTone = UIAccessibility.;
    //@State var displayZoom = UIAccessibility;
//    @State var onOffLabels = UIAccessibility.isOnOffSwitchLabelsEnabled;
//    @State var reduceTransparency = UIAccessibility.isReduceTransparencyEnabled;
//    @State var increaseContrast = UIAccessibility.isDarkerSystemColorsEnabled;
//    @Environment(\.accessibilityDifferentiateWithoutColor) private var differentiateWithoutColor
    //@State var reduceWhitePoint = UIAccessibility;
    //@State var onOffAutoBrightness = ;
//    @Environment(\.accessibilityReduceMotion) private var reduceMotion;
    //@State var autoPlayMessageEffects = ;
    //@State var dimFlashingLights = ;
//    @State var autoPlayVideoPreviews = UIAccessibility.isVideoAutoplayEnabled;
    //@State var limitFramerate = false;
    
    
    
    var body: some View {
        ZStack {
            // Set Background
            Colors.SetBackground(isDarkmode: colorScheme == .dark)
            VStack {
                SettingsToApply
                
                SingleNavButton(label: "Back to Profiles",
                                destination: { ProfilesView() },
                                action: {},
                                isDarkmode: colorScheme == .dark)
            }
            .padding()
        }
    }
    
    var SettingsToApply: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Colors.GetBackground2(isDarkmode: colorScheme == .dark))
            let url = URL(string: UIApplication.openSettingsURLString)
            // Scrollable Settings Section
            ScrollView(.vertical, showsIndicators: false) {
                Text("How To Apply Settings")
                    .font(.system(size: 20, weight: .bold))
                    .padding()
                if currentProfile.isBold != boldText {
                    Text("To Enable the Bold Text Setting")
                    Link("Navigate to \"Settings > Display and Brightness\"",
                    destination: url!)
                    Text("Select the toggle next to \"Bold Text\"")
                    Divider()
                }
                if currentProfile.darkmode != (colorScheme == .dark) {
                    Text("To Enable the Dark Mode Setting")
                    Link("Navigate to Settings > Display and Brightness",
                    destination: url!)
                    Text("Select \"Dark\" in the Appearance Header")
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
                if !(currentProfile.isBold != boldText && currentProfile.darkmode != (colorScheme == .dark) && currentProfile.largerText) {
                    Text("Yay! You have applied all the settings of this profile. Please click the button at the bottom to go back to the Profiles page.")
                }
            }
            .padding()
        }
    }
}

struct ApplyView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyView(currentProfile: Profile(name:"New Profile", symbol:"👾"))
    }
}
