//
//  inputFieldStyle.swift
//  authentication
//
//  Created by sovanara  on 18/7/26.
//
import SwiftUI

struct inputFieldStyle : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity)
            .frame(height: 32)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.white)
            }
    }
}
