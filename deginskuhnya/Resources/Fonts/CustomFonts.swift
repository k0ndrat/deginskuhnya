//
//  CustomFonts.swift
//  deginskuhnya
//
//  Created by Vladislav Condratiev on 14.08.2021.
//

import SwiftUI


enum textStyle {
    case regular
    case bold
}

struct TextModifer: ViewModifier {
    var textStyle: textStyle
    var color = Color.white
    var size: CGFloat
   
    func body(content: Content) -> some View {
        switch textStyle {
        case .regular:
            return content
                .font(.custom("Quicksand-Regular", size: size))
                .foregroundColor(color)
        case .bold:
            return content
                .font(.custom("Quicksand-Bold", size: size))
                .foregroundColor(color)
        }
    }
}
