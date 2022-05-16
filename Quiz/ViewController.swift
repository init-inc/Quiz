//
//  ViewController.swift
//  Quiz
//
//  Created by Taku Yamada on 2022/04/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func pressButton(_ sender: Any) {
    }
    
    // 画面遷移をする時に実行されるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 画面の遷移先がもしQuizViewControllerだったら実行されるメソッド
        if let quizViewController = segue.destination as? QuizViewController {
            if let text = self.nameTextField.text {
                quizViewController.nameText = text
            }
        }
    }
}

