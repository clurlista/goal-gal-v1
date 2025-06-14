//
//  HeaderFont.swift
//  WomensFootballApp
//
//  Created by Claire Lister on 23/07/2024.
//

import SwiftUI

struct HeaderFont: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.custom("Digital Arcade Regular", size: 26))
    }
}

extension View {
    func headerFont() -> some View {
         modifier(HeaderFont())
    }
}
