//
//  PlaceholderStyle.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 22/03/2021.
//

import SwiftUI

public struct PlaceholderStyle: ViewModifier {
    var showPlaceholder: Bool
    var placeholder: String
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceholder {
                Text(placeholder)
                    .padding(.horizontal,15)
            }
            content
                .foregroundColor(Color.gray)
                .padding(5.0)
        }
    }
}
