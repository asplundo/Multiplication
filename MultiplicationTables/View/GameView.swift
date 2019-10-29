import SwiftUI

struct GameView: View {
    
    @Binding var settings: Settings
    @State private var activeQuestionIndex: Int = 0
    @State private var answer: String = ""
    @State private var correctAnswers = 0
    @State private var gameFinished = false
    
    var body: some View {
        VStack {
            if !gameFinished {
                Text("Vad blir \(activeQuestion.x) * \(activeQuestion.y)")
                    .fontWeight(.heavy)
                    .largeFontStyle()
            }
            if answer != "" {
                Spacer()
                Text(answer)
                    .fontWeight(.heavy)
                    .largeFontStyle()
                    .animation(.default)
            }
            if gameFinished {
                Spacer()
                Text("Du fick \(correctAnswers) av \(settings.numberOfQuestions)")
                    .fontWeight(.heavy)
                    .largeFontStyle()
                    .transition(.slide)
            }
            Spacer()
            if !gameFinished {
                KeypadView(answer: $answer, onCommit: self.checkAnswer)
                    .padding()
                    .background(Color.white.cornerRadius(20))
            }
        }.navigationBarItems(leading: Button("Börja om") {
            self.settings.settingsDone = false
        })
    }
    
    var activeQuestion: Question {
        return settings.questions[activeQuestionIndex]
    }
    
    func checkAnswer() {
        guard let numAnswer = Int(answer) else { return }
        if numAnswer == settings.questions[activeQuestionIndex].answer {
            correctAnswers += 1
        }
        if activeQuestionIndex == settings.questions.count - 1 {
            withAnimation {
                answer = ""
                gameFinished = true
            }
        } else {
            answer = ""
            activeQuestionIndex += 1
        }
    }
}

struct GameView_Previews: PreviewProvider {
    
    static var previews: some View {
        var settings = Settings()
        settings.questions.append(Question(x: 1, y: 1))
        
        return GameView(settings: .constant(settings))
    }
}
