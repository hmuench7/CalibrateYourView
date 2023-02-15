//
//  ContentView.swift
//  CalibrateYourView
//
//  UI Lead:        Nathan Taylor
//  Contributers:   Hunter Muench, Jonah Hood Blaxill
//

import SwiftUI

struct SettingsView: View {
    @State var placeHolderBool = false;
    // float for sample text font size
    @State var fontSize: Float = FontSize()
    // bool for bolding sample text
    @State var isBold: Bool = IsBold()
    // string for sample text
    @State var sampleText: String = SampleText()
    // get the devices Darkmode/Lightmode setting
    @Environment(\.colorScheme) private var colorScheme

    init() {
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
                    CustomToggle(label: "On/Off Labels", isOn: $placeHolderBool)
                    // Reduce Transpareny
                    CustomToggle(label: "Reduce Transpareny", isOn: $placeHolderBool)
                    // Increase Contrast
                    CustomToggle(label: "Increase Contrast", isOn: $placeHolderBool)
                    // Invert Colors
                    CustomToggle(label: "Invert Colors", isOn: $placeHolderBool)
                    // Reduce White Point
                    CustomToggle(label: "Reduce White Point", isOn: $placeHolderBool)
                    // On/Off Auto-Brightness
                    CustomToggle(label: "On/Off Auto-Brightness", isOn: $placeHolderBool)
                    
                }
                .padding()
                
                VStack{ // Motion Settings Stack
                    Text("Motion Settings")
                        .font(.system(size: 20, weight: .bold))
                    
                    // Reduce Motion
                    CustomToggle(label: "Reduce Motion", isOn: $placeHolderBool)
                    // Auto-Play Message Effects
                    CustomToggle(label: "Auto-Play Message Effects", isOn: $placeHolderBool)
                    // Auto-Play Video Previews
                    CustomToggle(label: "Auto-Play Video Previews", isOn: $placeHolderBool)
                    // Limit Frame Rate
                    CustomToggle(label: "Limit Frame Rate", isOn: $placeHolderBool)
                    
                }
                .padding()
            }
        }
    }
    
    func CustomToggle(label: String, isOn: Binding<Bool>) -> some View {
        return Group {
            Toggle(label, isOn: isOn)
                .toggleStyle(SwitchToggleStyle(tint: Colors.GetAccent()))
                .font(.system(size: 18))
            Divider()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
