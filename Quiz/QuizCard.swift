//
//  QuizCard.swift
//  Quiz
//
//  Created by Taku Yamada on 2022/05/23.
//

import UIKit

class QuizCard: UIView {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var quizImageView: UIImageView!
    @IBOutlet weak var quizLabel: UILabel!
    
    enum QuizStyle {
        case initial
        case right
        case wrong
    }
    
    var style: QuizStyle = .initial {
        didSet {
            self.setQuizStyle(style: style)
        }
    }
    
    func setQuizStyle(style: QuizStyle) {}
}
