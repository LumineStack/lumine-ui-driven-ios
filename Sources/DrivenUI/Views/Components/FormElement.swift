//
//  File.swift
//
//
//  Created by Indra Kurniawan on 27/12/23.
//

import SwiftUI

class FormContainer: ViewElement, Codable {
    var id: String
    var elements: [AnyViewElement]
    
    enum CodingKeys: String, CodingKey {
        case id, elements
    }
    
    init(id: String, elements: [AnyViewElement]) {
        self.id = id
        self.elements = elements
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: CodingKeys.id)
        self.elements = try container.decode([AnyViewElement].self, forKey: CodingKeys.elements)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: CodingKeys.id)
        try container.encode(elements, forKey: CodingKeys.elements)
    }
    
    func toSwiftUI() -> AnyView {
        let form = Form {
            ForEach(elements, id: \.id) { element in
                element.toSwiftUI()
            }
        }
        return AnyView(form)
    }
}
