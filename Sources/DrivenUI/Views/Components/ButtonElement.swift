//
//  File.swift
//
//
//  Created by Indra Kurniawan on 26/12/23.
//

import SwiftUI

class ButtonElement: ViewElement, Codable {
    var id: String
    var title: String
    var action: String
    var elements: [AnyViewElement]
    
    enum CodingKeys: String, CodingKey {
        case id, title, action, elements
    }
    
    init(id: String, title: String, action: String, elements: [AnyViewElement]) {
        self.id = id
        self.title = title
        self.action = action
        self.elements = elements
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: CodingKeys.id)
        self.title = try container.decode(String.self, forKey: CodingKeys.title)
        self.action = try container.decode(String.self, forKey: CodingKeys.action)
        self.elements = try container.decode([AnyViewElement].self, forKey: CodingKeys.elements)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: CodingKeys.id)
        try container.encode(title, forKey: CodingKeys.title)
        try container.encode(action, forKey: CodingKeys.action)
        try container.encode(elements, forKey: CodingKeys.elements)
    }
    
    func toSwiftUI() -> AnyView {
        let button = Button(action: {
            self.invokeMethod(action: self.action)
        }) {
            Text(title)
        }
        return AnyView(button)
    }
}

extension ButtonElement {
    func someMethod(parameter: String) {
        // implementation
    }
    
    func invokeMethod(action: String) {
        let components = action.components(separatedBy: "(")
        let methodName = components[0]
        let parameters = components[1]
            .components(separatedBy: ")")[0]
            .components(separatedBy: ",")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        
        switch methodName {
        case "someMethod":
            someMethod(parameter: parameters[0])
        default:
            break
        }
    }
}

