import SwiftUI

struct LargeFontModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .padding()
            .background(Color.white.cornerRadius(20))
    }
}

extension View {
    func largeFontStyle() -> some View {
        self.modifier(LargeFontModifier())
    }
}
