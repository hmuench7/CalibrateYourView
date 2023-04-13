//
//  Fonts.swift
//  CalibrateYourView
//
//  Created by Nate on 4/10/23.
//

import SwiftUI

extension Font {
    enum OpenDysFont {
        case bold
        case boldItalic
        case italic
        case regular
        
        var value: String {
            switch self {
            case .bold:
                return "OpenDyslexic-Regular"
            case .boldItalic:
                return "OpenDyslexic-BoldItalic"
            case .italic:
                return "OpenDyslexic-Italic"
            case .regular:
                return "OpenDyslexic-Regular"
            }
        }
    }
    
    static func OpenDys(_ weight: OpenDysFont, size: CGFloat = 24) -> Font {
        return .custom(weight.value, size: size)
    }
}
