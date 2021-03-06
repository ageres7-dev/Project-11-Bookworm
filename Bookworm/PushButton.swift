//
//  PushButton.swift
//  Bookworm
//
//  Created by Sergey Dolgikh on 19.12.2021.
//

import SwiftUI

struct PushButton: View {
    var title: String
    @Binding var isOn: Bool
    
    let onColors = [Color.red, Color.yellow]
    let ofColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background {
            LinearGradient(
                colors: isOn ? onColors : ofColors,
                startPoint: .top,
                endPoint: .bottom
            )
        }
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct PushButton_Previews: PreviewProvider {
    
    static var previews: some View {
        PushButton(title: "Test", isOn: .constant(true))
    }
}
