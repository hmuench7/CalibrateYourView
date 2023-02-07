//
//  ContentView.swift
//  CalibrateYourView
//
//  Created by Hunter Muench on 1/27/23.
//

import SwiftUI

struct ContentView: View {
    
    // float for sample text font size
    @State var fontSize: Float = 20.0
    // bool for bolding sample text
    @State var isBold: Bool = false
    
    var body: some View {
        ZStack {
            // Set background color to light gray
            Color(#colorLiteral(red: 0.96, green: 0.96, blue: 0.96, alpha: 1))
                .ignoresSafeArea();
            VStack {
                // Sample Text Box
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                    Text("\"The quick brown fox jumps over the lazy dog\" is an English-language pangram — a sentence that contains all the letters of the alphabet.")
                        .padding()
                        .multilineTextAlignment(.center)
                        .font(.system(size: CGFloat(fontSize),
                                      weight: isBold ? .bold : .regular))
                }
                .frame(height: 210)
                
                // Font Size Slider
                Slider(
                    value: $fontSize,
                    in: 14...32,
                    step:2,
                    minimumValueLabel:
                        Text("A").font(.system(size: 16)),
                    maximumValueLabel:
                        Text("A").font(.system(size: 20)),
                    label: { Text("") })
                    .accentColor(Color.gray)
                
                // Bold Text Toggle
                Toggle("Bold Text", isOn: $isBold)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
