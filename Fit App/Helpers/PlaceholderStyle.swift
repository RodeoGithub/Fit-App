//  PlaceholderStyle.swift

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
