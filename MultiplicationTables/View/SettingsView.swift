import SwiftUI

struct SettingsView: View {
    
    @Binding var settings: Settings
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("chick")
                VStack(alignment: .leading) {
                    Text("Hej! Vad kul att du vill lära dig lite multiplikationstabell!")
                    Text("Här nedan ställer du in vilken tabell du vill öva på samt hur många frågor du vill va.")
                }
            }
            Spacer()
            VStack(alignment: .leading) {
                HStack {
                    Image("parrot")
                    Text("Vilken tabell vill du öva på? Byt med knapparna här nere till höger.")
                }
                Stepper("\(settings.multiplicationTable):ans tabell", value: $settings.multiplicationTable, in: 1...12)
            }
            Spacer()
            VStack(alignment: .leading) {
                HStack {
                    Image("parrot")
                    Text("Hur många frågor vill du ha?")
                }
                Stepper("\(settings.numberOfQuestions) frågor tack", value: $settings.numberOfQuestions, in: 5...25, step: 5)
            }
            
            Spacer()
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
        }.padding()
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
