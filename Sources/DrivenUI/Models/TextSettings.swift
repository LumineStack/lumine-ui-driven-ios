//
//  File.swift
//  
//
//  Created by Indra Kurniawan on 03/12/23.
//

import SwiftUI

struct TextSettings: Codable {
    var id: String
    var string: String = ""
    var size: CGFloat = 0
    var weightString: String = ""
    var designString: String = ""
    var colorHex: String = ""
    var alignmentString: String = ""
    var lineLimit: Int = 0
    var lineSpacing: CGFloat = 0
    var truncationModeString: String = ""
    var padding: CGFloat = -1
    var backgroundHex: String = ""
    var cornerRadius: CGFloat = 0
    var borderHex: String = ""
    var borderWidth: CGFloat = 0
    var shadowColorHex: String = ""
    var shadowRadius: CGFloat = 0
    var shadowX: CGFloat = 0
    var shadowY: CGFloat = 0
    var underline: Bool = false
    var underlineColorHex: String = ""
    var strikethrough: Bool = false
    var strikethroughColorHex: String = ""
    var italic: Bool = false
    var kerning: CGFloat = 0
    var baselineOffset: CGFloat = 0
    var frameWidth: CGFloat = -1
    var frameHeight: CGFloat = -1
    var frameAlignmentString: String = ""
    var accessibilityLabel: String = ""
    var accessibilityHint: String = ""
    var rotationEffect: Double = 0
    var animationString: String = ""
    var transitionString: String = ""
    
    // Computed property to convert weightString back to FontWeight
     var weight: FontWeight {
         switch weightString {
             case "bold": return .bold
             case "semiBold": return .semibold
             default: return .regular
         }
     }

     // Computed property to convert designString back to Font.Design
     var design: Font.Design {
         switch designString {
             case "serif": return .serif
             case "monospaced": return .monospaced
             case "rounded": return .rounded
             default: return .default
         }
     }

     // Computed property to convert colorHex back to Color
     var color: Color {
         Color(colorHex)  // Assuming you have an initializer for Color from hex string
     }
    
    // Computed property to convert alignmentString back to TextAlignment
    var alignment: TextAlignment {
        switch alignmentString {
            case "center": return .center
            case "leading": return .leading
            case "trailing": return .trailing
            default: return .center
        }
    }
    
    // Computed property to convert truncationModeString back to Text.TruncationMode
    var truncationMode: Text.TruncationMode {
        switch truncationModeString {
            case "head": return .head
            case "middle": return .middle
            case "tail": return .tail
            default: return .head
        }
    }
    
    // Computed property to convert backgroundHex back to Color
    var background: Color {
        Color(backgroundHex)  // Assuming you have an initializer for Color from hex string
    }
    
    // Computed property to convert shadowColorHex back to Color
    var shadowColor: Color {
        Color(shadowColorHex)  // Assuming you have an initializer for Color from hex string
    }
    
    // Computed property to convert underlineColorHex back to Color
    var underlineColor: Color {
        Color(underlineColorHex)  // Assuming you have an initializer for Color from hex string
    }
    
    // Computed property to convert strikethroughColorHex back to Color
    var strikethroughColor: Color {
        Color(strikethroughColorHex)  // Assuming you have an initializer for Color from hex string
    }
    
    // Computed property to convert frameAlignmentString back to Alignment
    var frameAlignment: Alignment {
        switch frameAlignmentString {
            case "center": return .center
            case "leading": return .leading
            case "trailing": return .trailing
            default: return .center
        }
    }
    
    // Computed property to convert animationString back to Animation
    var animation: Animation {
        switch animationString {
            case "easeIn": return .easeIn
            case "easeOut": return .easeOut
            case "easeInOut": return .easeInOut
            case "linear": return .linear
            case "spring": return .spring()
            case "interactiveSpring": return .interactiveSpring()
            case "default": return .default
            default: return .default
        }
    }
    
    // Computed property to convert transitionString back to AnyTransition
    var transition: AnyTransition {
        switch transitionString {
            case "opacity": return .opacity
            case "scale": return .scale
            case "slide": return .slide
            case "offset": return .offset(x: 0, y: 0)
            case "asymmetric": return .asymmetric(insertion: .opacity, removal: .opacity)
            case "identity": return .identity
            default: return .identity
        }
    }
    
    // Computed property to convert borderHex back to Color
    var border: Color {
        Color(borderHex)  // Assuming you have an initializer for Color from hex string
    }
    
    // Computed property to convert borderHex back to Color
    var shadow: Color {
        Color(shadowColorHex)  // Assuming you have an initializer for Color from hex string
    }
    
    init(id: String, string: String, size: CGFloat, weightString: String, designString: String, colorHex: String, alignmentString: String, lineLimit: Int, lineSpacing: CGFloat, truncationModeString: String, padding: CGFloat, backgroundHex: String, cornerRadius: CGFloat, borderHex: String, borderWidth: CGFloat, shadowColorHex: String, shadowRadius: CGFloat, shadowX: CGFloat, shadowY: CGFloat, underline: Bool, underlineColorHex: String, strikethrough: Bool, strikethroughColorHex: String, italic: Bool, kerning: CGFloat, baselineOffset: CGFloat, frameWidth: CGFloat, frameHeight: CGFloat, frameAlignmentString: String, accessibilityLabel: String, accessibilityHint: String, rotationEffect: Double, animationString: String, transitionString: String) {
        self.id = id
        self.string = string
        self.size = size
        self.weightString = weightString
        self.designString = designString
        self.colorHex = colorHex
        self.alignmentString = alignmentString
        self.lineLimit = lineLimit
        self.lineSpacing = lineSpacing
        self.truncationModeString = truncationModeString
        self.padding = padding
        self.backgroundHex = backgroundHex
        self.cornerRadius = cornerRadius
        self.borderHex = borderHex
        self.borderWidth = borderWidth
        self.shadowColorHex = shadowColorHex
        self.shadowRadius = shadowRadius
        self.shadowX = shadowX
        self.shadowY = shadowY
        self.underline = underline
        self.underlineColorHex = underlineColorHex
        self.strikethrough = strikethrough
        self.strikethroughColorHex = strikethroughColorHex
        self.italic = italic
        self.kerning = kerning
        self.baselineOffset = baselineOffset
        self.frameWidth = frameWidth
        self.frameHeight = frameHeight
        self.frameAlignmentString = frameAlignmentString
        self.accessibilityLabel = accessibilityLabel
        self.accessibilityHint = accessibilityHint
        self.rotationEffect = rotationEffect
        self.animationString = animationString
        self.transitionString = transitionString
    }
   
    enum CodingKeys: CodingKey {
        case id
        case string
        case size
        case weightString
        case designString
        case colorHex
        case alignmentString
        case lineLimit
        case lineSpacing
        case truncationModeString
        case padding
        case backgroundHex
        case cornerRadius
        case borderHex
        case borderWidth
        case shadowColorHex
        case shadowRadius
        case shadowX
        case shadowY
        case underline
        case underlineColorHex
        case strikethrough
        case strikethroughColorHex
        case italic
        case kerning
        case baselineOffset
        case frameWidth
        case frameHeight
        case frameAlignmentString
        case accessibilityLabel
        case accessibilityHint
        case rotationEffect
        case animationString
        case transitionString
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)

        try container.encode(string, forKey: .string)
        try container.encode(size, forKey: .size)
        try container.encode(weightString, forKey: .weightString)
        try container.encode(designString, forKey: .designString)
        try container.encode(colorHex, forKey: .colorHex)
        try container.encode(alignmentString, forKey: .alignmentString)
        try container.encode(lineLimit, forKey: .lineLimit)
        try container.encode(lineSpacing, forKey: .lineSpacing)
        try container.encode(truncationModeString, forKey: .truncationModeString)
        try container.encode(padding, forKey: .padding)
        try container.encode(backgroundHex, forKey: .backgroundHex)
        try container.encode(cornerRadius, forKey: .cornerRadius)
        try container.encode(borderHex, forKey: .borderHex)
        try container.encode(borderWidth, forKey: .borderWidth)
        try container.encode(shadowColorHex, forKey: .shadowColorHex)
        try container.encode(shadowRadius, forKey: .shadowRadius)
        try container.encode(shadowX, forKey: .shadowX)
        try container.encode(shadowY, forKey: .shadowY)
        try container.encode(underline, forKey: .underline)
        try container.encode(underlineColorHex, forKey: .underlineColorHex)
        try container.encode(strikethrough, forKey: .strikethrough)
        try container.encode(strikethroughColorHex, forKey: .strikethroughColorHex)
        try container.encode(italic, forKey: .italic)
        try container.encode(kerning, forKey: .kerning)
        try container.encode(baselineOffset, forKey: .baselineOffset)
        try container.encode(frameWidth, forKey: .frameWidth)
        try container.encode(frameHeight, forKey: .frameHeight)
        try container.encode(frameAlignmentString, forKey: .frameAlignmentString)
        try container.encode(accessibilityLabel, forKey: .accessibilityLabel)
        try container.encode(accessibilityHint, forKey: .accessibilityHint)
        try container.encode(rotationEffect, forKey: .rotationEffect)
        try container.encode(animationString, forKey: .animationString)
        try container.encode(transitionString, forKey: .transitionString)
    }
}

