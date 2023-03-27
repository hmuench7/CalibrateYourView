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
    
    @State var darkMode: Bool = false;
    
    @State var infoTextToggle = false;
    
    // place holder bool for settings that are not implemented yet
    @State var placeHolderBool = false;
    @State var placeHolderBool1 = false;
    @State var placeHolderBool2 = false;
    @State var placeHolderBool3 = false;
    @State var placeHolderBool4 = false;
    @State var placeHolderBool5 = false;
    @State var placeHolderBool6 = false;
    @State var placeHolderBool7 = true;
    @State var placeHolderBool8 = false;
    @State var placeHolderBool9 = true;
    @State var placeHolderBool10 = true;
    @State var placeHolderBool11 = false;
    
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
                    placeHolderBool = false;
                    placeHolderBool1 = false;
                    placeHolderBool2 = false;
                    placeHolderBool3 = false;
                    placeHolderBool4 = false;
                    placeHolderBool5 = false;
                    placeHolderBool6 = false;
                    placeHolderBool7 = true;
                    placeHolderBool8 = false;
                    placeHolderBool9 = true;
                    placeHolderBool10 = true;
                    placeHolderBool11 = false;
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
                VStack { // Text Settings Stack
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
                    CustomToggle(label: "Bold Text", info: "Font weight", isOn: $currentProfile.isBold)
                    // DyslexieFont Toggle
                    CustomToggle(label: "Dyslexie Font", info: "Applies the Dyslexie Font, not system wide (Apple does not allow this)", isOn: $placeHolderBool)
                }
                .padding()
                
                VStack{ // Display Settings Stack
                    Text("Display Settings")
                        .font(.system(size: 20, weight: .bold))
                    
                    // Darkmode
                    CustomToggle(label: "Darkmode", info: "Changes iOS theme between light text on a dark background (toggle = on) and dark text on a light background (toggle = off).", isOn: $darkMode)
                    // On/Off Labels
                    CustomToggle(label: "On/Off Labels", info: "Add the On/Off icons to toggles", isOn: $placeHolderBool2)
                    // Reduce Transpareny
                    CustomToggle(label: "Reduce Transpareny", info: "Improve contrast by reducing transparency and blurs on some backgrounds to increase legibility", isOn: $placeHolderBool3)
                    // Increase Contrast
                    CustomToggle(label: "Increase Contrast", info: "Increase color contrast between app foreground and background colors",isOn: $placeHolderBool4)
                    // Invert Colors
                    CustomToggle(label: "Invert Colors", info: "Reverses the colors of the display, except for images.", isOn: $placeHolderBool5)
                    // Reduce White Point
                    CustomToggle(label: "Reduce White Point", info: "Reduce the intensity of bright colors",isOn: $placeHolderBool6)
                    // On/Off Auto-Brightness
                    CustomToggle(label: "On/Off Auto-Brightness", info: "Turning off auto brightness may affect battery life and long term display performance", isOn: $placeHolderBool7)
                    
                }
                .padding()
                
                VStack{ // Motion Settings Stack
                    Text("Motion Settings")
                        .font(.system(size: 20, weight: .bold))

                    // Reduce Motion
                    CustomToggle(label: "Reduce Motion", info: "Reduce the motion of the user interface, including the parallax effect of icons.", isOn: $placeHolderBool8)
                    // Auto-Play Message Effects
                    CustomToggle(label: "Auto-Play Message Effects", info: "Allows fullscreen effects in the Mesages app to auto-play.", isOn: $placeHolderBool9)
                    // Auto-Play Video Previews
                    CustomToggle(label: "Auto-Play Video Previews", info: "auto-plays video previews in the Messages app. ", isOn: $placeHolderBool10)
                    // Limit Frame Rate
                    CustomToggle(label: "Limit Frame Rate", info: "Sets the maximum frame rate of the display to 60 frames per second.", isOn: $placeHolderBool11)
                    
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

