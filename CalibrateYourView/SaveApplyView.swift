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
                            TextField("Profile Name", text: $currentProfile.name)
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
                                action: {
                    print("Hello! \(currentProfile.name)")
                    // if newProfile: Add profile to profiles array
                    if newProfile {
                        currentProfile.symbol = symbol.value.first!
                        profiles.append(currentProfile)
                        StoreProfiles();
                    }
                    // TODO: else: update existing profile name and symbol
                                },
                                isDarkmode: colorScheme == .dark)
                .padding(.top)
            }
            .padding()
        }
        // updates name and symbol on load
        .onAppear(perform: {
            if !newProfile {
                symbol.value = String(currentProfile.symbol)
            }
        })
        .toolbar {
            ToolbarItem(placement: .principal) { Logo() }
        }
    }
}

struct SaveApplyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SaveApplyView(currentProfile: Profile(name:"New Profile", symbol:"👾"), newProfile: true)
        }
    }
}
