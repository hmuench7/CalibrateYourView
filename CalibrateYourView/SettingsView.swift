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
    
    //extra info bools ===
    //info button bools
    @State var infoTextToggle = false;
    //more drop down bools
    @State var textSettings = false;
    @State var displaySettings = false;
    @State var motionSettings = false;
    
    // Text Settings Bools
    @State var speakSelection = false;
    @State var speakScreen = false;
    @State var highlightContent = false;
    // Display Settings Bools
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
    
    @State var ExpandTextBox = false;
    
    @State var resetAlert = false
    
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
                        .fill(Colors.GetBackground2(isDarkmode: currentProfile.darkmode))
                    VStack {
                        TextEditor(text: $currentProfile.sampleText)
                            .padding(.top)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                            .font(currentProfile.useDyslexieFont
                                  ? .OpenDys(size: CGFloat(FontSizes.GetFontSize(fontIdx: currentProfile.fontSize, larger: currentProfile.largerText)),
                                             weight: currentProfile.isBold ? .bold : .regular)
                                  : .system(size: CGFloat(FontSizes.GetFontSize(fontIdx: currentProfile.fontSize, larger: currentProfile.largerText)),
                                            weight: currentProfile.isBold ? .bold : .regular))
                            .scrollContentBackground(Visibility.hidden)
                            .foregroundColor(currentProfile.darkmode ? .white : .black)
                        Button(ExpandTextBox ? "Less \(Image(systemName: "chevron.up"))" : "More \(Image(systemName: "chevron.down"))") { ExpandTextBox.toggle() }
                            .padding(.bottom, 5)
                    }
                }
                .frame(height: ExpandTextBox ? 250 : 150)
                
                SettingsStack
                
                HStack {
                    // Reset to Defaults Button
                    SingleButton(label: "Reset to Defaults", buttonAction: {
                        resetAlert = true
                    }, isDarkmode: colorScheme == .dark)
                    .alert("Reset to Defaults?", isPresented: $resetAlert) {
                        Button("Cancel") { resetAlert = false }
                        Button("Reset") {
                            // Reset settings to defaults
                            // Text Settings Bools
                            currentProfile.isBold = defaultIsBold
                            currentProfile.sampleText = defaultSampleText
                            currentProfile.useDyslexieFont = defaultUseDyslexieFont
                            currentProfile.largerText = defaultLargerText
                            currentProfile.fontSize = defaultFontSize
                            speakSelection = defaultSpeakSelection
                            speakScreen = defaultSpeakScreen
                            highlightContent = defaultHighlightContent
                            // Display Settings Bools
                            currentProfile.darkmode = defaultDarkMode
                            trueTone = defaultTrueTone
                            displayZoom = defaultdisplayZoom
                            onOffLabels = defaultonOffLabels
                            reduceTransparency = defaultreduceTransparency
                            increaseContrast = defaultincreaseContrast
                            differentiateWithoutColor = defaultdifferentiateWithoutColor
                            reduceWhitePoint = defaultreduceWhitePoint
                            onOffAutoBrightness = defaultonOffAutoBrightness
                            // Motion settings Bools
                            reduceMotion = defaultreduceMotion
                            autoPlayMessageEffects = defaultautoPlayMessageEffects
                            dimFlashingLights = defaultdimFlashingLights
                            autoPlayVideoPreviews = defaultautoPlayVideoPreviews
                            limitFramerate = defaultlimitFramerate
                        }
                    }
                    
                    SingleNavButton(label: "Save Changes",
                                    destination: { SaveApplyView(currentProfile: currentProfile, newProfile: newProfile) },
                                    action: {},
                                    isDarkmode: colorScheme == .dark)
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .onTapGesture(count: 1) { self.endEditing() } // tap to make keyboard go down
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
                    Slider(value: $currentProfile.fontSize,
                           in: currentProfile.largerText ? 0...4 : 0...6,
                           step: 1,
                           minimumValueLabel: Text("A").font(.system(size: CGFloat(currentProfile.largerText ? FontSizes.access_sizes[0] : FontSizes.normal_sizes[0]))),
                           maximumValueLabel: Text("A").font(.system(size: CGFloat(currentProfile.largerText ? FontSizes.access_sizes[4] : FontSizes.normal_sizes[6]))),
                           label: { Text("") })
                    .tint(.gray)
                    .onChange(of: currentProfile.largerText) { newValue in
                        currentProfile.fontSize = newValue ? 0 : defaultFontSize
                    }
                    if infoTextToggle {
                        Text("System wide font size")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    }
                    
                    CustomToggle(label:"Larger Text", info: "Larger Accessibility Sizes.", isOn: $currentProfile.largerText)
                    
                    // Bold Text Toggle
                    CustomToggle(label: "Bold Text", info: "Font weight.", isOn: $currentProfile.isBold)
                    // Dyslexie Font Toggle
                    CustomToggle(label: "Dyslexie Font", info: "Applies the Dyslexie Font, not system wide (blame Apple).", isOn: $currentProfile.useDyslexieFont)
                    // More settings that are hidden
                    if !textSettings {
                        Button("More \(Image(systemName: "chevron.down"))") { textSettings = true }
                    }
                    else {
                        // Speak Selection Toggle
                        CustomToggle(label: "Speak Selection", info: "A Speak button will appear when you select text.", image: "SpeakSelection", imageCaption: "When Speak Selection is on the selected text can be spoken aloud by clicking the option seen above in the red outline.", isOn: $speakSelection)
                        // Speak Screen Toggle
                        CustomToggle(label: "Speak Screen", info: "Swipe down with two fingers from the top of the screen to hear the content on the screen.", isOn: $speakScreen)
                        // Highlight Content Toggle
                        // only shows up if one of the above two is selected (just like in apples settings)
                        if (speakScreen || speakSelection){ 
                            CustomToggle(label: "Highlight Content", info: "Highlight content as it is spoken.", image: "Highlight", imageCaption: "If Highlight Content is on, the sentence being read by speak selection or speak screen will be underlined and the word being spoken will be highlighted.  \n\nThis can be seen in the red outline of the image above.", isOn: $highlightContent)
                        }
                        Button("Less \(Image(systemName: "chevron.up"))") {textSettings = false }
                    }
                    
                }
                .padding()
                
                VStack{ // Display Settings Stack================================
                    Text("Display Settings")
                        .font(.system(size: 20, weight: .bold))
                    
                    //Display Zoom Toggle
                    CustomToggle(label: "Display Zoom", info: "When on shows larger text and controls, when off shows more content.", image: "DisplayZoom", imageCaption: "When Display Zoom is on the screen shows everything slightly larger as seen in the \'On\' image above.  \n\nWhen Display Zoom is off the screen shows more content at a regular size as seen in the \'Off\' image above.", isOn: $displayZoom)
                    // Increase Contrast Toggle
                    CustomToggle(label: "Increase Contrast", info: "Increase color contrast between app foreground and background colors.", isOn: $increaseContrast)
                    // Dark Mode Toggle
                    CustomToggle(label: "Dark Mode", info: "Dark backgrounds with light text through out the system.", image: "DarkLight", imageCaption: "When Dark Mode is off the light theme above is used.  \n\nWhen Dark Mode is on the dark theme above is used.", isOn: $currentProfile.darkmode)
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
                        CustomToggle(label: "Reduce Transparency", info: "Improve Contrast by reducing transparency and blurs on some backgrounds to increase legibility.", isOn: $reduceTransparency)
                        // Reduce White Point Toggle
                        CustomToggle(label: "Reduce White Point", info: "Reduce the intensity of bright colors.", isOn: $reduceWhitePoint)
                        // On/Off Labels Toggle
                        CustomToggle(label: "On/Off Labels", info: "Add On/Off icons to toggles", image: "OnOffLabels", imageCaption: "If On/Off Labels is on it will change all of the toggles to have labels like the image above.", isOn: $onOffLabels)
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

        - Parameters:
            - label: The label of the toggle
            - info: The info text that appears when the info button is pressed
            - image: The name of the image to display in the popup (optional)
            - imageCaption: The caption for the image (optional)
            - isOn: The binding for the toggle 
    */
    func CustomToggle(label: String, info: String = "no info yet", image: String = "none", imageCaption: String = "none", isOn: Binding<Bool>) -> some View {
        return VStack {
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
                if image != "none" && imageCaption != "none" {
                    ImagePopup(isOpen: getFullScreenCoverBool(image: image), image: image, imageCaption: imageCaption)
                }
            }
            Divider()
        }
    }
    
    //full screen cover bools
    @State var darkModeExample = false;
    @State var displayZoomExample = false;
    @State var onOffExample = false;
    @State var speakSelectionExample = false;
    @State var highlightContentExample = false;
    @State var unknownExample: Bool = false;
    
    func getFullScreenCoverBool(image: String) -> Binding<Bool> {
        switch(image) {
        case "DarkLight":
            return $darkModeExample
        case "DisplayZoom":
            return $displayZoomExample
        case "OnOffLabels":
            return $onOffExample
        case "SpeakSelection":
            return $speakSelectionExample
        case "Highlight":
            return $highlightContentExample
        default:
            return $unknownExample
        }
    }
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                SettingsView(currentProfile: Profile(name: "New Profile", symbol: "👾"), newProfile: true)
            }
        }
    }
}
