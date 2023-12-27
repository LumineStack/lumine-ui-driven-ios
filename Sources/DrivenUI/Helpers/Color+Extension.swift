//
//  File.swift
//  
//
//  Created by Indra Kurniawan on 13/12/23.
//

import SwiftUI

extension Color: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let colorString = try container.decode(String.self)
        
        // Convert the string back to a Color
        // This is a simplistic example, you'll need to implement the actual logic
        self = Color(colorString)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        // Convert the Color to a string representation
        // This is a simplistic example, you'll need to implement the actual logic
        let colorString = self.toHexString()
        try container.encode(colorString)
    }
    
    func uiColor() -> UIColor {
        
        if #available(iOS 14.0, *) {
            return UIColor(self)
        }
        
        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }
    
    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        
        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        
        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r, g, b, a)
    }
    
    func toHexString() -> String {
        // Convert SwiftUI Color to UIColor
        return self.uiColor().toHexString()
    }
    
}

extension UIColor {
    func toHexString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        // Use the getRed(_:green:blue:alpha:) method of UIColor
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        // Convert the components to a hexadecimal string
        let rgb: Int = (Int)(r * 255) << 16 | (Int)(g * 255) << 8 | (Int)(b * 255) << 0
        return String(format: "#%06x", rgb)
    }
}
