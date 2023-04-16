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
                return "OpenDyslexic-Bold"
            case .boldItalic:
                return "OpenDyslexic-BoldItalic"
            case .italic:
                return "OpenDyslexic-Italic"
            case .regular:
                return "OpenDyslexic-Regular"
            }
        }
    }
    
    static func OpenDys(size: CGFloat = 24, weight: OpenDysFont) -> Font {
        return .custom(weight.value, size: size)
    }
}
