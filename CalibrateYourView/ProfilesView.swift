//
//  ProfilesView.swift
//  CalibrateYourView
//
//  Contributors:   Nick Matthews
//

import SwiftUI

struct ProfilesView: View {
    @State var profiles: [Profile] = [
        Profile(name: "Nate"),
        Profile(name: "Nick"),
        Profile(name: "Hunter"),
        Profile(name: "Jonah")
    ]
    
    // get the devices Darkmode/Lightmode setting
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ZStack {
            Colors.SetBackground(isDarkmode: colorScheme == .dark)
            VStack {
                Logo().padding(.top)
                
                List(profiles) { profile in
                    // TODO: Emoji
                    Text(profile.name)
                }
                
                SingleButton(label: "New Profile", buttonAction: {
                    profiles.append(Profile(name: "New Profile"))
                }, isDarkmode: colorScheme == .dark)
                .padding()
            }
        }
    }
}

struct ProfilesView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilesView()
    }
}
