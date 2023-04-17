//
//  ContentView.swift
//  CalibrateYourView
//
//  Created by Nate on 3/27/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var profiles: [Profile] = []
    
    init() {
        profiles = LoadProfiles()
    }
    
    var body: some View {
        NavigationView {
            ProfilesView(profiles: profiles)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

