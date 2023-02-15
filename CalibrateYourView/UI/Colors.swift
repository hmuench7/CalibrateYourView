//
//  Colors.swift
//  CalibrateYourView
//
//  Contributers:   Nathan Taylor
//

import SwiftUI

struct darkmode {
    public static let background = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) // #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) // #000000 
    public static let background2 = #colorLiteral(red: 0.11, green: 0.11, blue: 0.118, alpha: 1) // #colorLiteral(red: 0.11, green: 0.11, blue: 0.118, alpha: 1) // #1c1c1e
}

struct lightmode {
    public static let background = #colorLiteral(red: 0.949, green: 0.945, blue: 0.965, alpha: 1) // #colorLiteral(red: 0.949, green: 0.945, blue: 0.965, alpha: 1) // #f2f1f6
    public static let background2 = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) // #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) // #ffffff
}

struct Colors {
    /*
     Sets the Background for the app based on the colors specified in UI/Colors.swift
     
     Usage Example:
     struct View : View {
     @Environment(\.colorScheme) private var colorScheme
     
     ZStack {
     Colors.SetBackground(isDarkmode: colorScheme == .dark)
     // Other Code Here
     }
     }
     */
    public static func SetBackground(isDarkmode: Bool) -> some View {
        Color(isDarkmode ? darkmode.background : lightmode.background).ignoresSafeArea()
    }
    
    /*
     Returns a Color object for the Background2 color specified in UI/Colors.swift
    */
    public static func GetBackground2(isDarkmode: Bool) -> Color {
        Color(isDarkmode ? darkmode.background2 : lightmode.background2)
    }
    
    /*
     Returns the devices' accent color set in the Apple Settings.
     Usage:
     Colors.GetAccent
     */
    public static func GetAccent() -> Color {
        return Color.blue
    }
}
