//
//  File.swift
//
//
//  Created by Indra Kurniawan on 27/12/23.
//

import SwiftUI

class ToggleElement: ViewElement, Codable {
    var id: String
    var isOn: Bool
    var label: String
    
    enum CodingKeys: String, CodingKey {
        case id, isOn, label
    }
    
    init(id: String, isOn: Bool, label: String) {
        self.id = id
        self.isOn = isOn
        self.label = label
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: CodingKeys.id)
        self.isOn = try container.decode(Bool.self, forKey: CodingKeys.isOn)
        self.label = try container.decode(String.self, forKey: CodingKeys.label)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: CodingKeys.id)
        try container.encode(isOn, forKey: CodingKeys.isOn)
        try container.encode(label, forKey: CodingKeys.label)
    }
    
    func toSwiftUI() -> AnyView {
        let toggle = Toggle(isOn: .constant(isOn), label: {
            Text(label)
        })
        return AnyView(toggle)
    }
    
}
