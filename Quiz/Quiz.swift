//
//  Quiz.swift
//  Quiz
//
//  Created by Taku Yamada on 2022/06/06.
//

import UIKit

class Quiz {
    let text: String
    let correctAnswer: Bool
    let imageName: String
    
    init(text: String, correctAnswer: Bool, imageName: String) {
        self.text = text
        self.correctAnswer = correctAnswer
        self.imageName = imageName
    }
}
