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
    }.contentShape(Rectangle())
}
