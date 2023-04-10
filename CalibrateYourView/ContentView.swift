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
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
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

