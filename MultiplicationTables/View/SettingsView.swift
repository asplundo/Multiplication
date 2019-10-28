import SwiftUI

struct SettingsView: View {
    
    @Binding var settings: Settings
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Multiplikationstabell att öva på?")) {
                    Stepper("\(settings.multiplicationTable)", value: $settings.multiplicationTable, in: 1...12)
                }
                Section(header: Text("Hur många frågor vill du ha?")) {
                    Stepper("\(settings.numberOfQuestions)", value: $settings.numberOfQuestions, in: 5...25, step: 5)
                }
            }
            Spacer()
            Button("Starta") {
                self.commit()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
        }
    }
    
    private func commit() {
        for _ in 0..<settings.numberOfQuestions {
            settings.questions.append(Question(x: settings.multiplicationTable, y: Int.random(in: 1...settings.numberOfQuestions)))
        }
        settings.settingsDone.toggle()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(settings: .constant(Settings()))
    }
}
