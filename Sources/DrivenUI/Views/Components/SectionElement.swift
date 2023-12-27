//
//  File.swift
//
//
//  Created by Indra Kurniawan on 27/12/23.
//

import SwiftUI

class SectionElement: ViewElement, Codable {
    var id: String
    var title: String
    var elements: [AnyViewElement]
    
    enum CodingKeys: String, CodingKey {
        case id, title, elements
    }
    
    init(id: String, title: String, elements: [AnyViewElement]) {
        self.id = id
        self.title = title
        self.elements = elements
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: CodingKeys.id)
        self.title = try container.decode(String.self, forKey: CodingKeys.title)
        self.elements = try container.decode([AnyViewElement].self, forKey: CodingKeys.elements)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: CodingKeys.id)
        try container.encode(title, forKey: CodingKeys.title)
        try container.encode(elements, forKey: CodingKeys.elements)
    }
    
    func toSwiftUI() -> AnyView {
        let section = Section(header: Text(title)) {
            ForEach(elements, id: \.id) { element in
                element.toSwiftUI()
            }
        }
        return AnyView(section)
    }
}
