//
//  ProfilesView.swift
//  CalibrateYourView
//
//  Contributors:   Nick Matthews
//                  Nathan Taylor
//

import SwiftUI

struct ProfilesView: View {
//    @State var prof: [Profile] = LoadProfiles()
    
    // get the devices Darkmode/Lightmode setting
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.editMode) var editMode
    
    @State var profiles: [Profile] = []
    @State private var deleteAlertShow: Bool = false
    @State private var deleteIndexSet: IndexSet = IndexSet()
    
    var body: some View {
        ZStack {
            Colors.SetBackground(isDarkmode: colorScheme == .dark)
            VStack {
                List {
                    ForEach(profiles) { prof in
                        NavigationLink(destination: SettingsView(currentProfile: prof, newProfile: false),
                                       label: { Text("\(String(prof.symbol))  \(prof.name)") })
                    }
                    .onMove { from, to in
                        profiles.move(fromOffsets: from, toOffset: to)
                        StoreProfiles(profiles)
                    }
                    .onDelete { indexSet in
                        deleteIndexSet = indexSet
                        deleteAlertShow = true
                    }
                }
                .alert(isPresented: $deleteAlertShow) {
                    Alert(
                        title: Text("Delete \(profiles[deleteIndexSet.first!].name)?"),
                        message: Text("Are you sure that you want to delete this profile? This action can't be undone."),
                        primaryButton: .destructive(Text("Delete"), action: {
                            delete(at: deleteIndexSet)
                        }),
                        secondaryButton: .cancel()
                        )
                }
                
                SingleNavButton(label: "New Profile",
                                destination: {SettingsView(currentProfile: Profile(name: "New Profile", symbol: "😎"), newProfile: true) },
                                action: {},
                                isDarkmode: colorScheme == .dark)
                .padding(.horizontal)
                }
            }
        .onAppear {
            profiles = LoadProfiles()
        }
        .toolbar {
            ToolbarItem(placement: .principal) { Logo() }
            ToolbarItem(placement: .navigationBarTrailing) { EditButton() }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func delete(at offsets: IndexSet) {
        profiles.remove(atOffsets: offsets)
        StoreProfiles(profiles)
    }
}

struct ProfilesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView() { ProfilesView() }
    }
}
