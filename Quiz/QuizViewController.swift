//
//  QuizViewController.swift
//  Quiz
//
//  Created by Taku Yamada on 2022/05/16.
//

import Foundation
import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var quizCard: QuizCard!
    
    var nameText: String = ""
    
    // 画面が表示される時に実行されるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = self.nameText
        
        self.quizCard.style = .initial
        // UIPanGestureRecognizerはUI部品をタップした時の処理を記述するためのクラス
        let panGestureRecognizer = UIPanGestureRecognizer(
            target: self, action: #selector(dragQuizCard(_:))
        )
        self.quizCard.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc func dragQuizCard(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began, .changed:
            self.transformQuizCard(gesture: sender)
        case .ended:
            break
        default:
            break
        }
    }
    
    func transformQuizCard(gesture: UIPanGestureRecognizer) {
        // スワイプされた時の動きに併せてquizCardを移動させる処理
        // スワイプ時に移動した距離を取得
        let translation = gesture.translation(in: self.quizCard)
        // 移動した距離を元にCGAffineTransformクラスのオブジェクトを取得
        let translationTransform = CGAffineTransform(
            translationX: translation.x, y: translation.y
        )
        // 画面幅の半分に対する移動した距離の割合を計算
        let translationPercent = translation.x / UIScreen.main.bounds.width / 2
        // 割合に対して角度を算出
        let rotaionAngle = CGFloat.pi / 3 * translationPercent
        // 算出した角度でのCGAffineTransformクラスオブジェクトを作成
        let rotationTransform = CGAffineTransform(rotationAngle: rotaionAngle)
        // 変換したオブジェクトを合成
        let transform = translationTransform.concatenating(rotationTransform)
        // 変換したオブジェクトをクイズカードに適用
        self.quizCard.transform = transform
        
        // スワイプされた位置(X軸の座標)に応じてクイズカードの状態を判別
        if translation.x > 0 {
            self.quizCard.style = .right
        } else {
            self.quizCard.style = .wrong
        }
    }
}
