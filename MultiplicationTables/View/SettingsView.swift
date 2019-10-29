import SwiftUI

struct SettingsView: View {
    
    @Binding var settings: Settings
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Image("chick")
                    VStack(alignment: .leading) {
                        Text("Hej! Vad kul att du vill lära dig lite multiplikationstabell!")
                        Text("Här nedan ställer du in vilken tabell du vill öva på samt hur många frågor du vill va.")
                    }
                }
                .padding()
                .background(Color.white.cornerRadius(20))
                Spacer()
                VStack(alignment: .leading) {
                    HStack {
                        Image("parrot")
                        Text("Vilken tabell vill du öva på? Byt med knapparna här nere till höger.")
                    }
                    Stepper("\(settings.multiplicationTable):ans tabell", value: $settings.multiplicationTable, in: 1...12)
                    
                }
                .padding()
                .background(Color.white.cornerRadius(20))
                Spacer()
                VStack(alignment: .leading) {
                    HStack {
                        Image("penguin")
                        Text("Hur många frågor vill du ha?")
                    }
                    Stepper("\(settings.numberOfQuestions) frågor tack", value: $settings.numberOfQuestions, in: 5...25, step: 5)
                }
                .padding()
                .background(Color.white.cornerRadius(20))
                Spacer()
                VStack {
                    HStack {
                        Image("duck")
                        Text("Om du är redo att börja så är det bara att trycka på startkvacken.")
                    }
                    Button("Starta") {
                        self.commit()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                }
                .padding()
                .background(Color.white.cornerRadius(20))
            }
        }
        .padding()
        .onAppear {
            self.settings.numberOfQuestions = 5
            self.settings.multiplicationTable = 1
            self.settings.questions.removeAll()
        }
    }
    
    private func commit() {
        for _ in 0..<settings.numberOfQuestions {
            settings.questions.append(Question(x: settings.multiplicationTable, y: Int.random(in: 1...settings.numberOfQuestions)))
        }
        withAnimation {
            settings.settingsDone.toggle()
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(settings: .constant(Settings()))
    }
}
