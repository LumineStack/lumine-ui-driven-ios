//
//  File.swift
//  
//
//  Created by Indra Kurniawan on 21/12/23.
//

import SwiftUI

class TextFieldElement: ViewElement, Codable {
    var id: String
    @Binding var text: String
    var placeholder: String
    var isSecureTextEntry: Bool
    var keyboardTypeString: String
    var autocapitalizationTypeString: String
    var autocorrectionTypeString: String
    var textContentTypeString: String
    var returnKeyTypeString: String
    var elements: [AnyViewElement]
    
    var keyboardType: UIKeyboardType {
        switch keyboardTypeString {
        case "asciiCapable":
            return .asciiCapable
        case "numbersAndPunctuation":
            return .numbersAndPunctuation
        case "URL":
            return .URL
        case "numberPad":
            return .numberPad
        case "phonePad":
            return .phonePad
        case "namePhonePad":
            return .namePhonePad
        case "emailAddress":
            return .emailAddress
        case "decimalPad":
            return .decimalPad
        case "twitter":
            return .twitter
        case "webSearch":
            return .webSearch
        case "asciiCapableNumberPad":
            return .asciiCapableNumberPad
        case "alphabet":
            return .alphabet
        default:
            return .default
        }
    }
    
    var autocapitalizationType: UITextAutocapitalizationType {
        switch autocapitalizationTypeString {
        case "none":
            return .none
        case "words":
            return .words
        case "sentences":
            return .sentences
        case "allCharacters":
            return .allCharacters
        default:
            return .none
        }
    }
    
    var autocorrectionType: UITextAutocorrectionType {
        switch autocorrectionTypeString {
        case "default":
            return .default
        case "no":
            return .no
        case "yes":
            return .yes
        default:
            return .default
        }
    }
    
    init(id: String, text: Binding<String>, placeholder: String, isSecureTextEntry: Bool, keyboardType: String, autocapitalizationType: String, autocorrectionType: String, textContentType: String, returnKeyType: String, elements: [AnyViewElement]) {
        self.id = id
        self._text = text
        self.placeholder = placeholder
        self.isSecureTextEntry = isSecureTextEntry
        self.keyboardTypeString = keyboardType
        self.autocapitalizationTypeString = autocapitalizationType
        self.autocorrectionTypeString = autocorrectionType
        self.textContentTypeString = textContentType
        self.returnKeyTypeString = returnKeyType
        self.elements = elements
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        placeholder = try container.decode(String.self, forKey: .placeholder)
        isSecureTextEntry = try container.decode(Bool.self, forKey: .isSecureTextEntry)
        keyboardTypeString = try container.decode(String.self, forKey: .keyboardType)
        autocapitalizationTypeString = try container.decode(String.self, forKey: .autocapitalizationType)
        autocorrectionTypeString = try container.decode(String.self, forKey: .autocorrectionType)
        textContentTypeString = try container.decode(String.self, forKey: .textContentType)
        returnKeyTypeString = try container.decode(String.self, forKey: .returnKeyType)
        elements = try container.decode([AnyViewElement].self, forKey: .elements)
        
        _text = Binding.constant("") // Temporary value, should be set externally
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(placeholder, forKey: .placeholder)
        try container.encode(isSecureTextEntry, forKey: .isSecureTextEntry)
        try container.encode(keyboardTypeString, forKey: .keyboardType)
        try container.encode(autocapitalizationTypeString, forKey: .autocapitalizationType)
        try container.encode(autocorrectionTypeString, forKey: .autocorrectionType)
        try container.encode(textContentTypeString, forKey: .textContentType)
        try container.encode(returnKeyTypeString, forKey: .returnKeyType)
        try container.encode(elements, forKey: .elements)
        
        _text = Binding.constant("") // Temporary value, should be set externally
    }
    
    enum CodingKeys: String, CodingKey {
        case id, placeholder, isSecureTextEntry, keyboardType, autocapitalizationType, autocorrectionType, textContentType, returnKeyType, elements
    }
    
    func toSwiftUI() -> AnyView {
        let textField = TextField(placeholder, text: $text)
            .keyboardType(keyboardType)
            .autocapitalization(autocapitalizationType)
        return AnyView(textField)
    }
}
