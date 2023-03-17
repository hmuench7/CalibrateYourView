//
//  SaveApplyView.swift
//  CalibrateYourView
//
//  Contributors:   Nathan Taylor
//

import SwiftUI

struct SaveApplyView: View {
    // get the devices Darkmode/Lightmode setting
    @Environment(\.colorScheme) private var colorScheme
    
    @State var name: String = ""
    @State var symbol: String = ""
    
    var body: some View {
        ZStack {
            Colors.SetBackground(isDarkmode: colorScheme == .dark)
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Colors.GetBackground2(isDarkmode: colorScheme == .dark))
                    VStack {
                        HStack {
                            Text("Profile Name: ")
                            TextField("Profile Name", text: $name)
                        }
                        Divider()
                        HStack {
                            Text("Profile Symbol: ")
                            // TODO: Change to Emoji Picker!!!
                            TextField("Profile Symbol", text: $symbol, prompt: Text("🫥"))
                        }
                    }.padding(.horizontal)
                }
                .frame(height: 100)
                
                SingleButton(label: "Save Profile",
                             buttonAction: {
                    // TODO
                }, isDarkmode: colorScheme == .dark)
                .padding(.top)
                
                SingleButton(label: "Save and Apply Profile",
                             buttonAction: {
                    // TODO
                }, isDarkmode: colorScheme == .dark)
                .padding(.top)
            }
            .padding()
        }
    }
}

struct SaveApplyView_Previews: PreviewProvider {
    static var previews: some View {
        SaveApplyView()
    }
}
