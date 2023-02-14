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
    @State var fontSize: Float = 20.0
    // bool for bolding sample text
    @State var isBold: Bool = false
    // string for sample text
    @State var sampleText: String = "The quick brown fox jumps over the lazy dog."
    // get the devices Darkmode/Lightmode setting
    @Environment(\.colorScheme) private var colorScheme

    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            Colors.SetBackground(isDarkmode: colorScheme == .dark)
            VStack {
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
                SingleButton(label: "Reset to Defaults", buttonAction: {
                    // Reset settings to defaults
                    // TODO: add a defaults class or define constants or something?
                    fontSize = 22.0
                    isBold = false
                    sampleText = "The quick brown fox jumps over the lazy dog."
                }, isDarkmode: colorScheme == .dark).padding(.top)
                /*
                SingleButton(label: "Coming Soon: Save Profile", buttonAction: {
                    // TODO: Button Code Here
                    // PLACEBO BUTTON for Alpha
                }, isDarkmode: colorScheme == .dark)
                    .padding(.top)
                */
            }
                .padding()
        }
    }

    var SettingsStack : some View {
        ZStack { // Settings Stack
            RoundedRectangle(cornerRadius: 10)
                .fill(Colors.GetBackground2(isDarkmode: colorScheme == .dark))
            ScrollView(.vertical, showsIndicators: false) {
                VStack { // Text Settings Stack
                    Group{
                        Text("Text Settings")
                            .font(.system(size: 20, weight: .bold))
                        // Font Size Slider
                        Slider( value: $fontSize,
                                in: 14...32,
                                step:2,
                                minimumValueLabel: Text("A").font(.system(size: 18)),
                                maximumValueLabel: Text("A").font(.system(size: 24)),
                                label: { Text("") })
                        .accentColor(Color.gray)
                        Divider().padding(.top, -2)
                        // Bold Text Toggle
                        Toggle("Bold Text", isOn: $isBold)
                            .font(.system(size: 18, weight: .bold))
                        Divider()
                        Group {
                            Toggle("Dyslexie Font", isOn: $placeHolderBool)
                                .font(.system(size: 18))
                            Divider()
                        }
                    }
                    Spacer()
                }.padding()
                //Display settings VStack
                VStack{
                    Text("Display Settings")
                        .font(.system(size: 20, weight: .bold))
                    Group{
                        Toggle("On/Off Labels", isOn: $placeHolderBool)
                            .font(.system(size: 18))
                        Divider()
                    }
                    Group{
                        Toggle("Reduce Transpareny", isOn: $placeHolderBool)
                            .font(.system(size: 18))
                        Divider()
                    }
                    Group{
                        Toggle("Increase Contrast", isOn: $placeHolderBool)
                            .font(.system(size: 18))
                        Divider()
                    }
                    Group{
                        Toggle("Invert Colors", isOn: $placeHolderBool)
                            .font(.system(size: 18))
                        Divider()
                    }
                    Group {
                        Toggle("Reduce White Point", isOn: $placeHolderBool)
                            .font(.system(size: 18))
                        Divider()
                    }
                    Group {
                        Toggle("On/Off Auto-Brightness", isOn: $placeHolderBool)
                            .font(.system(size: 18))
                        Divider()
                    }
                }.padding()
                VStack{//Motion Settings VStack
                    Group {
                        Text("Motion Settings")
                            .font(.system(size: 20, weight: .bold))
                        Toggle("Reduce Motion", isOn: $placeHolderBool)
                            .font(.system(size: 18))
                        Divider()
                    }
                    Group{
                        Toggle("Auto-Play Message Effects", isOn: $placeHolderBool)
                            .font(.system(size: 18))
                        Divider()
                    }
                    Group{
                        Toggle("Auto-Play Video Previews", isOn: $placeHolderBool)
                            .font(.system(size: 18))
                        Divider()
                    }
                    Group{
                        Toggle("Limit Frame Rate", isOn: $placeHolderBool)
                            .font(.system(size: 18))
                        Divider()
                    }
                }.padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
