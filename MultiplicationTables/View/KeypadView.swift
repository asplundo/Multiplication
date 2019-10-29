import SwiftUI

struct KeypadView: View {
    
    let images = ["walrus", "cow", "crocodile", "goat", "hippo", "horse", "owl", "panda", "pig"]
    
    @Binding var answer: String
    var onCommit: () -> Void
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                ForEach(1...3, id: \.self) { number in
                    Button(action: { self.answer += "\(number)" }) {
                        KeypadButton(imageName: self.images[number-1], value: "\(number)")
                    }
                }
            }
            HStack {
                ForEach(4...6, id: \.self) { number in
                    Button(action: { self.answer += "\(number)" }) {
                        KeypadButton(imageName: self.images[number-1], value: "\(number)")
                    }
                }
            }
            HStack {
                ForEach(7...9, id: \.self) { number in
                    Button(action: { self.answer += "\(number)" }) {
                        KeypadButton(imageName: self.images[number-1], value: "\(number)")
                    }
                }
            }
            HStack {
                Button(action: { let _ = self.answer.popLast() }) {
                    KeypadButton(imageName: "snake", value: "SUDDA")
                }
                Button(action: { self.answer += "0" }) {
                    KeypadButton(imageName: "narwhal", value: "0")
                }
                Button(action: { self.onCommit() }) {
                    KeypadButton(imageName: "moose", value: "SVARA")
                }
            }
        }
    }
}

struct KeypadButton: View {
    var imageName: String
    var value: String
    
    var body: some View {
        VStack(alignment: .center) {
            Image(imageName)
                .renderingMode(.original)
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                
            Text(value)
        }
        .frame(width: 80, height: 80, alignment: .center)
        .foregroundColor(.white)
        .background(Color.green.cornerRadius(20))
        
    }
}

struct KeypadView_Previews: PreviewProvider {
    static var previews: some View {
        KeypadView(answer: .constant(""),onCommit: {})
    }
}
