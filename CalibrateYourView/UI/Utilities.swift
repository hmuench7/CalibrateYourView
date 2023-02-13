//
//  Utilities.swift
//  CalibrateYourView
//
//  Created by Nate on 2/10/23.
//

import SwiftUI

/*
 Creates a button that spreads across a whole row rather than only encapsulating
 the label.
 Usage:
 HButton(label: "Your Label Here", buttonAction: {
    // Your Button Action Code Here
 })
 */
func HButton(label: String, buttonAction: @escaping () -> Void) -> some View {
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

func SingleButton(label: String, buttonAction: @escaping () -> Void, isDarkmode: Bool) -> some View {
    ZStack {
        RoundedRectangle(cornerRadius: 10)
            .fill(Colors.GetBackground2(isDarkmode: isDarkmode))
        HButton(label: label, buttonAction: buttonAction)
    }
    .frame(height: 50)
}
