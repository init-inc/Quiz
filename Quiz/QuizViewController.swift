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
    
    var nameText: String = ""
    
    // 画面が表示される時に実行されるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = self.nameText
    }
}
