//
//  File.swift
//  
//
//  Created by Indra Kurniawan on 03/12/23.
//

import SwiftUI

class VStackContainer: ViewElement, Codable {
    var id: String
    var alignmentString: String
    var spacing: Int
    var paddingString: String
    var elements: [AnyViewElement]
    
    var alignment: HorizontalAlignment {
        switch alignmentString {
        case "listRowSeparatorLeading":
            if #available(iOS 16.0, *) {
                return .listRowSeparatorLeading
            } else {
                // Fallback on earlier versions
                return .center
            }
        case "listRowSeparatorTrailing":
            if #available(iOS 16.0, *) {
                return .listRowSeparatorTrailing
            } else {
                // Fallback on earlier versions
                return .center
            }
        case "leading":
            return .leading
        case "trailing":
            return .trailing
        default:
            return .center
        }
    }
    
    var padding: Edge.Set {
        var padding: Edge.Set = []
        if paddingString.contains("top") {
            padding.insert(.top)
        }
        if paddingString.contains("bottom") {
            padding.insert(.bottom)
        }
        if paddingString.contains("leading") {
            padding.insert(.leading)
        }
        if paddingString.contains("trailing") {
            padding.insert(.trailing)
        }
        return padding
    }
    
    enum CodingKeys: String, CodingKey {
        case id, alignment, spacing, padding, elements
    }
    
    init(id: String, alignment: String, spacing: Int, padding: String, elements: [AnyViewElement]) {
        self.id = id
        self.alignmentString = alignment
        self.spacing = spacing
        self.paddingString = padding
        self.elements = elements
    }
    
    required init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: CodingKeys.self)
          
          // Decode the properties using the appropriate types
          id = try container.decode(String.self, forKey: .id)
          alignmentString = try container.decode(String.self, forKey: .alignment)
          spacing = try container.decode(Int.self, forKey: .spacing)
          paddingString = try container.decode(String.self, forKey: .padding)
          elements = try container.decode([AnyViewElement].self, forKey: .elements)
      }
    
    func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)
           
           // Encode the properties
           try container.encode(id, forKey: .id)
           try container.encode(alignmentString, forKey: .alignment)
           try container.encode(spacing, forKey: .spacing)
           try container.encode(paddingString, forKey: .padding)
           try container.encode(elements, forKey: .elements)
    }
    
    // Implementation
    func toSwiftUI() -> AnyView {
        //alignment need to be fixed
        AnyView(VStack(alignment: alignment, spacing: CGFloat(spacing), content: {
            ForEach(elements, id: \.id) { element in
                element.toSwiftUI()
            }
        }))
    }
}

