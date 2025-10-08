//
//  View+Extensions.swift
//  Gymnastics Health App
//
//  Created by Joshua Liu on 9/11/24.
//

import SwiftUI

// Custom view extensions
extension View {
    //Custom spacers
    @ViewBuilder
    func hSpacing(_ alignment: Alignment ) -> some View {
        self
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment ) -> some View {
        self
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: alignment)
    }
}
