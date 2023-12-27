//
//  File.swift
//
//
//  Created by Indra Kurniawan on 27/12/23.
//

import SwiftUI

class ImageElement: ViewElement, Codable {
    var id: String
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case id, image
    }
    
    init(id: String, image: String) {
        self.id = id
        self.image = image
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: CodingKeys.id)
        self.image = try container.decode(String.self, forKey: CodingKeys.image)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: CodingKeys.id)
        try container.encode(image, forKey: CodingKeys.image)
    }
    
    func toSwiftUI() -> AnyView {
        let image = Image(image)
        return AnyView(image)
    }
}
