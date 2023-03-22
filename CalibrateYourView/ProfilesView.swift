//
//  ProfilesView.swift
//  CalibrateYourView
//
//  Contributors:   Nick Matthews
//                  Nathan Taylor
//

import SwiftUI

struct ProfilesView: View {
    @State var profiles: [Profile] = [
        Profile(name: "Nate", symbol: "🎃"),
        Profile(name: "Nick", symbol: "👽"),
        Profile(name: "Hunter", symbol: "🤖"),
        Profile(name: "Jonah", symbol: "👾")
    ]
    
    // get the devices Darkmode/Lightmode setting
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.editMode) private var editMode
    
    @State private var selection: String?
    
    var body: some View {
        ZStack {
                Colors.SetBackground(isDarkmode: colorScheme == .dark)
                VStack {
                    List {
                        ForEach(profiles) { prof in
                            NavigationLink(destination: SettingsView(currentProfile: prof, newProfile: false),
                                           label: { Text("\(String(prof.symbol))  \(prof.name)") })
                        }
                        .onDelete(perform: delete)
                        .onMove { from, to in
                            profiles.move(fromOffsets: from, toOffset: to)
                        }
                    }
                    
                    SingleNavButton(label: "New Profile",
                                    destination: { SettingsView(currentProfile: Profile(name: "New Profile", symbol: "😎"), newProfile: true) },
                                    action: {},
                                    isDarkmode: colorScheme == .dark)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) { Logo() }
                ToolbarItem(placement: .navigationBarTrailing) { EditButton() }
            }
    }
    
    func delete(at offsets: IndexSet) {
        profiles.remove(atOffsets: offsets)
    }
}

struct ProfilesView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilesView()
    }
}
