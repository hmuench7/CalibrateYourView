//
//  ContentView.swift
//  CalibrateYourView
//
//  Created by Nate on 3/27/23.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        profiles = LoadProfiles()
    }
    
    var body: some View {
        NavigationView {
            ProfilesView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

