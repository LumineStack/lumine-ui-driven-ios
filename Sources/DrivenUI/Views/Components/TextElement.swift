//
//  File.swift
//  
//
//  Created by Indra Kurniawan on 12/12/23.
//

import SwiftUI

class TextElement: ViewElement, Codable {
    // full declaration
    var settings: TextSettings
    
    
    enum CodingKeys: String, CodingKey {
        case settings
    }
    
    init(settings: TextSettings) {
        self.settings = settings
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(settings, forKey: .settings)
    }
    
    // Implementation
    func toSwiftUI() -> AnyView {
        if #available(iOS 16.0, *) {
            return AnyView(
                Text(settings.string)
                    .font(.system(size: settings.size, weight: settings.weight.fontWeight, design: settings.design))
                    .foregroundColor(settings.color)
                    .multilineTextAlignment(settings.alignment)
                    .lineLimit(settings.lineLimit)
                    .lineSpacing(settings.lineSpacing)
                    .truncationMode(settings.truncationMode)
                    .padding(settings.padding)
                    .background(settings.background)
                    .cornerRadius(settings.cornerRadius)
                    .border(settings.border, width: settings.borderWidth)
                    .shadow(color: settings.shadowColor, radius: settings.shadowRadius, x: settings.shadowX, y: settings.shadowY)
                    .underline(settings.underline, color: settings.underlineColor)
                    .strikethrough(settings.strikethrough, color: settings.strikethroughColor)
                    .italic(settings.italic)
                    .kerning(settings.kerning)
                    .baselineOffset(settings.baselineOffset)
                    .frame(width: settings.frameWidth, height: settings.frameHeight, alignment: settings.frameAlignment)
                    .accessibilityLabel(Text(settings.accessibilityLabel))
                    .accessibilityHint(Text(settings.accessibilityHint))
                    .rotationEffect(.degrees(settings.rotationEffect))
                    .animation(settings.animation)
                    .transition(settings.transition)
                
            )
        } else if #available(iOS 14.0, *) {
            // Fallback on earlier versions
            return AnyView(
                Text(settings.string)
                    .font(.system(size: settings.size, weight: settings.weight.fontWeight, design: settings.design))
                    .foregroundColor(settings.color)
                    .multilineTextAlignment(settings.alignment)
                    .lineLimit(settings.lineLimit)
                    .lineSpacing(settings.lineSpacing)
                    .truncationMode(settings.truncationMode)
                    .padding(settings.padding)
                    .background(settings.background)
                    .cornerRadius(settings.cornerRadius)
                    .border(settings.border, width: settings.borderWidth)
                    .shadow(color: settings.shadowColor, radius: settings.shadowRadius, x: settings.shadowX, y: settings.shadowY)
                    .frame(width: settings.frameWidth, height: settings.frameHeight, alignment: settings.frameAlignment)
                    .accessibilityLabel(Text(settings.accessibilityLabel))
                    .accessibilityHint(Text(settings.accessibilityHint))
                    .rotationEffect(.degrees(settings.rotationEffect))
                    .animation(settings.animation)
                    .transition(settings.transition)
            )
        } else {
            // Fallback on earlier versions
            return AnyView(
                Text(settings.string)
                    .font(.system(size: settings.size, weight: settings.weight.fontWeight, design: settings.design))
                    .foregroundColor(settings.color)
                    .multilineTextAlignment(settings.alignment)
                    .lineLimit(settings.lineLimit)
                    .lineSpacing(settings.lineSpacing)
                    .truncationMode(settings.truncationMode)
                    .padding(settings.padding)
                    .background(settings.background)
                    .cornerRadius(settings.cornerRadius)
                    .border(settings.border, width: settings.borderWidth)
                    .shadow(color: settings.shadowColor, radius: settings.shadowRadius, x: settings.shadowX, y: settings.shadowY)
                    .frame(width: settings.frameWidth, height: settings.frameHeight, alignment: settings.frameAlignment)
                    .rotationEffect(.degrees(settings.rotationEffect))
                    .animation(settings.animation)
            )
        }
    }
}
