//
//  File.swift
//  
//
//  Created by Indra Kurniawan on 03/12/23.
//

import SwiftUI

// Base protocol for all elements
protocol ViewElement: Codable {
    func toSwiftUI() -> AnyView
    func encode(to encoder: Encoder) throws
}
