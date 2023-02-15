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
    // place holder bool for settings that are not implemented yet
    @State var placeHolderBool = false;
    @State var placeHolderBool1 = false;
    @State var placeHolderBool2 = false;
    @State var placeHolderBool3 = false;
    @State var placeHolderBool4 = false;
    @State var placeHolderBool5 = false;
    @State var placeHolderBool6 = false;
    @State var placeHolderBool7 = false;
    @State var placeHolderBool8 = false;
    @State var placeHolderBool9 = false;
    @State var placeHolderBool10 = false;
    @State var placeHolderBool11 = false;
    // float for sample text font size
    @State var fontSize: Float = FontSize()
    // bool for bolding sample text
    @State var isBold: Bool = IsBold()
    // string for sample text
    @State var sampleText: String = SampleText()
    // get the devices Darkmode/Lightmode setting
    @Environment(\.colorScheme) private var colorScheme

    init() {
        // fallback for removing black box behind TextEditor
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            // Set Background
            Colors.SetBackground(isDarkmode: colorScheme == .dark)
            
            VStack {
                // CalibrateYourView Logo
                Logo()
                
                // Sample Text Box
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Colors.GetBackground2(isDarkmode: colorScheme == .dark))
                    TextEditor(text: $sampleText)
                        .padding()
                        .multilineTextAlignment(.center)
                        .font(.system(size: CGFloat(fontSize),
                                      weight: isBold ? .bold : .regular))
                        .scrollContentBackground(Visibility.hidden)
                }
                    .frame(height: 120)
                
                SettingsStack
                    .padding(.top)
                
                // Reset to Defaults Button
                SingleButton(label: "Reset to Defaults", buttonAction: {
                    // Reset settings to defaults
                    // TODO: add a defaults class or define constants or something?
                    fontSize = 22.0
                    isBold = false
                    sampleText = "The quick brown fox jumps over the lazy dog."
                }, isDarkmode: colorScheme == .dark)
                .padding(.top)
                
                // Save Profile Button
                SingleButton(label: "Save Settings", buttonAction: {
                    // Button Code: Save Button Settings
                    SetFontSize(fontSize: fontSize)
                    SetIsBold(isBold: isBold)
                    SetSampleText(sampleText: sampleText)
                }, isDarkmode: colorScheme == .dark)
                .padding(.top)
            }
            .padding()
        }
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
                    Slider( value: $fontSize,
                            in: 14...32,
                            step:2,
                            minimumValueLabel: Text("A").font(.system(size: 18)),
                            maximumValueLabel: Text("A").font(.system(size: 24)),
                            label: { Text("") })
                        .tint(.gray)
                    Divider().padding(.top, -2)
                    
                    // Bold Text Toggle
                    CustomToggle(label: "Bold Text", isOn: $isBold)
                    // DyslexieFont Toggle
                    CustomToggle(label: "Dyslexie Font", isOn: $placeHolderBool)
                    
                }
                .padding()
                
                VStack{ // Display Settings Stack
                    Text("Display Settings")
                        .font(.system(size: 20, weight: .bold))
                    
                    // On/Off Labels
                    CustomToggle(label: "On/Off Labels", isOn: $placeHolderBool2)
                    // Reduce Transpareny
                    CustomToggle(label: "Reduce Transpareny", isOn: $placeHolderBool3)
                    // Increase Contrast
                    CustomToggle(label: "Increase Contrast", isOn: $placeHolderBool4)
                    // Invert Colors
                    CustomToggle(label: "Invert Colors", isOn: $placeHolderBool5)
                    // Reduce White Point
                    CustomToggle(label: "Reduce White Point", isOn: $placeHolderBool6)
                    // On/Off Auto-Brightness
                    CustomToggle(label: "On/Off Auto-Brightness", isOn: $placeHolderBool7)
                    
                }
                .padding()
                
                VStack{ // Motion Settings Stack
                    Text("Motion Settings")
                        .font(.system(size: 20, weight: .bold))
                    
                    // Reduce Motion
                    CustomToggle(label: "Reduce Motion", isOn: $placeHolderBool8)
                    // Auto-Play Message Effects
                    CustomToggle(label: "Auto-Play Message Effects", isOn: $placeHolderBool9)
                    // Auto-Play Video Previews
                    CustomToggle(label: "Auto-Play Video Previews", isOn: $placeHolderBool10)
                    // Limit Frame Rate
                    CustomToggle(label: "Limit Frame Rate", isOn: $placeHolderBool11)
                    
                }
                .padding()
            }
        }
    }
    
    /*
     Returns a custom toggle and divider group with style pre-applied.
     */
    func CustomToggle(label: String, isOn: Binding<Bool>) -> some View {
        return Group {
            Toggle(label, isOn: isOn)
                .toggleStyle(SwitchToggleStyle(tint: Colors.GetAccent()))
                .font(.system(size: 18))
                // TODO: on/off labels???
            Divider()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
