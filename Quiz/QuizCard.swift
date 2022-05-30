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
    
    // 列挙型
    enum QuizStyle {
        case initial // 初期状態
        case right // 正解
        case wrong // 不正解
    }
    
    var style: QuizStyle = .initial {
        didSet {
            self.setQuizStyle(style: style)
        }
    }
    
    func setQuizStyle(style: QuizStyle) {
        switch style {
        case .initial:
            // 背景色に淡いグレー、アイコンは表示しない
            self.backgroundColor = UIColor(named: "normal background")
            self.iconImageView.isHidden = true
        case .right:
            // 背景色に緑、アイコンをtrueの画像で表示
            self.backgroundColor = UIColor(named: "right background")
            self.iconImageView.isHidden = false
            self.iconImageView.image = UIImage(named: "right icon")
        case .wrong:
            // 背景色に赤、アイコンをfalseの画像で表示
            self.backgroundColor = UIColor(named: "wrong background")
            self.iconImageView.isHidden = false
            self.iconImageView.image = UIImage(named: "wrong icon")
        }
    }
}
