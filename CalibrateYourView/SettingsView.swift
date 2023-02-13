//
//  ContentView.swift
//  CalibrateYourView
//
//  UI Lead:        Nathan Taylor
//  Contributers:   Hunter Muench
//

import SwiftUI

struct SettingsView: View {
    
    // float for sample text font size
    @State var fontSize: Float = 20.0
    // bool for bolding sample text
    @State var isBold: Bool = false
    // string for sample text
    @State var sampleText: String = "\"The quick brown fox jumps over the lazy dog\" is an English-language pangram — a sentence that contains all the letters of the alphabet."
    
    // get the devices Darkmode/Lightmode setting
    @Environment(\.colorScheme) private var colorScheme
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            Colors.SetBackground(isDarkmode: colorScheme == .dark)
            
            VStack {
                // TODO: Logo
                
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
                .frame(height: 210)
                
                SettingsStack
                    .padding(.top)
                
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
                VStack { // Settings Stack
                    
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
                    
                    // TODO: Add more Settings HERE
                    
                    Spacer()
                    
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
