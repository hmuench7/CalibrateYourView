//
//  Utilities.swift
//  CalibrateYourView
//
//  Contributers:   Nathan Taylor
//

import SwiftUI

/*
 Returns a View of the Logo for our app.
 
 Usage:
 Logo()
 */
func Logo() -> some View {
    Text("Calibrate**Your***View*")
        .font(.system(size: 24))
        .foregroundColor(Colors.GetAccent())
}

/*
 Creates a Single HButton surrounded by a rounded rectangle.
 The entire rectangle is selectable.
 
 Usage:
 SingleButton(label: "Your Label Here", buttonAction: {
    // Your Button Action Code Here
 
 }, isDarkmode: colorScheme == .dark)
 */
func SingleButton(label: String, buttonAction: @escaping () -> Void, isDarkmode: Bool) -> some View {
    ZStack {
        RoundedRectangle(cornerRadius: 10)
            .fill(Colors.GetBackground2(isDarkmode: isDarkmode))
        Button(action: {
            buttonAction()
        }) {
            HStack {
                Spacer()
                Text(label)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .contentShape(Rectangle())
    }
    .frame(height: 50)
}

/*
 */
func SingleNavButton(label: String, destination: @escaping () -> some View,
                     action: @escaping () -> Void, isDarkmode: Bool) -> some View {
    ZStack {
        RoundedRectangle(cornerRadius: 10)
            .fill(Colors.GetBackground2(isDarkmode: isDarkmode))
        NavigationLink(destination: destination, label: {
            HStack {
                Spacer()
                Text(label)
                Spacer()
            }
        })
        .isDetailLink(false)
        .simultaneousGesture(TapGesture().onEnded(action))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .contentShape(Rectangle())
    }
    .frame(height: 50)
}


/*
 Limits text input to {limit} character(s)
 Credit: Darren (https://programmingwithswift.com/swiftui-textfield-character-limit/)
 
 Usage:
 @ObservedObject var symbol = TextLimiter(limit: 1)
 var body : some view {
    TextField("Profile Symbol", text: $symbol.value, prompt: Text("😁"))
 }
 */
class TextLimiter: ObservableObject {
    private let limit: Int
    
    init(limit: Int) {
        self.limit = limit
    }
    
    @Published var value = "" {
        didSet {
            if value.count > self.limit {
                value = String(value.prefix(self.limit))
                self.hasReachedLimit = true
            } else {
                self.hasReachedLimit = false
            }
        }
    }
    @Published var hasReachedLimit = false
}
