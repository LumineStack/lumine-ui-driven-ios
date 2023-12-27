//
//  File.swift
//
//
//  Created by Indra Kurniawan on 27/12/23.
//

import SwiftUI

class PickerElement: ViewElement, Codable {
    var id: String
    var selection: Int
    var label: String
    var options: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, selection, label, options
    }
    
    init(id: String, selection: Int, label: String, options: [String]) {
        self.id = id
        self.selection = selection
        self.label = label
        self.options = options
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: CodingKeys.id)
        self.selection = try container.decode(Int.self, forKey: CodingKeys.selection)
        self.label = try container.decode(String.self, forKey: CodingKeys.label)
        self.options = try container.decode([String].self, forKey: CodingKeys.options)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: CodingKeys.id)
        try container.encode(selection, forKey: CodingKeys.selection)
        try container.encode(label, forKey: CodingKeys.label)
        try container.encode(options, forKey: CodingKeys.options)
    }
    
    func toSwiftUI() -> AnyView {
        let picker = Picker(selection: .constant(selection), label: Text(label)) {
            ForEach(options.indices) { index in
                Text(self.options[index]).tag(index)
            }
        }
        return AnyView(picker)
    }
}
