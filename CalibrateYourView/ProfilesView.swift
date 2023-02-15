//
//  ProfilesView.swift
//  CalibrateYourView
//
//  Contributors:   Nick Matthews
//

import SwiftUI

struct ProfilesView: View {
    
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
            }.padding()
        }
    }
    
    var ProfilesStack : some View {
        VStack { // Profiles Stack
            // List of Profiles (need a profile UI template to be repeated)
        }.padding()
    }
}

struct ProfilesView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilesView()
    }
}
