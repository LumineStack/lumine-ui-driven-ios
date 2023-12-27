//
//  File.swift
//  
//
//  Created by Indra Kurniawan on 13/12/23.
//

import SwiftUI

enum FontWeight: String, Codable {
    case regular
    case bold
    case semibold
    // Add other weights as needed
}

extension FontWeight {
    var fontWeight: Font.Weight {
        switch self {
        case .regular:
            return .regular
        case .bold:
            return .bold
        case .semibold:
            return .semibold
        // Handle other cases
        }
    }
}


