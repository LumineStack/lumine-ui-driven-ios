//
//  File.swift
//
//
//  Created by Indra Kurniawan on 27/12/23.
//

import SwiftUI

class SliderElement: ViewElement, Codable {
    var id: String
    var value: Double
    var label: String
    var range: ClosedRange<Double>
    
    enum CodingKeys: String, CodingKey {
        case id, value, label, range
    }
    
    init(id: String, value: Double, label: String, range: ClosedRange<Double>) {
        self.id = id
        self.value = value
        self.label = label
        self.range = range
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: CodingKeys.id)
        self.value = try container.decode(Double.self, forKey: CodingKeys.value)
        self.label = try container.decode(String.self, forKey: CodingKeys.label)
        self.range = try container.decode(ClosedRange<Double>.self, forKey: CodingKeys.range)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: CodingKeys.id)
        try container.encode(value, forKey: CodingKeys.value)
        try container.encode(label, forKey: CodingKeys.label)
        try container.encode(range, forKey: CodingKeys.range)
    }
    
    func toSwiftUI() -> AnyView {
        let slider = Slider(value: .constant(value), in: range, label: {
            Text(label)
        })
        return AnyView(slider)
    }
    
}
