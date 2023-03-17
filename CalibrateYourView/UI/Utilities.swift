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
