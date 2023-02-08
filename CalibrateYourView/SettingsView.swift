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
    
    var body: some View {
        ZStack {
            // Set background color to light gray
            Color(#colorLiteral(red: 0.96, green: 0.96, blue: 0.96, alpha: 1))
                .ignoresSafeArea();
            VStack {
                // TODO: Logo
                
                // Sample Text Box
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                    TextEditor(text: $sampleText)
                        .padding()
                        .multilineTextAlignment(.center)
                        .font(.system(size: CGFloat(fontSize), weight: isBold ? .bold : .regular))
                }
                .frame(height: 210)
                
                VStack { // Settings Stack
                    // Font Size Slider
                    Slider( value: $fontSize,
                            in: 14...32,
                            step:2,
                            minimumValueLabel: Text("A").font(.system(size: 18)),
                            maximumValueLabel: Text("A").font(.system(size: 24)),
                            label: { Text("") })
                    .accentColor(Color.gray)

                    // Bold Text Toggle
                    Toggle("Bold Text", isOn: $isBold)
                        .font(.system(size: CGFloat(fontSize), weight: .bold))
                }
                .padding()
                .padding(.top, 32)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
