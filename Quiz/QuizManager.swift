//
//  QuizManager.swift
//  Quiz
//
//  Created by Taku Yamada on 2022/06/06.
//

import UIKit

class QuizManager {
    var quizzes: [Quiz]
    var currentIndex: Int
    var score: Int
    
    enum Status {
        case inAnswer // クイズの回答中
        case done // クイズの回答終了
    }
    var status: Status
    
    init() {
        quizzes = []
        quizzes.append(Quiz(text: "人間をでっかいネコだと思っている？", correctAnswer: true, imageName: "cat"))
        quizzes.append(Quiz(text: "イヌは食べ物の美味しさを味よりも匂いで判断している？", correctAnswer: true, imageName: "dog"))
        quizzes.append(Quiz(text: "トラのしましま模様は皮膚まで繋がっていない？", correctAnswer: false, imageName: "tiger"))
        quizzes.append(Quiz(text: "クマは走る時に全部の足がバラバラに動いている？", correctAnswer: true, imageName: "bear"))
        quizzes.append(Quiz(text: "パンダのいちばんの好物は笹である？", correctAnswer: false, imageName: "panda"))
        currentIndex = 0
        score = 0
        status = .inAnswer
    }
    
    // 現在表示されているQuizクラスの変数
    var currentQuiz: Quiz { // 計算型プロパティ
        get { // 値が参照された時に行う処理
            return self.quizzes[currentIndex]
        }
    }
    
    func answerQuiz(answer: Bool) {
        print("👀answer: \(answer)")
        if (self.currentQuiz.correctAnswer == answer) {
            score += 1 // +1する、という意味
        }
    }
    
    func nextQuiz() {
        if currentIndex < quizzes.count - 1 { // 「quizzes.count - 1」は配列の要素番号を示している
            currentIndex += 1 // 次のQuizの要素番号を取得するためにcurrentIndexを+1している
        } else {
            status = .done
        }
    }
}
