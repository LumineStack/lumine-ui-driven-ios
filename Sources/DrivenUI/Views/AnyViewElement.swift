//
//  File.swift
//
//
//  Created by Indra Kurniawan on 03/12/23.
//

import SwiftUI

// A type-erased wrapper for any ViewElement
struct AnyViewElement: Codable {
    let id: String
    private let base: AnyViewElementBox

    enum CodingKeys: String, CodingKey {
        case id, base
    }
    
    init<E: ViewElement>(_ id: String, base: E) {
        self.id = id
        self.base = AnyViewElementBoxHolder(base)
    }

    func encode(to encoder: Encoder) throws {
        try base.encode(to: encoder)
    }

    func toSwiftUI() -> AnyView {
        base.toSwiftUI()
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: CodingKeys.id)
        let discriminator = try container.decode(Discriminator.self, forKey: CodingKeys.base)
        self.base = try discriminator.metatype.init(from: decoder) as! AnyViewElementBox
    }
}

private class AnyViewElementBox: ViewElement {
    func toSwiftUI() -> AnyView {
        fatalError("Must override")
    }

    func encode(to encoder: Encoder) throws {
        fatalError("Must override")
    }
}

private class AnyViewElementBoxHolder<E: ViewElement>: AnyViewElementBox {
    var base: E

    init(_ base: E) {
        self.base = base
        super.init() // Call to the superclass's initializer
    }
    
    required init(from decoder: Decoder) throws {
        // Initialize properties required by AnyViewElementBox before calling super.init(from:)
        // For example:
        // self.base = ...
        self.base = try decoder.singleValueContainer().decode(E.self)
        try super.init(from: decoder) // Call to the superclass's initializer
    }
    
    override func toSwiftUI() -> AnyView {
        base.toSwiftUI()
    }

    override func encode(to encoder: Encoder) throws {
        try base.encode(to: encoder)
    }
}

// Implement Decodable part here, with a Discriminator enum that helps in identifying types

enum Discriminator: Codable {
    case vstack
    case zstack
    case hstack
    case form
    case section
    case text
    case image
    case button
    case toggle
    case picker
    case slider
    /*
    TODO: Add other types
    case stepper
    case link
    case navigationLink
    case list
    case scrollview
    case spacer
    case rectangle
    case circle
    case ellipse
    case capsule
    case divider
    case shape
    case group
     */
    // ... other types

    var metatype: ViewElement.Type {
        switch self {
        case .vstack:
            return VStackContainer.self
        case .zstack:
            return ZStackContainer.self
        case .hstack:
            return HStackContainer.self
        case .form:
            return FormContainer.self
        case .section:
            return SectionElement.self
        case .text:
            return TextElement.self
        case .image:
            return ImageElement.self
        case .button:
            return ButtonElement.self
        case .toggle:
            return ToggleElement.self
        case .picker:
            return PickerElement.self
        case .slider:
            return SliderElement.self
        /*
        TODO: Add other types
        case .stepper:
            return StepperElement.self
        case .link:
            return LinkElement.self
        case .navigationLink:
            return NavigationLinkElement.self
        case .list:
            return ListElement.self
        case .scrollview:
            return ScrollViewElement.self
        case .spacer:
            return SpacerElement.self
        case .rectangle:
            return RectangleElement.self
        case .circle:
            return CircleElement.self
        case .ellipse:
            return EllipseElement.self
        case .capsule:
            return CapsuleElement.self
        case .divider:
            return DividerElement.self
        case .shape:
            return ShapeElement.self
        case .group:
            return GroupElement.self
         */
        }
    }
}

