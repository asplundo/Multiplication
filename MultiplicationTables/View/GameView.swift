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
                TextField("Ditt svar här", text: $answer, onCommit: { self.checkAnswer() })
                    .keyboardType(.numberPad)
                .padding()
            } else {
                Text("Du fick \(correctAnswers) av \(settings.numberOfQuestions)")
            }
        }
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
            gameFinished = true
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
