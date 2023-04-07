//
//  SettingsView.swift
//  CalibrateYourView
//
//  Contributers:   Nathan Taylor
//                  Hunter Muench
//                  Jonah Hood Blaxill
//                  Nick Matthews
//

import SwiftUI

struct SettingsView: View {
    
    @State var currentProfile: Profile
    @State var newProfile: Bool
    
    @State var infoTextToggle = false;
    @State var textSettings = false;
    @State var displaySettings = false;
    @State var motionSettings = false;
    
    // Text Settings Bools
    @State var boldText = false;
    @State var dyslexieFont = false;
    @State var speakSelection = false;
    @State var speakScreen = false;
    @State var highlightContent = false;
    // Display Settings Bools
    @State var darkMode: Bool = false;
    @State var trueTone = true;
    @State var displayZoom = false;
    @State var onOffLabels = false;
    @State var reduceTransparency = false;
    @State var increaseContrast = false;
    @State var differentiateWithoutColor = false;
    @State var reduceWhitePoint = false;
    @State var onOffAutoBrightness = true;
    // Motion settings Bools
    @State var reduceMotion = false;
    @State var autoPlayMessageEffects = true;
    @State var dimFlashingLights = false;
    @State var autoPlayVideoPreviews = true;
    @State var limitFramerate = false;
    
    // get the devices Darkmode/Lightmode setting
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ZStack {
            // Set Background
            Colors.SetBackground(isDarkmode: colorScheme == .dark)
            VStack {
                // Sample Text Box
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Colors.GetBackground2(isDarkmode: colorScheme == .dark))
                    TextEditor(text: $currentProfile.sampleText)
                        .padding()
                        .multilineTextAlignment(.center)
                        .font(.system(size: CGFloat(currentProfile.fontSize),
                                      weight: currentProfile.isBold ? .bold : .regular))
                        .scrollContentBackground(Visibility.hidden)
                }
                    .frame(height: 120)
                SettingsStack
                    .padding(.top)
                // Reset to Defaults Button
                SingleButton(label: "Reset to Defaults", buttonAction: {
                    // Reset settings to defaults
                    // TODO: add a defaults class or define constants or something?
                    currentProfile.fontSize = defaultFontSize
                    currentProfile.isBold = defaultIsBold
                    currentProfile.sampleText = defaultSampleText
                    infoTextToggle = false;
                    textSettings = false;
                    displaySettings = false;
                    motionSettings = false;
                    
                    // Text Settings Bools
                    boldText = false;
                    dyslexieFont = false;
                    speakSelection = false;
                    speakScreen = false;
                    highlightContent = false;
                    // Display Settings Bools
                    darkMode = false;
                    trueTone = true;
                    displayZoom = false;
                    onOffLabels = false;
                    reduceTransparency = false;
                    increaseContrast = false;
                    differentiateWithoutColor = false;
                    reduceWhitePoint = false;
                    onOffAutoBrightness = true;
                    // Motion settings Bools
                    reduceMotion = false;
                    autoPlayMessageEffects = true;
                    dimFlashingLights = false;
                    autoPlayVideoPreviews = true;
                    limitFramerate = false;
                    
                }, isDarkmode: colorScheme == .dark)
                
                SingleNavButton(label: "Save Settings",
                                destination: { SaveApplyView(currentProfile: currentProfile, newProfile: newProfile) },
                                action: {},
                                isDarkmode: colorScheme == .dark)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }


    var SettingsStack : some View {
        ZStack { // Settings Stack
            RoundedRectangle(cornerRadius: 10)
                .fill(Colors.GetBackground2(isDarkmode: colorScheme == .dark))

            // Scrollable Settings Section
            ScrollView(.vertical, showsIndicators: false) {
                VStack { // Text Settings Stack==================================
                    Text("Text Settings")
                        .font(.system(size: 20, weight: .bold))
                    // Font Size Slider
                    Slider( value: $currentProfile.fontSize,
                            in: 14...32,
                            step:2,
                            minimumValueLabel: Text("A").font(.system(size: 18)),
                            maximumValueLabel: Text("A").font(.system(size: 24)),
                            label: { Text("") })
                        .tint(.gray)
                    if infoTextToggle {
                        Text("System wide font size")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    }
                    Divider().padding(.top, -2)
                    // Bold Text Toggle
                    CustomToggle(label: "Bold Text", info: "Font weight.", isOn: $boldText)
                    // More settings that are hidden
                    if !textSettings {
                        Button("More \(Image(systemName: "chevron.down"))") { textSettings = true }
                    }
                    else {
                        // Dyslexie Font Toggle
                        CustomToggle(label: "Dyslexie Font", info: "Applies the Dyslexie Font, not system wide (blame Apple).", isOn: $dyslexieFont)
                        // Speak Selection Toggle
                        CustomToggle(label: "Speak Selection", info: "A Speak button will appear when you select text.", isOn: $speakSelection)
                        // Speak Screen Toggle
                        CustomToggle(label: "Speak Screen", info: "Swipe down with two fingers from the top of the screen to hear the content on the screen.", isOn: $speakScreen)
                        // Highlight Content Toggle
                        // only shows up if one of the above two is selected (just like in apples settings)
                        if (speakScreen || speakSelection){ 
                            CustomToggle(label: "Highlight Content", info: "Highlight content as it is spoken.", isOn: $highlightContent)
                        }
                        Button("Less \(Image(systemName: "chevron.up"))") {textSettings = false }
                    }
                            
                }
                .padding()
                
                VStack{ // Display Settings Stack================================
                    Text("Display Settings")
                        .font(.system(size: 20, weight: .bold))
                    
                    //Display Zoom Toggle
                    CustomToggle(label: "Display Zoom", info: "When on shows larger text and controls, when off shows more content.", isOn: $displayZoom)
                    // Increase Contrast Toggle
                    CustomToggle(label: "Increase Contrast", info: "Increase color contrast between app foreground and background colors.", isOn: $increaseContrast)
                    // Dark Mode Toggle
                    CustomToggle(label: "Dark Mode", info: "Dark backgrounds with light text throughtout the system.", isOn: $darkMode)
                    // True Tone Toggle 
                    CustomToggle(label: "True Tone", info: "Automatically adapt iPhone display based on ambient lighting conditions to make colors appear consistent in different environments.", isOn: $trueTone)
                    
                    // Extra less important Settings
                    if !displaySettings {
                        Button("More \(Image(systemName: "chevron.down"))") {displaySettings = true }
                    }
                    else {
                        // Auto-Brightness Toggle
                        CustomToggle(label: "Auto-Brightness", info: "Turning off auto-brightness may affect battery life and long-term display performance.", isOn: $onOffAutoBrightness)
                        // Differentiate Without Color Toggle
                        CustomToggle(label: "Differentiate Without Color", info: "Replaces user interface items that rely solely on color to convey information with alternatives", isOn: $differentiateWithoutColor)
                        // Reduce Transparency Toggle
                        CustomToggle(label: "Reduce Transparency", info: "Improve Contrast by reducing transparency and blurs on somebackgrounds to increase legibility.", isOn: $reduceTransparency)
                        // Reduce White Point Toggle
                        CustomToggle(label: "Reduce White Point", info: "Reduce the intensity of bright colors.", isOn: $reduceWhitePoint)
                        // On/Off Labels Toggle
                        CustomToggle(label: "On/Off Labels", info: "Add On/Off icons to toggles", isOn: $onOffLabels)
                        Button("Less \(Image(systemName: "chevron.up"))") {displaySettings = false }
                    }
                }
                .padding()
                
                VStack{ // Motion Settings Stack==================================
                    Text("Motion Settings")
                        .font(.system(size: 20, weight: .bold))
                    // Reduce Motion Toggle
                    CustomToggle(label: "Reduce Motion", info: "Reduce the motion of the user interface, including the parallax effect of icons.", isOn: $reduceMotion)
                    // Dim Flashing Lights
                    CustomToggle(label: "Dim Flashing Lights", info: "Video content that depicts repeated flashing or strobing lights will be automatically dimmed.", isOn: $dimFlashingLights)
                    // Limit Frame Rate
                    CustomToggle(label: "Limit Frame Rate", info: "Sets the maximum framerate of the display to 60 frames per second.", isOn: $limitFramerate)
                    
                    // Extra less important settings
                    if !motionSettings {
                        Button("More \(Image(systemName: "chevron.down"))") {motionSettings = true }
                    }
                    else {
                        // Auto-Play message effects toggle
                        CustomToggle(label: "Auto-Play Message Effects", info: "Allows fullscreen effects in the Messages app to auto-play", isOn: $autoPlayMessageEffects)
                        // Auto-Play Video Previews Toggle
                        CustomToggle(label: "Auto-Play Video Previews", info: "Allows video previews to play automatically.", isOn: $autoPlayVideoPreviews)
                        Button("Less \(Image(systemName: "chevron.up"))") {motionSettings = false }
                    }
                }
                .padding()
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Info"){
                            infoTextToggle = !infoTextToggle;
                        }
                    }
                }
            }
        }
    }
    
    /*
     Returns a custom toggle and divider group with style pre-applied.
     */
    func CustomToggle(label: String, info: String = "no info yet", isOn: Binding<Bool>) -> some View {
        return Group {
            Toggle(label, isOn: isOn)
                .toggleStyle(SwitchToggleStyle(tint: Colors.GetAccent()))
                .font(.system(size: 18))
                // TODO: on/off labels???
            if infoTextToggle {
                Text(info)
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            Divider()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView(currentProfile: Profile(name: "New Profile", symbol: "👾"), newProfile: true)
        }
    }
}


