
import Foundation

struct Settings {
    var multiplicationTable: Int = 1
    var numberOfQuestions: Int = 5
    var questions: [Question] = []
    var settingsDone: Bool = false
}

struct Question: Identifiable {
    var id = UUID().uuidString
    var x: Int
    var y: Int
    
    var answer: Int {
        return x*y
    }
}
