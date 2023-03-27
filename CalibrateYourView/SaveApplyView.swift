//
//  SaveApplyView.swift
//  CalibrateYourView
//
//  Contributors:   Nathan Taylor
//

import UIKit
import SwiftUI

struct SaveApplyView: View {
    // get the devices Darkmode/Lightmode setting
    @Environment(\.colorScheme) private var colorScheme
    
    @State var name: String = ""
    @ObservedObject var symbol = TextLimiter(limit: 1)
    
    @State var currentProfile: Profile
    @State var newProfile: Bool
    
    var body: some View {
        ZStack {
            Colors.SetBackground(isDarkmode: colorScheme == .dark)
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Colors.GetBackground2(isDarkmode: colorScheme == .dark))
                    VStack {
                        HStack {
                            Text("Profile Name:   ")
                            TextField("Profile Name", text: $name)
                        }
                        Divider()
                        HStack {
                            Text("Profile Symbol: ")
                            TextField("Profile Symbol", text: $symbol.value, prompt: Text("😁"))
                        }
                        .padding(.top)
                    }.padding(.horizontal)
                }
                .frame(height: 120)
                
                SingleNavButton(label: "Save Profile",
                                destination: { ProfilesView() },
                                action: { SaveProfile() },
                                isDarkmode: colorScheme == .dark)
                .padding(.top)
            }
            .padding()
        }
        // updates name and symbol on load
        .onAppear(perform: {
            if !newProfile {
                name = currentProfile.name
                symbol.value = String(currentProfile.symbol)
            }
        })
        .toolbar {
            ToolbarItem(placement: .principal) { Logo() }
        }
    }
    
    func SaveProfile() -> Void {
        // set name and symbol onto currentProfile
        currentProfile.name = name
        currentProfile.symbol = symbol.value.first!
        
        // if newProfile: Add profile to profiles array
        if newProfile {
            profiles.append(currentProfile)
        }
        
        // else: update existing profile name and symbol
        else {
            // replace matching (id) profile with currentProfile
            for (idx,prof) in profiles.enumerated() {
                if (prof.customID == currentProfile.customID) {
                    profiles[idx] = currentProfile
                }
            }
        }
        
        StoreProfiles();
    }
}

struct SaveApplyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SaveApplyView(currentProfile: Profile(name:"New Profile", symbol:"👾"), newProfile: true)
        }
    }
}
