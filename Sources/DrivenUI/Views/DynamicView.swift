//
//  File.swift
//  
//
//  Created by Indra Kurniawan on 03/12/23.
//

import SwiftUI

struct DynamicView: View {
    let rootViewElement: AnyViewElement

    var body: some View {
        rootViewElement.toSwiftUI()
    }
}
