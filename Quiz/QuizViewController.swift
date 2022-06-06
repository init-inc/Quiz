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
    let manager: QuizManager = QuizManager()
    
    var nameText: String = ""
    
    // 画面が表示される時に実行されるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = self.nameText
        
        self.quizCard.style = .initial
        self.loadQuiz()
        // UIPanGestureRecognizerはUI部品をタップした時の処理を記述するためのクラス
        let panGestureRecognizer = UIPanGestureRecognizer(
            target: self, action: #selector(dragQuizCard(_:))
        )
        self.quizCard.addGestureRecognizer(panGestureRecognizer)
    }
    
    func loadQuiz() {
        // クイズの問題文を表示
        self.quizCard.quizLabel.text = manager.currentQuiz.text
        // クイズの画像を表示
        self.quizCard.quizImageView.image = UIImage(named: manager.currentQuiz.imageName)
    }
    
    func answer() {
        // 移動するCGAffineTransformオブジェクト(1)
        var translationTransform: CGAffineTransform
        // X軸方向の移動距離
        let screenWidth = UIScreen.main.bounds.width
        // Y軸方向の移動距離
        let y = UIScreen.main.bounds.height * 0.2
        
        // 回答によってtranslationTransformの内容を変える(2)
        if self.quizCard.style == .right {
            // ◯回答のときは右へ移動
            translationTransform = CGAffineTransform(translationX: screenWidth, y: y)
            self.manager.answerQuiz(answer: true)
        } else {
            // ✗回答のときは左へ移動
            translationTransform = CGAffineTransform(translationX: -screenWidth, y: y)
            self.manager.answerQuiz(answer: false)
        }
        
        // クイズカードをアニメーションさせて移動する(3)
        // 0.1秒遅延させて0.5秒でカードを移動する
        UIView.animate(withDuration: 0.5, delay: 0.1, options: [.curveLinear], animations: {
            // クイズカードのtransformプロパティにtranslationTransformを設定
            self.quizCard.transform = translationTransform
        }, completion: { [unowned self] (finished) in
            if finished {
                // 動作確認のため、スコアをコンソールに表示
                print(self.manager.score)
            }
            
        })
    }
    
    @objc func dragQuizCard(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began, .changed:
            self.transformQuizCard(gesture: sender)
        case .ended:
            self.answer()
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
