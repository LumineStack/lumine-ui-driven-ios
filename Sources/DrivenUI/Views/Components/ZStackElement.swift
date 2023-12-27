//
//  File.swift
//  
//
//  Created by Indra Kurniawan on 13/12/23.
//

import SwiftUI

class ZStackContainer: ViewElement, Codable {
    var id: String
    var alignmentString: String
    var elements: [AnyViewElement]
    
    var alignment: Alignment {
        switch alignmentString {
        case "topLeading":
            return .topLeading
        case "top":
            return .top
        case "topTrailing":
            return .topTrailing
        case "leading":
            return .leading
        case "center":
            return .center
        case "trailing":
            return .trailing
        case "bottomLeading":
            return .bottomLeading
        case "bottom":
            return .bottom
        case "bottomTrailing":
            return .bottomTrailing
        default:
            return .center
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id, alignment, spacing, elements
    }
    
    init(id: String, alignment: String, elements: [AnyViewElement]) {
        self.id = id
        self.alignmentString = alignment
        self.elements = elements
    }
    
    required init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: CodingKeys.self)
          
          // Decode the properties using the appropriate types
          id = try container.decode(String.self, forKey: .id)
          alignmentString = try container.decode(String.self, forKey: .alignment)
          // Temporary solution
          elements = try container.decode([AnyViewElement].self, forKey: .elements)
      }
    
    func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)
           
           // Encode the properties
           try container.encode(id, forKey: .id)
           try container.encode(alignmentString, forKey: .alignment)
            // Temporary solution
           try container.encode(elements, forKey: .elements)
    }
    
    // Implementation
    func toSwiftUI() -> AnyView {
        //alignment need to be fixed
        AnyView(ZStack(alignment: alignment, content: {
            ForEach(elements, id: \.id) { element in
                element.toSwiftUI()
            }
        }))
    }
}
